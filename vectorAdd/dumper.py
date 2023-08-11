#!/usr/bin/python3

import os
import re
import subprocess

import liveness

ROC_OBJ_LS_PATH = "/opt/rocm/hip/bin/roc-obj-ls"
ROC_OBJ_EXTRACT_PATH = "/opt/rocm/hip/bin/roc-obj-extract"
LLVM_OBJDUMP_PATH = "/opt/rocm/llvm/bin/llvm-objdump"

GFXARCH_REGEX = r'^.*gfx90a:xnack-[ \t]+(.+)'

S_GETPC_REGEX = r'^[ \t]+s_getpc_b64 s\[([0-9]+):([0-9]+)\][ \t]+// ([0-9A-F]+):'
MODIFY_PC_REGEX = r'^[ \t]+s_addc?_u32 s([0-9]+), s([0-9]+), (0x?[0-9a-f]+|-?[0-9]+)[ \t]+// ([0-9A-F]+):'

LIBRCCL_PATH = "/home/jack/projects/rccl/build/librccl.so"
RCCL_KERNEL_NAME = "_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork"

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
  
  code_object_filename = os.path.basename(code_object_uri)
  code_object_filename = re.sub(r'[&#]', '-', code_object_filename)
  code_object_filename = re.sub(r'[=]', '', code_object_filename) + ".co"

  if os.path.exists(code_object_filename):
    pass
  else:
    # run roc-obj-extract
    # this step is very time-consuming
    run_external_binary(ROC_OBJ_EXTRACT_PATH, [code_object_uri])
    
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

  # Obtain private size
  private_size = fetch_number(descriptor, 4, 4)
  descriptor_dict["amdhsa_private_segment_fixed_size"] = private_size
  
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
  descriptor_dict["amdhsa_system_sgpr_private_segment_wavefront_offset"] = fetch_subbyte_number(descriptor[52:], 0, 1)
  #print("SGPR WORKGROUP ID X: " + str(fetch_subbyte_number(descriptor[52:], 7, 1)))
  #print("SGPR WORKGROUP ID Y: " + str(fetch_subbyte_number(descriptor[52:], 8, 1)))
  #print("SGPR WORKGROUP ID Z: " + str(fetch_subbyte_number(descriptor[52:], 9, 1)))
  #print("SGPR ENABLE PRIVATE SEGMENT: " + str(fetch_subbyte_number(descriptor[52:], 0, 1)))
  #workitem_id_enum = fetch_subbyte_number(descriptor[52:], 11, 2)
  #if workitem_id_enum == 0:
  #  print("VGPR WORKITEM ID: X")
  #elif workitem_id_enum == 1:
  #  print("VGPR WORKITEM ID: X / Y")
  #elif workitem_id_enum == 2:
  #  print("VGPR WORKITEM ID: X / Y / Z")

  # Obtain information from RSRC3
  accum_offset = (fetch_subbyte_number(descriptor[44:], 0, 6) + 1) * 4
  descriptor_dict["amdhsa_accum_offset"] = accum_offset
  #print("AGPR ACCUM OFFSET: " + str(accum_offset))

  # Obtain information from liveness analysis, or from RSRC1 (less precise)
  if liveness_dict is not None:
    # TBD: register liveness analysis need to consider call graph too.
    liveness.deduce_descriptor(liveness_dict, descriptor_dict)
  else:
    # XXX. If there is no liveness analysis data, use hard-coded values.
    descriptor_dict["kernarg_segment_ptr"] = [4, 5]
  
  # Obtain information from RSRC1
  next_free_sgpr = (fetch_subbyte_number(descriptor[48:], 6, 4) // 2 + 1) * 16
  next_free_vgpr = (fetch_subbyte_number(descriptor[48:], 0, 6) + 1) * 8
  descriptor_dict["amdhsa_next_free_sgpr"] = next_free_sgpr
  descriptor_dict["amdhsa_next_free_vgpr"] = next_free_vgpr
  #print("SGPR: " + str(next_free_sgpr))
  #print("VGPR: " + str(next_free_vgpr))
  
  return descriptor_dict

def get_isa(code_object_filename, symbol_name):
  # disassemble ISA
  isa = run_external_binary(LLVM_OBJDUMP_PATH, ["--disassemble-symbols=" + symbol_name, code_object_filename])
  isa = isa.splitlines()[5:]

  # trim the last line if necessary
  m = re.search(r'^[ \t]+\.\.\.', isa[-1])
  if m is not None:
    # trim the last line
    isa = isa[:-1]
  return isa

def get_symbol_table(code_object_filename):
  symbol_table_text = run_external_binary(LLVM_OBJDUMP_PATH, ["-t", code_object_filename])
  symbol_table_text = symbol_table_text.splitlines()

  symbol_table = {}
  for line in symbol_table_text:
    tokens = line.split() 
    if len(tokens) == 0:
      continue

    symbol_address = 0
    symbol_length = 0
    symbol_name = ""

    token = tokens[0]
    m = re.search(r'^[0-9a-f]+', token)
    if m is not None:
      # Found a symbol
      symbol_address = int(token, 16)
    else:
      # Not a symbol
      continue

    for index in range(1, len(tokens) - 1):
       token = tokens[index]
       m = re.search(r'^[0-9a-f]+', token)
       if m is not None:
         # Found a length
         symbol_length = int(token, 16)

    symbol_name = tokens[len(tokens) - 1]
    symbol_table[symbol_name] = [symbol_address, symbol_length]

  return symbol_table

def main():
  code_object_filename = get_code_object(LIBRCCL_PATH)
  #print(code_object_filename)
  [descriptor_address, descriptor_length, kernel_address, kernel_length] = get_symbol(code_object_filename, RCCL_KERNEL_NAME)
  if (descriptor_address == 0 or descriptor_length == 0 or kernel_address == 0 or kernel_length == 0):
    print("Error fetching code")
    exit(-1)

  descriptor_dict = get_descriptor(code_object_filename, descriptor_address, descriptor_length)

  isa = get_isa(code_object_filename, RCCL_KERNEL_NAME)
  #for line in isa:
  #  print(line)
  #print(descriptor_dict)

  liveness_dict = liveness.liveness_analysis(isa)

  descriptor_dict = get_descriptor(code_object_filename, descriptor_address, descriptor_length, liveness_dict)
  #print(descriptor_dict)

  symbol_table = get_symbol_table(code_object_filename)
  print("Symbol Table:")
  for symbol in symbol_table:
    address = symbol_table[symbol][0]
    length = symbol_table[symbol][1]
    print(symbol, hex(address), hex(length))
  print("")

  call_graph = [RCCL_KERNEL_NAME]
  call_graph_isa = [isa]
  [call_graph, call_graph_isa] = follow_call_graph(code_object_filename, RCCL_KERNEL_NAME, isa, symbol_table, call_graph, call_graph_isa, True)
  print("All symbols used by " + RCCL_KERNEL_NAME + ": ", call_graph)
  for (symbol_name, symbol_isa) in zip(call_graph, call_graph_isa):
    print(symbol_name)
    print("===============================")
    for line in symbol_isa:
      print(line)
    print("")

def follow_call_graph(code_object_filename, function_name, isa, symbol_table, call_graph, call_graph_isa, modify_on_the_fly = False):
  #print("Call graph analysis for: " + function_name)
  found_relocation_info = False
  reg1 = -1
  reg2 = -1
  line1 = "" # line contains s_add_u32
  line2 = "" # line contains s_addc_u32
  line1_index = -1
  line2_index = -1
  callee_address = 0
  callee_address_list = []
  for index in range(len(isa)):
    line = isa[index]
    if found_relocation_info == False:
      m = re.search(S_GETPC_REGEX, line)
      if m is not None:
        # Found s_getpc_b64
        # Log registers used, and address
        found_relocation_info = True
        reg1 = int(m.group(1))
        reg2 = int(m.group(2))
    else:
      m = re.search(MODIFY_PC_REGEX, line)
      if m is not None:
        #print(line)
        assert int(m.group(1)) == int(m.group(2))
        reg = int(m.group(1))
        if reg == reg1:
          # Fetch offset
          offset = int(m.group(3), 16)
          #print(hex(offset))
          address = int(m.group(4), 16)
          #print(hex(address))
          callee_address = address + offset
          #print(hex(address + offset))
          line1 = line
          line1_index = index
        elif reg == reg2:
          # Understand direction
          offset = int(m.group(3))
          if offset < 0:
            callee_address -= 0x100000000
          # Register the address after the direction is known
          callee_address_list.append(callee_address)
          address = int(m.group(4), 16)
          line2 = line
          line2_index = index

          if modify_on_the_fly == True:
            # Locate symbol
            for symbol in symbol_table:
              symbol_address = symbol_table[symbol][0]
              if callee_address == symbol_address:
                #print("\tCall site identified:")
                #print("\t=====================")
                #print(line1)
                #print(line2)
                #print("")
                #print("\tModify call site from absolute address to relative offset:")
                #print("\t==========================================================")
                line1_modified = re.sub(r', 0x?[0-9a-f]+', ", " + symbol + "@rel32@lo+4", line1)
                #print(line1_modified)
                line2_modified = re.sub(r', -?[0-9]+', ", " + symbol + "@rel32@hi+12", line2)
                #print(line2_modified)
                #print("")
                isa[line1_index] = line1_modified
                isa[line2_index] = line2_modified

          # Found one callee, registered it. Try find another one.
          found_relocation_info = False

  call_graph_isa.append(isa)

  # Recursively walk into each of the callee
  if len(callee_address_list) > 0:
    #print(hex(call_address))
    for callee_address in callee_address_list:
      for symbol in symbol_table:
        symbol_address = symbol_table[symbol][0]
        if callee_address == symbol_address:
          #print(function_name, "->",  symbol)
          if symbol not in call_graph:
            call_graph.append(symbol)
            isa = get_isa(code_object_filename, symbol)
            [call_graph, call_graph_isa] = follow_call_graph(code_object_filename, symbol, isa, symbol_table, call_graph, call_graph_isa, modify_on_the_fly)

  return [call_graph, call_graph_isa]

if __name__ == "__main__":
  main()
