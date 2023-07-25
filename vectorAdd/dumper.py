#!/usr/bin/python3.7

import os
import re
import subprocess

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

ROC_OBJ_LS_PATH = "/opt/rocm/hip/bin/roc-obj-ls"
ROC_OBJ_EXTRACT_PATH = "/opt/rocm/hip/bin/roc-obj-extract"
LLVM_OBJDUMP_PATH = "/opt/rocm/llvm/bin/llvm-objdump"

GFXARCH_REGEX = r'^.*gfx90a:xnack-[ \t]+(.+)'

LIBRCCL_PATH = "/home/whchung/rccl/build/librccl.so"
RCCL_KERNEL_NAME = "_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommPvP8ncclWork"

# run roc-obj-ls
roc_obj_ls_output = run_external_binary(ROC_OBJ_LS_PATH, [LIBRCCL_PATH])
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

# dump symbols
symbols = run_external_binary(LLVM_OBJDUMP_PATH, ["-t", code_object_filename])
descriptor_address = 0
descriptor_length = 0
kernel_address = 0
kernel_length = 0
for line in symbols.splitlines():
  m = re.search(RCCL_KERNEL_NAME, line)
  if m is not None:
    tokens = line.split()
    if tokens[3] == ".text":
      print("\nKernel code: " + tokens[6]) 
      print("Address: " + tokens[0])
      print("Length: " + tokens[4])
      kernel_address = int(tokens[0], 16)
      kernel_length = int(tokens[4], 16)
      pass
    elif tokens[3] == ".rodata":
      print("\nKernel desc: " + tokens[6]) 
      print("Address: " + tokens[0])
      print("Length: " + tokens[4])
      descriptor_address = int(tokens[0], 16)
      descriptor_length = int(tokens[4], 16)

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
    print(line)

  if descriptor_length_remaining <= 0:
    break

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

# Obtain LDS size
lds_size = fetch_number(descriptor, 0, 4)
print("GROUP SEGMENT: " + str(lds_size))

# Obtain kernarg size
kernarg_size = fetch_number(descriptor, 8, 4) 
print("KERNARG: " + str(kernarg_size))

# Obtain information from RSRC1
print("VGPR: " + str(fetch_subbyte_number(descriptor[48:], 0, 6) * 8))
print("SGPR: " + str(fetch_subbyte_number(descriptor[48:], 6, 4) * 16))

# Obtain information from RSRC2
print("PRIVATE SEGMENT: " + str(fetch_subbyte_number(descriptor[52:], 0, 1)))
print("USER SGPR COUNT: " + str(fetch_subbyte_number(descriptor[52:], 1, 5)))
print("SGPR WORKGROUP ID X: " + str(fetch_subbyte_number(descriptor[52:], 7, 1)))
print("SGPR WORKGROUP ID Y: " + str(fetch_subbyte_number(descriptor[52:], 8, 1)))
print("SGPR WORKGROUP ID Z: " + str(fetch_subbyte_number(descriptor[52:], 9, 1)))
workitem_id_enum = fetch_subbyte_number(descriptor[52:], 11, 2)
if workitem_id_enum == 0:
  print("VGPR WORKITEM ID: X")
elif workitem_id_enum == 1:
  print("VGPR WORKITEM ID: X / Y")
elif workitem_id_enum == 2:
  print("VGPR WORKITEM ID: X / Y / Z")

# Obtain information from RSRC3
print("AGPR ACCUM OFFSET: " + str(fetch_subbyte_number(descriptor[44:], 0, 6) * 4))

# disassemble ISA
isa = run_external_binary(LLVM_OBJDUMP_PATH, ["--disassemble-symbols=" + RCCL_KERNEL_NAME, code_object_filename])
isa = isa.splitlines()[5:]
#for line in isa:
#  print(line)
