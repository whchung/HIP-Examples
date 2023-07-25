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
for line in symbols.splitlines():
  m = re.search(RCCL_KERNEL_NAME, line)
  if m is not None:
    tokens = line.split()
    if tokens[3] == ".text":
      #print("Kernel code: " + tokens[6]) 
      #print("Address: " + tokens[0])
      #print("Length: " + tokens[4])
      pass
    elif tokens[3] == ".rodata":
      #print("Kernel desc: " + tokens[6]) 
      #print("Address: " + tokens[0])
      #print("Length: " + tokens[4])
      descriptor_address = int(tokens[0], 16)
      descriptor_length = int(tokens[4], 16)

# get descriptor
# TBD parse each item
descriptor_raw_text = run_external_binary(LLVM_OBJDUMP_PATH, ["-s", "--section=.rodata", code_object_filename])
descriptor_length_remaining = descriptor_length
for line in descriptor_raw_text.splitlines()[2:]:
  tokens = line.split()
  if int(tokens[0], 16) == descriptor_address:
    descriptor_found = True

  if descriptor_found == True:
    descriptor_length_remaining = descriptor_length_remaining - 16
    #print(line)

  if descriptor_length_remaining <= 0:
    break

# disassemble ISA
isa = run_external_binary(LLVM_OBJDUMP_PATH, ["--disassemble-symbols=" + RCCL_KERNEL_NAME, code_object_filename])
isa = isa.splitlines()[5:]
for line in isa:
  print(line)
