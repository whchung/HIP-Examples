#!/usr/bin/python3.7

import os
import re
import subprocess

import liveness

ROC_OBJ_LS_PATH = "/opt/rocm/hip/bin/roc-obj-ls"
ROC_OBJ_EXTRACT_PATH = "/opt/rocm/hip/bin/roc-obj-extract"
LLVM_OBJDUMP_PATH = "/opt/rocm/llvm/bin/llvm-objdump"

GFXARCH_REGEX = r'^.*gfx90a:xnack-[ \t]+(.+)'

LIBRCCL_PATH = "/home/whchung/rccl/build/librccl.so"
RCCL_KERNEL_NAME = "_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommPvP8ncclWork"

def run_external_binary(binary_path, arguments=[]):
    try:
        # Run the external binary and capture its standard output
        result = subprocess.run([binary_path] + arguments, capture_output=True, text=True)

        # Check if the process was successful
        if result.returncode == 0:
            return result.stdout.strip()  # Return the standard output
        else:
            return f"Error: The external binary returned non-zero exit code {result.returncode}."
    except FileNotFoundError:
        return "Error: The binary could not be found."
    except Exception as e:
        return f"An error occurred: {str(e)}."

def fetch_number(byte_list, offset, length):
  value = 0
  for i in range(length):
    value = value + 256 ** i * byte_list[i + offset]
  return value

def fetch_subbyte_number(byte_list, offset_in_bits, length_in_bits):
  value = fetch_number(byte_list, 0, 4)
  #print(value)
  mask = ((1 << length_in_bits) - 1) << offset_in_bits
  #print(mask)
  extracted_bits = (value & mask) >> offset_in_bits
  return extracted_bits

def get_code_object(library_path):
  # run roc-obj-ls
  roc_obj_ls_output = run_external_binary(ROC_OBJ_LS_PATH, [library_path])
  code_object_uri = ""
  for line in roc_obj_ls_output.splitlines():
    m = re.search(GFXARCH_REGEX, line)
    if m is not None:
      code_object_uri = m.group(1)
      break
  
  # run roc-obj-extract
  run_external_binary(ROC_OBJ_EXTRACT_PATH, [code_object_uri])
  
  code_object_filename = os.path.basename(code_object_uri)
  code_object_filename = re.sub(r'[&#]', '-', code_object_filename)
  code_object_filename = re.sub(r'[=]', '', code_object_filename) + ".co"
  return code_object_filename

def get_symbol(code_object_filename, symbol_name):
  # dump symbols
  symbols = run_external_binary(LLVM_OBJDUMP_PATH, ["-t", code_object_filename])
  descriptor_address = 0
  descriptor_length = 0
  kernel_address = 0
  kernel_length = 0
  for line in symbols.splitlines():
    m = re.search(symbol_name, line)
    if m is not None:
      tokens = line.split()
      if tokens[3] == ".text":
        #print("\nKernel code: " + tokens[6]) 
        #print("Address: " + tokens[0])
        #print("Length: " + tokens[4])
        kernel_address = int(tokens[0], 16)
        kernel_length = int(tokens[4], 16)
        pass
      elif tokens[3] == ".rodata":
        #print("\nKernel desc: " + tokens[6]) 
        #print("Address: " + tokens[0])
        #print("Length: " + tokens[4])
        descriptor_address = int(tokens[0], 16)
        descriptor_length = int(tokens[4], 16)

  return [descriptor_address, descriptor_length, kernel_address, kernel_length]

FIRST_INPUT = 0
LAST_INPUT = 1
FIRST_OUTPUT = 2
LAST_OUTPUT = 3
def deduce_descriptor_from_liveness_analysis(liveness_dict, descriptor_dict):
  # Understand the number of SGPRs set by CP from RSRC2
  user_sgpr_cp_count = descriptor_dict["user_sgpr_cp_count"]

  # Understand the number of SGPRs set by ADC from RSRC2
  user_sgpr_adc_count = descriptor_dict["amdhsa_system_sgpr_workgroup_id_x"] + descriptor_dict["amdhsa_system_sgpr_workgroup_id_y"] + descriptor_dict["amdhsa_system_sgpr_workgroup_id_z"]

  [max_sgpr, max_vgpr, max_agpr] = liveness.get_register_usage(liveness_dict)

  # Set SGPR, VGPR, AGPR information
  descriptor_dict["amdhsa_next_free_sgpr"] = max_sgpr
  descriptor_dict["amdhsa_next_free_vgpr"] = max_vgpr
  if max_agpr != 0:
    descriptor_dict["amdhsa_accum_offset"] = max_agpr

  # Identify each SGPR be initialized by ADC
  sgpr_initialized_by_adc = []
  for sgpr in range(user_sgpr_cp_count, user_sgpr_cp_count + user_sgpr_adc_count):
    l = liveness_dict.get('s' + str(sgpr))
    if l is not None and (l[0] < l[2]):
      sgpr_initialized_by_adc.append(sgpr)
  descriptor_dict["user_sgpr_adc_count"] = len(sgpr_initialized_by_adc)
  #print("ADC: ", sgpr_initialized_by_adc)

  # Identify each SGPR be initialized by CP
  sgpr_initialized_by_cp = []
  for sgpr in range(user_sgpr_cp_count):
    l = liveness_dict.get('s' + str(sgpr))
    if l is not None and (l[0] < l[2]):
      sgpr_initialized_by_cp.append(sgpr)

  #print("CP: ", sgpr_initialized_by_cp)

  # TBD. Logic here is quite ad-hoc. Need further improvement.
  if user_sgpr_cp_count == 12:
    # private segment buffer is used
    # dispatch ptr is used
    # queue ptr is used
    # kernarg segment ptr is used
    # flat scratch init is used
    descriptor_dict["amdhsa_user_sgpr_private_segment_buffer"] = 1
    descriptor_dict["amdhsa_user_sgpr_dispatch_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_flat_scratch_init"] = 1

    descriptor_dict["private_segment_buffer"] = [0, 1, 2, 3]
    descriptor_dict["dispatch_ptr"] = [4, 5]
    descriptor_dict["queue_ptr"] = [6, 7]
    descriptor_dict["kernarg_segment_ptr"] = [8, 9]
    descriptor_dict["flat_scratch_init"] = [10, 11]
  elif user_sgpr_cp_count == 10:
    # private segment buffer is used
    # dispatch ptr is used
    # queue ptr is used
    # kernarg segment ptr is used
    descriptor_dict["amdhsa_user_sgpr_private_segment_buffer"] = 1
    descriptor_dict["amdhsa_user_sgpr_dispatch_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1

    descriptor_dict["private_segment_buffer"] = [0, 1, 2, 3]
    descriptor_dict["dispatch_ptr"] = [4, 5]
    descriptor_dict["queue_ptr"] = [6, 7]
    descriptor_dict["kernarg_segment_ptr"] = [8, 9]
  elif user_sgpr_cp_count == 8:
    # private segment buffer is used
    # either dispatch ptr or queue ptr is used, HAVE TO GUESS
    # kernarg segment ptr is used
    descriptor_dict["amdhsa_user_sgpr_private_segment_buffer"] = 1
    # XXX. TBD. Force guess on the dispatch ptr for now.
    descriptor_dict["amdhsa_user_sgpr_dispatch_ptr"] = 1
    #descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1

    descriptor_dict["private_segment_buffer"] = [0, 1, 2, 3]
    descriptor_dict["dispatch_ptr"] = [4, 5]
    # XXX. TBD. Force guess on the dispatch ptr for now.
    #descriptor_dict["queue_ptr"] = [6, 7]
    descriptor_dict["kernarg_segment_ptr"] = [6, 7]
  elif user_sgpr_cp_count == 6:
    # private segment buffer is used
    # kernarg segment ptr is used
    descriptor_dict["amdhsa_user_sgpr_private_segment_buffer"] = 1
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1

    descriptor_dict["private_segment_buffer"] = [0, 1, 2, 3]
    descriptor_dict["kernarg_segment_ptr"] = [4, 5]
  elif user_sgpr_cp_count == 2:
    # kernarg segment ptr is used
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1

    descriptor_dict["kernarg_segment_ptr"] = [0, 1]
  else:
    print("Unknown SGPR CP count!")
    exit(-1)


  # len(sgpr_initialized_by_cp) might be less then user_sgpr_cp_count
  # as some register might be initialized by CP but not used.

  for feature in ["private_segment_buffer", "dispatch_ptr", "queue_ptr", "kernarg_segment_ptr", "flat_scratch_init"]:
    for reg in descriptor_dict[feature]:
      if reg not in sgpr_initialized_by_cp:
        descriptor_dict[feature] = []
        break

  return

def get_descriptor(code_object_filename, descriptor_address, descriptor_length, liveness_dict = None):
  # get descriptor
  descriptor_raw_text = run_external_binary(LLVM_OBJDUMP_PATH, ["-s", "--section=.rodata", code_object_filename])
  descriptor_length_remaining = descriptor_length
  descriptor = []
  for line in descriptor_raw_text.splitlines()[2:]:
    tokens = line.split()
    if int(tokens[0], 16) == descriptor_address:
      descriptor_found = True
  
    if descriptor_found == True:
      descriptor_length_remaining = descriptor_length_remaining - 16
      for token in tokens[1:5]:
        for byte in range(4):
          descriptor.append(int(token[byte * 2 : byte * 2 + 2], 16))
      #print(line)
  
    if descriptor_length_remaining <= 0:
      break
  
  descriptor_dict = {}
  # Obtain LDS size
  lds_size = fetch_number(descriptor, 0, 4)
  descriptor_dict["amdhsa_group_segment_fixed_size"] = lds_size
  #print("GROUP SEGMENT: " + str(lds_size))
  
  # Obtain kernarg size
  kernarg_size = fetch_number(descriptor, 8, 4) 
  descriptor_dict["amdhsa_kernarg_size"] = kernarg_size
  #print("KERNARG: " + str(kernarg_size))

  # Obtain information from RSRC2
  #print("PRIVATE SEGMENT: " + str(fetch_subbyte_number(descriptor[52:], 0, 1)))
  user_sgpr_cp_count = fetch_subbyte_number(descriptor[52:], 1, 5)
  descriptor_dict["user_sgpr_cp_count"] = user_sgpr_cp_count
  #print("Guest user_sgpr_cp_count: " + str(user_sgpr_cp_count))
  #print("USER SGPR COUNT: " + str(fetch_subbyte_number(descriptor[52:], 1, 5)))
  descriptor_dict["amdhsa_system_sgpr_workgroup_id_x"] = fetch_subbyte_number(descriptor[52:], 7, 1)
  descriptor_dict["amdhsa_system_sgpr_workgroup_id_y"] = fetch_subbyte_number(descriptor[52:], 8, 1)
  descriptor_dict["amdhsa_system_sgpr_workgroup_id_z"] = fetch_subbyte_number(descriptor[52:], 9, 1)
  #print("SGPR WORKGROUP ID X: " + str(fetch_subbyte_number(descriptor[52:], 7, 1)))
  #print("SGPR WORKGROUP ID Y: " + str(fetch_subbyte_number(descriptor[52:], 8, 1)))
  #print("SGPR WORKGROUP ID Z: " + str(fetch_subbyte_number(descriptor[52:], 9, 1)))
  #workitem_id_enum = fetch_subbyte_number(descriptor[52:], 11, 2)
  #if workitem_id_enum == 0:
  #  print("VGPR WORKITEM ID: X")
  #elif workitem_id_enum == 1:
  #  print("VGPR WORKITEM ID: X / Y")
  #elif workitem_id_enum == 2:
  #  print("VGPR WORKITEM ID: X / Y / Z")

  # Obtain information from RSRC3
  accum_offset = fetch_subbyte_number(descriptor[44:], 0, 6) * 4
  descriptor_dict["amdhsa_accum_offset"] = accum_offset
  #print("AGPR ACCUM OFFSET: " + str(accum_offset))

  # Obtain information from liveness analysis, or from RSRC1 (less precise)
  if liveness_dict is not None:
    deduce_descriptor_from_liveness_analysis(liveness_dict, descriptor_dict)
  else:
    # XXX. If there is no liveness analysis data, use hard-coded values.
    descriptor_dict["kernarg_segment_ptr"] = [4, 5]
  
    # Obtain information from RSRC1
    next_free_sgpr = fetch_subbyte_number(descriptor[48:], 6, 4) * 16
    next_free_vgpr = fetch_subbyte_number(descriptor[48:], 0, 6) * 8
    descriptor_dict["amdhsa_next_free_sgpr"] = next_free_sgpr
    descriptor_dict["amdhsa_next_free_vgpr"] = next_free_vgpr
    #print("SGPR: " + str(next_free_sgpr))
    #print("VGPR: " + str(next_free_vgpr))
  
  return descriptor_dict

def get_isa(code_object_filename, symbol_name):
  # disassemble ISA
  isa = run_external_binary(LLVM_OBJDUMP_PATH, ["--disassemble-symbols=" + symbol_name, code_object_filename])
  isa = isa.splitlines()[5:]
  return isa

def main():
  code_object_filename = get_code_object(LIBRCCL_PATH)
  [descriptor_address, descriptor_length, kernel_address, kernel_length] = get_symbol(code_object_filename, RCCL_KERNEL_NAME)

  isa = get_isa(code_object_filename, RCCL_KERNEL_NAME)
  #for line in isa:
  #  print(line)

  liveness_dict = liveness.liveness_analysis(isa)

  descriptor_dict = get_descriptor(code_object_filename, descriptor_address, descriptor_length, liveness_dict)
  print(descriptor_dict)

if __name__ == "__main__":
  main()
