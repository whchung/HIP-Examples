#!/usr/bin/python3.7

import re
import sys

import dumper
import liveness

# Configuration
INPUT_FILE = "vectoradd_hip-hip-amdgcn-amd-amdhsa-gfx900.s"
FUSED_MANIFEST_FILE = "fused_manifest.txt"
HOST_KERNEL = '_Z7kernel1PKfS0_Pf'
GUEST_KERNEL = '_Z7kernel2PKfPf'

# Constants
MAYBE_EMPTY_SPACES = r'[ \t]*'
NON_EMPTY_SPACES = r'[ \t]+'
KERNEL_METADATA_DIRECTIVE = r'.amdhsa_kernel'
KERNEL_METADATA_END_DIRECTIVE = r'.end_amdhsa_kernel'


USER_SGPR_DIRECTIVES = [ r'amdhsa_user_sgpr_private_segment_buffer', \
                         r'amdhsa_user_sgpr_dispatch_ptr', \
                         r'amdhsa_user_sgpr_queue_ptr', \
                         r'amdhsa_user_sgpr_kernarg_segment_ptr', \
                         r'amdhsa_user_sgpr_dispatch_id', \
                         r'amdhsa_user_sgpr_flat_scratch_init']
USER_SGPR_CONSUMPTION = { r'amdhsa_user_sgpr_private_segment_buffer' : 4, \
                          r'amdhsa_user_sgpr_dispatch_ptr' : 2, \
                          r'amdhsa_user_sgpr_queue_ptr' : 2, \
                          r'amdhsa_user_sgpr_kernarg_segment_ptr' : 2, \
                          r'amdhsa_user_sgpr_dispatch_id' : 2, \
                          r'amdhsa_user_sgpr_flat_scratch_init': 2 }
PRIVATE_SEGMENT_BUFFER_INDEX = 0
DISPATCH_PTR_INDEX = 1
QUEUE_PTR_INDEX = 2
KERNARG_SEGMENT_PTR_INDEX = 3
DISPATCH_ID_INDEX = 4
FLAT_SCRATCH_INIT_INDEX = 5

NEXT_FREE_SGPR = r'amdhsa_next_free_sgpr'
NEXT_FREE_VGPR = r'amdhsa_next_free_vgpr'

KERNARG_SIZE = r'amdhsa_kernarg_size'
LDS_SIZE = r'amdhsa_group_segment_fixed_size'

SYSTEM_SGPR_WORKGROUP_ID = r'amdhsa_system_sgpr_workgroup_id_'

DIMENSIONS = [ 'x', 'y', 'z' ]

USER_SGPR_CP_COUNT = r'user_sgpr_cp_count'
USER_SGPR_ADC_COUNT = r'user_sgpr_adc_count'

KERNARG_SEGMENT_PTR = r'kernarg_segment_ptr'
PRIVATE_SEGMENT_BUFFER = r'private_segment_buffer'
DISPATCH_PTR = r'dispatch_ptr'
QUEUE_PTR = r'queue_ptr'
FLAT_SCRATCH_INIT = r'flat_scratch_init'
DISPATCH_ID = r'dispatch_id'

# Regex
KERNEL_NAME_REGEX = MAYBE_EMPTY_SPACES + \
                    "(" + KERNEL_METADATA_DIRECTIVE +")" + \
                    NON_EMPTY_SPACES + \
                    "(" + r'\w+' +")"

KERNEL_CODE_BEGIN_REGEX = r':[ \t]+; @'
KERNEL_CODE_END_REGEX = r'^[ \t]+\.section[ \t]+'

KERNEL_METADATA_BEGIN_REGEX = MAYBE_EMPTY_SPACES + KERNEL_METADATA_DIRECTIVE + NON_EMPTY_SPACES
KERNEL_METADATA_END_REGEX = MAYBE_EMPTY_SPACES + KERNEL_METADATA_END_DIRECTIVE
KERNEL_METADATA_ENTRY_REGEX = MAYBE_EMPTY_SPACES + r'\.(\w+)' + NON_EMPTY_SPACES + r'(\d+)' 


# RCCL-related constants
LIBRCCL_PATH = "/home/whchung/rccl/build/librccl.so"
RCCL_KERNEL_NAME = "_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommPvP8ncclWork"

# Parse input file, retrieve kernel names
def retrieve_kernel_names(input_stream, output_list):
  for input_line in input_stream:
    m = re.search(KERNEL_NAME_REGEX, input_line)
    if m is not None:
      output_list.append(m.group(2))

# Parse input stream, retrieve kernel source code
def retrieve_kernel_source_code(kernel_name, input_stream, output_dict, log_prologue_epilogue = False, prologue_list = None, epilogue_list = None):
  inside_kernel_code = False
  for input_line in input_stream:
    if inside_kernel_code is False:
      m = re.search(kernel_name + KERNEL_CODE_BEGIN_REGEX + kernel_name, input_line)
      if m is not None:
        output_dict[kernel_name] = []

        # Found beginning of code
        if log_prologue_epilogue == True and prologue_list is not None:
          prologue_list.append(input_line.rstrip())

        inside_kernel_code = True
        continue
      else:
        if log_prologue_epilogue == True and prologue_list is not None:
          prologue_list.append(input_line.rstrip())

    else:
      m = re.search(KERNEL_CODE_END_REGEX, input_line)
      if m is not None:
        # Found end of code
        if log_prologue_epilogue == True and epilogue_list is not None:
          epilogue_list.append(input_line.rstrip())

        inside_kernel_code = False
        break
  
      output_dict[kernel_name].append(input_line.rstrip())

  # Log the remaining lines if needed
  if log_prologue_epilogue == True and epilogue_list is not None:
    for input_line in input_stream:
      epilogue_list.append(input_line.rstrip())

# Parse input stream, retrieve kernel metadata
def retrieve_kernel_metadata(kernel_name, input_stream, output_dict):
  inside_kernel_metadata = False
  for input_line in input_stream:
    if inside_kernel_metadata is False:
      m = re.search(KERNEL_METADATA_BEGIN_REGEX + kernel_name, input_line)
      if m is not None:
        # Found beginning of metadata
        output_dict[kernel_name] = {}
        inside_kernel_metadata = True
        continue
    else:
      m = re.search(KERNEL_METADATA_END_REGEX, input_line)
      if m is not None:
        # Found end of metadata
        inside_kernel_metadata = False
        break

      m = re.search(KERNEL_METADATA_ENTRY_REGEX, input_line)
      if m is not None:
        # Found metadata
        if len(m.groups()) == 2:
          output_dict[kernel_name][m.group(1)] = int(m.group(2))

def retrieve_sgpr_usage(kernel_name, metadata_dict):
  metadata_dict[kernel_name][USER_SGPR_CP_COUNT] = 0
  metadata_dict[kernel_name][USER_SGPR_ADC_COUNT] = 0
  metadata_dict[kernel_name][KERNARG_SEGMENT_PTR] = []

  # user sgprs set by CP
  # Count user sgprs be used
  user_sgpr_cp_count = 0
  for user_sgpr in USER_SGPR_DIRECTIVES:
    if metadata_dict[kernel_name][user_sgpr] == 1:
      # record user sgprs used by guest kernel for kernarg segment pointer
      if user_sgpr == USER_SGPR_DIRECTIVES[KERNARG_SEGMENT_PTR_INDEX]:
        metadata_dict[kernel_name][KERNARG_SEGMENT_PTR].append(user_sgpr_cp_count)
        metadata_dict[kernel_name][KERNARG_SEGMENT_PTR].append(user_sgpr_cp_count + 1)
      user_sgpr_cp_count += USER_SGPR_CONSUMPTION[user_sgpr]
  metadata_dict[kernel_name][USER_SGPR_CP_COUNT] = user_sgpr_cp_count

  #print("User sgpr set by CP: " + str(user_sgpr_cp_count))
  #print("Kernarg segment ptr: " + metadata_dict[kernel_name][KERNARG_SEGMENT_PTR])

  # user sgprs set by ADC

  # workgroup ID + workitem ID
  user_sgpr_adc_count = 0
  for dim in DIMENSIONS:
    if metadata_dict[kernel_name][SYSTEM_SGPR_WORKGROUP_ID + dim] == 1:
      user_sgpr_adc_count += 1
  metadata_dict[kernel_name][USER_SGPR_ADC_COUNT] = user_sgpr_adc_count

  #print("User sgpr set by ADC: " + str(user_sgpr_adc_count))

def fuse_kernel(kernel_code_dict, kernel_metadata_dict, host_kernel, guest_kernel, kernel_prologue_list, kernel_epilogue_list, guest_kernel_is_from_binary = False):

  # Produce context adjust logic
  context_adjust_logic = abi_feature_analysis(kernel_metadata_dict)

  # Produce context save/restore logic
  context_save_logic = []
  context_save_logic.append("; save context")
  context_restore_logic = []
  context_restore_logic.append("; restore context")
  
  # Produce logic to preserve SGPR / VGPR
  next_sgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR]
  next_vgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR]
  
  # Product logic to preserve workgroup ID SGPR + workitem ID VGPR
  user_sgpr_adc_saved = 0
  for d in range(len(DIMENSIONS)):
    dim = DIMENSIONS[d]
    if kernel_metadata_dict[guest_kernel][SYSTEM_SGPR_WORKGROUP_ID + dim] == 1:
      context_save_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(next_sgpr) + ', ' + 's' + str(kernel_metadata_dict[host_kernel][USER_SGPR_CP_COUNT] + user_sgpr_adc_saved))
      context_save_logic.append('\tv_mov_b32_e32' + ' ' + 'v' + str(next_vgpr) + ', ' + 'v' + str(d))
  
      context_restore_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(kernel_metadata_dict[guest_kernel][USER_SGPR_CP_COUNT] + user_sgpr_adc_saved) + ', ' + 's' + str(next_sgpr))
      context_restore_logic.append('\tv_mov_b32_e32' + ' ' + 'v' + str(d) + ', ' + 'v' + str(next_vgpr))
  
      next_sgpr += 1
      next_vgpr += 1
      user_sgpr_adc_saved += 1
  
  kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR] = next_sgpr
  kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR] = next_vgpr

  # Detect if SGPR for kernarg segment pointer has been modified in the host kernel
  kernarg_segment_ptr_sgpr_modified = False
  for line in kernel_code_dict[host_kernel]:
    for sgpr in kernel_metadata_dict[host_kernel][KERNARG_SEGMENT_PTR]:
      m = re.search(r'^[ \t]+[a-z0-9_]+ s' + str(sgpr), line)
      if m is not None:
        kernarg_segment_ptr_sgpr_modified = True
        break
  
  # Produce logic to preserve kernarg segment pointer
  # Only produce kernarg segment pointer preserving logic in case of one of the followings:
  # - The register number is different between host and guest
  # - The registers are overwritten within host
  if kernarg_segment_ptr_sgpr_modified or (kernel_metadata_dict[host_kernel][KERNARG_SEGMENT_PTR] != kernel_metadata_dict[guest_kernel][KERNARG_SEGMENT_PTR]):
    host_register = kernel_metadata_dict[host_kernel][KERNARG_SEGMENT_PTR][0]
    context_save_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(next_sgpr) + ', ' + 's' + str(host_register))
    context_save_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(next_sgpr + 1) + ', ' + 's' + str(host_register + 1))
  
    guest_register = kernel_metadata_dict[guest_kernel][KERNARG_SEGMENT_PTR][0]
    context_restore_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(guest_register) + ', ' + 's' + str(next_sgpr))
    context_restore_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(guest_register + 1) + ', ' + 's' + str(next_sgpr + 1))
    next_sgpr += 2
  
  # Produce logic to update kernarg segment pointer for the guest kernel

  # Retreive kernarg size, compute kernarg offset
  # Kernel signature merge takes place first before this logic could work
  host_kernarg_size = kernel_metadata_dict[host_kernel][KERNARG_SIZE]
  guest_kernarg_size = kernel_metadata_dict[guest_kernel][KERNARG_SIZE]
  #kernarg_offset = host_kernarg_size - guest_kernarg_size
  #if kernarg_offset < 0:
  #  print("Host kernarg size is less than guest!")
  #  exit(1)
  kernarg_offset = host_kernarg_size
  
  kernarg_segment_ptr_sgpr_be_updated = kernel_metadata_dict[guest_kernel][KERNARG_SEGMENT_PTR][0]
  context_restore_logic.append('\ts_addc_u32_e32' + ' ' + 's' + str(kernarg_segment_ptr_sgpr_be_updated) + ', ' + 's' + str(kernarg_segment_ptr_sgpr_be_updated) + ', ' + str(hex(kernarg_offset)))
  
  # Produce comment to indicate the beginning of host kernel
  context_save_logic.append("; begin of host kernel")

  # Produce comment to indicate the beginning of fused kernel
  context_restore_logic.append("; begin of guest kernel")


  # Produce fused metadata

  # Retreive LDS size
  host_lds_size = kernel_metadata_dict[host_kernel][LDS_SIZE]
  guest_lds_size = kernel_metadata_dict[guest_kernel][LDS_SIZE]
  
  # Retrieve next free SGPR / VGPR on host kernel
  host_next_free_sgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR]
  host_next_free_vgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR]
  #print("Next free SGPR on host kernel: " + str(host_next_free_sgpr))
  #print("Next free VGPR on host kernel: " + str(host_next_free_vgpr))
  
  # Retrieve next free SGPR / VGPR on guest kernel
  guest_next_free_sgpr = kernel_metadata_dict[guest_kernel][NEXT_FREE_SGPR]
  guest_next_free_vgpr = kernel_metadata_dict[guest_kernel][NEXT_FREE_VGPR]
  
  # Manipulate host kernel, modify metadata on kernarg segment size
  kernel_metadata_dict[host_kernel][KERNARG_SIZE] = host_kernarg_size + guest_kernarg_size

  # Manipulate host kernel, modify metadata on LDS usage
  if guest_lds_size > host_lds_size:
    kernel_metadata_dict[host_kernel][LDS_SIZE] = guest_lds_size

  # Maniuplate host kernel, modify metadata on SGPR/VGPR usage
  # TBD: Manipulate host kernel, modify metadata on AGPR usage
  if guest_next_free_sgpr > host_next_free_sgpr:
    kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR] = guest_next_free_sgpr
  if guest_next_free_vgpr > host_next_free_vgpr:
    kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR] = guest_next_free_vgpr

  # Modify SGPR / VGPR allocation on the fused kernel
  # Modify kernarg size on the fused kernel
  # Modify LDS size on the fused kernel
  done_next_free_vgpr = False
  done_next_free_sgpr = False
  done_kernarg_size = False
  done_group_segment_fixed_size = False
  modified_kernel_epilogue_list = []
  for line in kernel_epilogue_list:
    if done_next_free_vgpr == False or done_next_free_sgpr == False or done_kernarg_size == False or done_group_segment_fixed_size == False:
      m = re.search(KERNEL_METADATA_ENTRY_REGEX, line)
      if m is not None:
        if m.group(1) == NEXT_FREE_VGPR:
          done_next_free_vgpr = True
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR]))
        elif m.group(1) == NEXT_FREE_SGPR:
          done_next_free_sgpr = True
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR]))
        elif m.group(1) == KERNARG_SIZE:
          done_kernarg_size = True
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(host_kernarg_size + guest_kernarg_size))
        elif m.group(1) == LDS_SIZE:
          done_group_segment_fixed_size = True
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(kernel_metadata_dict[host_kernel][LDS_SIZE]))
        else:
          modified_kernel_epilogue_list.append(line.rstrip())
      else:
        modified_kernel_epilogue_list.append(line.rstrip())
    else:
      modified_kernel_epilogue_list.append(line.rstrip())
  kernel_epilogue_list = modified_kernel_epilogue_list
  
  # Manipulate host kernel, disable s_endpgm
  for line_number in range(len(kernel_code_dict[host_kernel])):
    line = kernel_code_dict[host_kernel][line_number]
    m = re.search(r'^[ \t]+s_endpgm', line)
    if m is not None:
      kernel_code_dict[host_kernel][line_number] = "\t;s_endpgm"
  
  # Skip renaming BBs if guest kernel is extracted from binary.
  if guest_kernel_is_from_binary != True:
    # Manipulate guest kernel, rename BBs
    for line_number in range(len(kernel_code_dict[guest_kernel])):
      line = kernel_code_dict[guest_kernel][line_number]
      m = re.search(r'(.*)BB(\d+)_(\d+)(.*)', line)
      if m is not None:
        kernel_code_dict[guest_kernel][line_number] = m.group(1) + r'FUSED_BB' + m.group(2) + '_' + m.group(3) + m.group(4)
  
  # TBD: global sync logic between host kernel and guest kernel
  
  # Start fusion
  kernel_code_dict[host_kernel] = context_adjust_logic + context_save_logic + kernel_code_dict[host_kernel] + context_restore_logic + kernel_code_dict[guest_kernel]
  
  for line in kernel_prologue_list:
    print(line.rstrip())
  
  for line in kernel_code_dict[host_kernel]:
    print(line)
  
  for line in kernel_epilogue_list:
    print(line.rstrip())

def main():
  # Lists
  kernel_name_list = []
  
  kernel_prologue_list = []
  kernel_epilogue_list = []
  
  # Dicts
  kernel_code_dict = {}
  kernel_metadata_dict = {}
  
  input_filename = INPUT_FILE
  if len(sys.argv) >= 2:
    input_filename = sys.argv[1]
  
  manifest_mode = False
  if len(sys.argv) == 3:
    manifest_mode = True
  
  # Open input file
  try:
    input_file = open(input_filename, "r")
  except FileNotFoundError:
    print("Missing input file!")
    exit(1)
  
  retrieve_kernel_names(input_file, kernel_name_list)
  
  if manifest_mode == True:
    for kernel_name in kernel_name_list:
      print(kernel_name)
    exit(0)
  else:
    # Open fused manifest file if possible
    try:
      fused_manifest_file = open(FUSED_MANIFEST_FILE, "r")
    except FileNotFoundError:
      print("Missing manifest file, try use default values")
  
  if fused_manifest_file is not None:
    manifest_lines = fused_manifest_file.readlines()
    HOST_KERNEL = manifest_lines[0].rstrip()
    GUEST_KERNEL = manifest_lines[1].rstrip()
  
  # Identify host and guest kernel
  host_kernel_identified = False
  guest_kernel_identified = False
  for kernel_name in kernel_name_list:
    if kernel_name == HOST_KERNEL:
      host_kernel_identified = True
    elif kernel_name == GUEST_KERNEL:
      guest_kernel_identified = True
  
  if host_kernel_identified == False:
    print("Missing host kernel!")
    exit(1)
  
  if guest_kernel_identified == False:
    print("Missing guest kernel!")
    exit(1)
  
  # Get kernel code and metadata
  input_file.seek(0)
  retrieve_kernel_source_code(HOST_KERNEL, input_file, kernel_code_dict, True, kernel_prologue_list, kernel_epilogue_list)
  input_file.seek(0)
  retrieve_kernel_metadata(HOST_KERNEL, input_file, kernel_metadata_dict)
  
  input_file.seek(0)
  retrieve_kernel_source_code(GUEST_KERNEL, input_file, kernel_code_dict)
  input_file.seek(0)
  retrieve_kernel_metadata(GUEST_KERNEL, input_file, kernel_metadata_dict)
  
  # Retrieve kernel SGPR usage
  retrieve_sgpr_usage(HOST_KERNEL, kernel_metadata_dict)
  retrieve_sgpr_usage(GUEST_KERNEL, kernel_metadata_dict)

  fuse_kernel(kernel_code_dict, kernel_metadata_dict, HOST_KERNEL, GUEST_KERNEL, kernel_prologue_list, kernel_epilogue_list)
  
def test_fuse_with_dumper():
  # Lists
  kernel_name_list = []
  
  kernel_prologue_list = []
  kernel_epilogue_list = []
  
  # Dicts
  kernel_code_dict = {}
  kernel_metadata_dict = {}
  
  input_filename = INPUT_FILE
  if len(sys.argv) >= 2:
    input_filename = sys.argv[1]
  
  manifest_mode = False
  if len(sys.argv) == 3:
    manifest_mode = True
  
  # Open input file
  try:
    input_file = open(input_filename, "r")
  except FileNotFoundError:
    print("Missing input file!")
    exit(1)
  
  retrieve_kernel_names(input_file, kernel_name_list)
  
  # Identify host kernel
  host_kernel_identified = False
  for kernel_name in kernel_name_list:
    if kernel_name == HOST_KERNEL:
      host_kernel_identified = True
  
  if host_kernel_identified == False:
    print("Missing host kernel!")
    exit(1)
  
  # Get kernel code and metadata
  input_file.seek(0)
  retrieve_kernel_source_code(HOST_KERNEL, input_file, kernel_code_dict, True, kernel_prologue_list, kernel_epilogue_list)
  input_file.seek(0)
  retrieve_kernel_metadata(HOST_KERNEL, input_file, kernel_metadata_dict)
  
  # Retrieve kernel SGPR usage
  retrieve_sgpr_usage(HOST_KERNEL, kernel_metadata_dict)

  # Liveness analysis of host kernel
  l_host = liveness.liveness_analysis(kernel_code_dict[HOST_KERNEL])
  # Update kernel metadata for host kernel after liveness analysis
  kernel_metadata_dict[HOST_KERNEL] = liveness.deduce_descriptor(l_host, kernel_metadata_dict[HOST_KERNEL])

  # Obtain guest kernel from dumper
  code_object_filename = dumper.get_code_object(LIBRCCL_PATH)
  [descriptor_address, descriptor_length, kernel_address, kernel_length] = dumper.get_symbol(code_object_filename, RCCL_KERNEL_NAME)
  kernel_code_dict[GUEST_KERNEL] = dumper.get_isa(code_object_filename, RCCL_KERNEL_NAME)
  liveness_dict = liveness.liveness_analysis(kernel_code_dict[GUEST_KERNEL])

  kernel_metadata_dict[GUEST_KERNEL] = dumper.get_descriptor(code_object_filename, descriptor_address, descriptor_length, liveness_dict)

  #abi_feature_analysis(kernel_metadata_dict)
  fuse_kernel(kernel_code_dict, kernel_metadata_dict, HOST_KERNEL, GUEST_KERNEL, kernel_prologue_list, kernel_epilogue_list, True)

def abi_feature_analysis(kernel_metadata_dict):
  #print(kernel_metadata_dict[HOST_KERNEL])
  #print(kernel_metadata_dict[GUEST_KERNEL])

  context_adjust_logic = []
  context_adjust_logic.append("; adjust context")

  metadata_modified_needed = False
  for [feature, prefix] in [("private_segment_buffer", "amdhsa_user_sgpr_"), \
                            ("dispatch_ptr", "amdhsa_user_sgpr_"), \
                            ("queue_ptr", "amdhsa_user_sgpr_"), \
                            ("kernarg_segment_ptr", "amdhsa_user_sgpr_"), \
                            ("flat_scratch_init", "amdhsa_user_sgpr_"), \
                            ("workgroup_id_x", "amdhsa_system_sgpr_"), \
                            ("workgroup_id_y", "amdhsa_system_sgpr_"), \
                            ("workgroup_id_z", "amdhsa_system_sgpr_")]:
    host_declared = False
    guest_declared = False
    #print("ROCm ABI feature: " + feature)
    if kernel_metadata_dict[HOST_KERNEL][prefix + feature] == 1:
      #print("\tHost declared")
      host_declared = True
    if kernel_metadata_dict[GUEST_KERNEL][prefix + feature] == 1:
      #print("\tGuest declared")
      guest_declared = True

    host_registers = kernel_metadata_dict[HOST_KERNEL].get(feature)
    host_used = False
    if host_registers is not None:
      #print("\tHost used: ", host_registers)
      host_used = True
    guest_registers = kernel_metadata_dict[GUEST_KERNEL].get(feature)
    guest_used = False
    if guest_registers is not None:
      #print("\tGuest used: ", guest_registers)
      guest_used = True

    host_overriden = kernel_metadata_dict[HOST_KERNEL].get(feature + "_overriden")
    if host_overriden is not None and host_overriden == 1:
      #print("\tHost overriden")
      pass
    else:
      host_overriden = False
    guest_overriden = kernel_metadata_dict[GUEST_KERNEL].get(feature + "_overriden")
    if guest_overriden is not None and guest_overriden == 1:
      #print("\tGuest overriden")
      pass
    else:
      host_overriden = False

    # Decide if host metadata need to be modified
    if host_declared == False and guest_declared == True:
      #print("\tNeed to modify host metadata")
      metadata_modified_needed = True

    # Decide if context adjust logic need to be emitted
    if host_used == True and metadata_modified_needed == True:
      #print("\tNeed context adjust logic before host kernel")
      for [host_reg, guest_reg] in zip(host_registers, guest_registers):
        context_adjust_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(host_reg) + ', ' + 's' + str(guest_reg))

  #for line in context_adjust_logic:
  #  print(line)
  return context_adjust_logic

if __name__ == "__main__":
    main()
    #test_use_dumper()
    #test_fuse_with_dumper()
