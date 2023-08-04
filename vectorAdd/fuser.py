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
AGPR_OFFSET = r'accum_offset'

KERNARG_SIZE = r'amdhsa_kernarg_size'
LDS_SIZE = r'amdhsa_group_segment_fixed_size'
PRIVATE_SIZE = r'amdhsa_private_segment_fixed_size'

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

def decide_host_metadata_modification_needed(abi_analysis_dict):
  needed = False
  for feature in ["private_segment_buffer", "dispatch_ptr", "queue_ptr", "kernarg_segment_ptr", "flat_scratch_init", "workgroup_id_x", "workgroup_id_y", "workgroup_id_z"]:
    host_declared = abi_analysis_dict[feature]["host_declared"]
    guest_declared = abi_analysis_dict[feature]["guest_declared"]

    # Decide if host metadata need to be modified
    if host_declared == False and guest_declared == True:
      #print("\tNeed to modify host metadata")
      needed = True
  return needed

def merge_abi_features(kernel_metadata_dict, host_kernel, guest_kernel):
  # Merge metadata regarding to individual ROCm ABI features
  for [feature, prefix] in [("private_segment_buffer", "amdhsa_user_sgpr_"), \
                            ("dispatch_ptr", "amdhsa_user_sgpr_"), \
                            ("queue_ptr", "amdhsa_user_sgpr_"), \
                            ("kernarg_segment_ptr", "amdhsa_user_sgpr_"), \
                            ("flat_scratch_init", "amdhsa_user_sgpr_"), \
                            ("workgroup_id_x", "amdhsa_system_sgpr_"), \
                            ("workgroup_id_y", "amdhsa_system_sgpr_"), \
                            ("workgroup_id_z", "amdhsa_system_sgpr_")]:
    kernel_metadata_dict[host_kernel][prefix + feature] = kernel_metadata_dict[guest_kernel][prefix + feature]
    guest_registers = kernel_metadata_dict[guest_kernel].get(feature)
    if guest_registers is not None:
      kernel_metadata_dict[host_kernel][feature] = guest_registers
    guest_overriden = kernel_metadata_dict[guest_kernel].get(feature + "_overriden")
    if guest_overriden is not None:
      kernel_metadata_dict[host_kernel][feature + "_overriden"] = guest_overriden

  # Merge metadta regarding to the total SGPRs set by CP and ADC
  kernel_metadata_dict[host_kernel][USER_SGPR_CP_COUNT] = kernel_metadata_dict[guest_kernel][USER_SGPR_CP_COUNT]
  kernel_metadata_dict[host_kernel][USER_SGPR_ADC_COUNT] = kernel_metadata_dict[guest_kernel][USER_SGPR_ADC_COUNT]

def emit_context_save_restore_logic(kernel_metadata_dict, host_kernel, guest_kernel, kernel_code_dict):
  # Produce context save/restore logic
  context_save_logic = []
  context_save_logic.append("; context save logic")
  context_restore_logic = []
  context_restore_logic.append("; context restore logic")
  
  # Obtain the next available SGPR / VGPR
  next_sgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR]
  next_vgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR]
  
  # Product logic to preserve workgroup ID SGPR
  user_sgpr_adc_saved = 0
  for d in range(len(DIMENSIONS)):
    dim = DIMENSIONS[d]
    overriden = kernel_metadata_dict[host_kernel].get("workgroup_id_" + dim + "_overriden")
    if overriden is not None and overriden == 1:
      context_save_logic.append('\t; save workgroup ID ' + dim)
      context_save_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(next_sgpr) + ', ' + 's' + str(kernel_metadata_dict[host_kernel][USER_SGPR_CP_COUNT] + user_sgpr_adc_saved))
      context_restore_logic.append('\t; restore workgroup ID ' + dim)
      context_restore_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(kernel_metadata_dict[guest_kernel][USER_SGPR_CP_COUNT] + user_sgpr_adc_saved) + ', ' + 's' + str(next_sgpr))
      next_sgpr += 1
      user_sgpr_adc_saved += 1
  kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR] = next_sgpr
  
  # Product logic to preserve workitem ID VGPR
  for d in range(len(DIMENSIONS)):
    dim = DIMENSIONS[d]
    if kernel_metadata_dict[host_kernel][SYSTEM_SGPR_WORKGROUP_ID + dim] == 1:
      vgpr_liveness = kernel_metadata_dict[host_kernel]["liveness"].get('v' + str(d))
      if vgpr_liveness is not None and vgpr_liveness[2] != 0:
        context_save_logic.append('\t; save workitem ID ' + dim)
        context_save_logic.append('\tv_mov_b32_e32' + ' ' + 'v' + str(next_vgpr) + ', ' + 'v' + str(d))
        context_restore_logic.append('\t; restore workitem ID ' + dim)
        context_restore_logic.append('\tv_mov_b32_e32' + ' ' + 'v' + str(d) + ', ' + 'v' + str(next_vgpr))
        next_vgpr += 1
  kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR] = next_vgpr

  # Anaylsis ABI features
  abi_analysis_dict = abi_feature_analysis(kernel_metadata_dict, host_kernel, guest_kernel)

  # Produce logic to preserve SGPR for a ROCm ABI feature
  for feature in ["private_segment_buffer", "dispatch_ptr", "queue_ptr", "kernarg_segment_ptr", "flat_scratch_init"]:
    # Only produce kernarg segment pointer preserving logic in case:
    # - The registers are overwritten in the host
    # - The registers are declared in the guest
    # - The registers are used in the guest
    if abi_analysis_dict[feature]["guest_declared"] and abi_analysis_dict[feature]["guest_used"] and abi_analysis_dict[feature]["host_overriden"]:
      host_registers = kernel_metadata_dict[host_kernel][feature]
      guest_registers = kernel_metadata_dict[guest_kernel][feature]
      context_save_logic.append('\t; save ' + feature + ' SGPR')
      context_restore_logic.append('\t; restore ' + feature + ' SGPR')
      for (host_register, guest_register) in zip(host_registers, guest_registers):
        context_save_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(next_sgpr) + ', ' + 's' + str(host_register))
        context_restore_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(guest_register) + ', ' + 's' + str(next_sgpr))
        next_sgpr += 1
  
  # Produce logic to update kernarg segment pointer for the guest kernel

  # Retreive kernarg size, compute kernarg offset
  host_kernarg_size = kernel_metadata_dict[host_kernel][KERNARG_SIZE]
  guest_kernarg_size = kernel_metadata_dict[guest_kernel][KERNARG_SIZE]
  #kernarg_offset = host_kernarg_size - guest_kernarg_size
  #if kernarg_offset < 0:
  #  print("Host kernarg size is less than guest!")
  #  exit(1)
  kernarg_offset = host_kernarg_size
  
  kernarg_segment_ptr_sgpr_be_updated = kernel_metadata_dict[guest_kernel][KERNARG_SEGMENT_PTR][0]
  context_restore_logic.append('\t; modify kernarg segment ptr to match guest kernel')
  context_restore_logic.append('\ts_addc_u32_e32' + ' ' + 's' + str(kernarg_segment_ptr_sgpr_be_updated) + ', ' + 's' + str(kernarg_segment_ptr_sgpr_be_updated) + ', ' + str(hex(kernarg_offset)))
  
  # Produce comment to indicate the beginning of host kernel
  context_save_logic.append("; begin of host kernel before context save")

  # Produce comment to indicate the beginning of fused kernel
  context_restore_logic.append("; begin of guest kernel")

  return [context_save_logic, context_restore_logic]

def merge_resource_allocation(kernel_metadata_dict, host_kernel, guest_kernel):
  # Retreive LDS size
  host_lds_size = kernel_metadata_dict[host_kernel][LDS_SIZE]
  guest_lds_size = kernel_metadata_dict[guest_kernel][LDS_SIZE]
  
  # Retreive private size
  host_private_size = kernel_metadata_dict[host_kernel][PRIVATE_SIZE]
  guest_private_size = kernel_metadata_dict[guest_kernel][PRIVATE_SIZE]

  # Retrieve next free SGPR / VGPR on host kernel
  host_next_free_sgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR]
  host_next_free_vgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR]
  
  # Retrieve next free SGPR / VGPR on guest kernel
  guest_next_free_sgpr = kernel_metadata_dict[guest_kernel][NEXT_FREE_SGPR]
  guest_next_free_vgpr = kernel_metadata_dict[guest_kernel][NEXT_FREE_VGPR]

  # Retrieve AGPR offset on host kernel
  host_agpr_offset = kernel_metadata_dict[host_kernel].get(AGPR_OFFSET)
  host_agpr_offset = 0 if host_agpr_offset is None else host_agpr_offset

  # Retrieve AGPR offset on guest kernel
  guest_agpr_offset = kernel_metadata_dict[guest_kernel].get(AGPR_OFFSET)
  guest_agpr_offset = 0 if guest_agpr_offset is None else guest_agpr_offset
  
  # Manipulate host kernel, modify metadata on kernarg segment size
  host_kernarg_size = kernel_metadata_dict[host_kernel][KERNARG_SIZE]
  guest_kernarg_size = kernel_metadata_dict[guest_kernel][KERNARG_SIZE]
  kernel_metadata_dict[host_kernel][KERNARG_SIZE] = host_kernarg_size + guest_kernarg_size

  # Manipulate host kernel, modify metadata on LDS usage
  if guest_lds_size > host_lds_size:
    kernel_metadata_dict[host_kernel][LDS_SIZE] = guest_lds_size

  # Manipulate host kernel, modify metadata on private usage
  if guest_private_size > host_private_size:
    kernel_metadata_dict[host_kernel][PRIVATE_SIZE] = guest_private_size

  # Maniuplate host kernel, modify metadata on SGPR/VGPR usage
  if guest_next_free_sgpr > host_next_free_sgpr:
    kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR] = guest_next_free_sgpr
  if guest_next_free_vgpr > host_next_free_vgpr:
    kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR] = guest_next_free_vgpr
  # Manipulate host kernel, modify metadata on AGPR usage
  if guest_agpr_offset > host_agpr_offset:
    kernel_metadata_dict[host_kernel][AGPR_OFFSET] = guest_agpr_offset

def host_peephole_modification(host_kernel_code):
  # Manipulate host kernel, disable s_endpgm
  for line_number in range(len(host_kernel_code)):
    line = host_kernel_code[line_number]
    m = re.search(r'^[ \t]+s_endpgm', line)
    if m is not None:
      host_kernel_code[line_number] = "\t;s_endpgm"
  return host_kernel_code

def guest_peephold_modification(guest_kernel_code):
  # Manipulate guest kernel, rename BBs
  for line_number in range(len(guest_kernel_code)):
    line = guest_kernel_code[line_number]
    m = re.search(r'(.*)BB(\d+)_(\d+)(.*)', line)
    if m is not None:
      guest_kernel_code[line_number] = m.group(1) + r'FUSED_BB' + m.group(2) + '_' + m.group(3) + m.group(4)
  return guest_kernel_code

def fuse_kernel(kernel_code_dict, kernel_metadata_dict, host_kernel, guest_kernel, kernel_prologue_list, kernel_epilogue_list, guest_kernel_is_from_binary = False):

  # Anaylsis ABI features
  abi_analysis_dict = abi_feature_analysis(kernel_metadata_dict, host_kernel, guest_kernel)

  # Decide if host kernel metadata has to be modified
  host_metadata_modification_needed = decide_host_metadata_modification_needed(abi_analysis_dict)

  if host_metadata_modification_needed == True:
    # Produce context adjust logic
    context_adjust_logic = emit_context_adjust_logic(kernel_metadata_dict, abi_analysis_dict, host_kernel, guest_kernel)

    # Modify host kernel metadata
    merge_abi_features(kernel_metadata_dict, host_kernel, guest_kernel)

    # Modify host kernel logic by inserting context adjust logic in the front
    kernel_code_dict[host_kernel] = context_adjust_logic + kernel_code_dict[host_kernel]

    # Re-compute host kernel register liveness analysis
    host_liveness_dict = liveness.liveness_analysis(kernel_code_dict[host_kernel])
    kernel_metadata_dict[host_kernel]["liveness"] = host_liveness_dict

    # Update kernel metadata for host kernel after liveness analysis
    kernel_metadata_dict[host_kernel] = liveness.deduce_descriptor(host_liveness_dict, kernel_metadata_dict[host_kernel])

  # Produce context save/restore logic
  [context_save_logic, context_restore_logic] = emit_context_save_restore_logic(kernel_metadata_dict, host_kernel, guest_kernel, kernel_code_dict)

  # Produce fused metadata
  merge_resource_allocation(kernel_metadata_dict, host_kernel, guest_kernel)

  # Emit logic to modify resource allocation
  # - Modify SGPR / VGPR allocation on the fused kernel
  # - Modify kernarg size on the fused kernel
  # - Modify LDS size on the fused kernel
  # - Modify private size on the fused kernel
  done_next_free_vgpr = False
  done_next_free_sgpr = False
  done_kernarg_size = False
  done_group_segment_fixed_size = False
  done_private_segment_fixed_size = False
  modified_kernel_epilogue_list = []
  for line in kernel_epilogue_list:
    if done_next_free_vgpr == False or done_next_free_sgpr == False or done_kernarg_size == False or done_group_segment_fixed_size == False or done_private_segment_fixed_size == False:
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
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(kernel_metadata_dict[host_kernel][KERNARG_SIZE]))
        elif m.group(1) == LDS_SIZE:
          done_group_segment_fixed_size = True
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(kernel_metadata_dict[host_kernel][LDS_SIZE]))
        elif m.group(1) == PRIVATE_SIZE:
          done_private_segment_fixed_size = True
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(kernel_metadata_dict[host_kernel][PRIVATE_SIZE]))
        else:
          modified_kernel_epilogue_list.append(line.rstrip())
      else:
        modified_kernel_epilogue_list.append(line.rstrip())
    else:
      modified_kernel_epilogue_list.append(line.rstrip())
  kernel_epilogue_list = modified_kernel_epilogue_list

  # TBD emit merged metadata on ROCm ABI features
  
  # Peephole modification for host kernel
  kernel_code_dict[host_kernel] = host_peephole_modification(kernel_code_dict[host_kernel])
  
  # Skip renaming BBs if guest kernel is extracted from binary.
  if guest_kernel_is_from_binary != True:
    kernel_code_dict[guest_kernel] = guest_peephold_modification(kernel_code_dict[guest_kernel])

  # TBD: global sync logic between host kernel and guest kernel
  
  # Start fusion
  kernel_code_dict[host_kernel] = context_save_logic + kernel_code_dict[host_kernel] + context_restore_logic + kernel_code_dict[guest_kernel]
  
  for line in kernel_prologue_list:
    print(line.rstrip())
  
  for line in kernel_code_dict[host_kernel]:
    print(line)
  
  for line in kernel_epilogue_list:
    print(line.rstrip())

def fuse_source_with_source(host_kernel, guest_kernel):
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
    host_kernel = manifest_lines[0].rstrip()
    guest_kernel = manifest_lines[1].rstrip()
  
  # Identify host and guest kernel
  host_kernel_identified = False
  guest_kernel_identified = False
  for kernel_name in kernel_name_list:
    if kernel_name == host_kernel:
      host_kernel_identified = True
    elif kernel_name == guest_kernel:
      guest_kernel_identified = True
  
  if host_kernel_identified == False:
    print("Missing host kernel!")
    exit(1)
  
  if guest_kernel_identified == False:
    print("Missing guest kernel!")
    exit(1)
  
  # Get kernel code and metadata
  input_file.seek(0)
  retrieve_kernel_source_code(host_kernel, input_file, kernel_code_dict, True, kernel_prologue_list, kernel_epilogue_list)
  input_file.seek(0)
  retrieve_kernel_metadata(host_kernel, input_file, kernel_metadata_dict)
  
  input_file.seek(0)
  retrieve_kernel_source_code(guest_kernel, input_file, kernel_code_dict)
  input_file.seek(0)
  retrieve_kernel_metadata(guest_kernel, input_file, kernel_metadata_dict)
  
  # Retrieve kernel SGPR usage
  retrieve_sgpr_usage(host_kernel, kernel_metadata_dict)
  retrieve_sgpr_usage(guest_kernel, kernel_metadata_dict)

  # Compute liveness analysis of host kernel
  host_liveness_dict = liveness.liveness_analysis(kernel_code_dict[host_kernel])
  kernel_metadata_dict[host_kernel]["liveness"] = host_liveness_dict

  # Update kernel metadata for host kernel after liveness analysis
  kernel_metadata_dict[host_kernel] = liveness.deduce_descriptor(host_liveness_dict, kernel_metadata_dict[host_kernel])

  fuse_kernel(kernel_code_dict, kernel_metadata_dict, host_kernel, guest_kernel, kernel_prologue_list, kernel_epilogue_list)
  
def fuse_source_with_dumper(host_kernel, guest_kernel):
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
    if kernel_name == host_kernel:
      host_kernel_identified = True
  
  if host_kernel_identified == False:
    print("Missing host kernel!")
    exit(1)
  
  # Get kernel code and metadata
  input_file.seek(0)
  retrieve_kernel_source_code(host_kernel, input_file, kernel_code_dict, True, kernel_prologue_list, kernel_epilogue_list)
  input_file.seek(0)
  retrieve_kernel_metadata(host_kernel, input_file, kernel_metadata_dict)
  
  # Retrieve kernel SGPR usage
  retrieve_sgpr_usage(host_kernel, kernel_metadata_dict)

  # Compute liveness analysis of host kernel
  host_liveness_dict = liveness.liveness_analysis(kernel_code_dict[host_kernel])
  kernel_metadata_dict[host_kernel]["liveness"] = host_liveness_dict

  # Update kernel metadata for host kernel after liveness analysis
  kernel_metadata_dict[host_kernel] = liveness.deduce_descriptor(host_liveness_dict, kernel_metadata_dict[host_kernel])

  # Obtain guest kernel from dumper
  code_object_filename = dumper.get_code_object(LIBRCCL_PATH)
  [descriptor_address, descriptor_length, kernel_address, kernel_length] = dumper.get_symbol(code_object_filename, guest_kernel)
  kernel_code_dict[guest_kernel] = dumper.get_isa(code_object_filename, guest_kernel)

  # Compute liveness analysis of guest kernel
  guest_liveness_dict = liveness.liveness_analysis(kernel_code_dict[guest_kernel])

  # Get kernel metadata for guest kernel after liveness analysis
  kernel_metadata_dict[guest_kernel] = dumper.get_descriptor(code_object_filename, descriptor_address, descriptor_length, guest_liveness_dict)
  kernel_metadata_dict[guest_kernel]["liveness"] = guest_liveness_dict

  fuse_kernel(kernel_code_dict, kernel_metadata_dict, host_kernel, guest_kernel, kernel_prologue_list, kernel_epilogue_list, True)

def abi_feature_analysis(kernel_metadata_dict, host_kernel, guest_kernel):
  # Retrieve information on the usage of ROCm ABI features
  abi_analysis = {}
  for [feature, prefix] in [("private_segment_buffer", "amdhsa_user_sgpr_"), \
                            ("dispatch_ptr", "amdhsa_user_sgpr_"), \
                            ("queue_ptr", "amdhsa_user_sgpr_"), \
                            ("kernarg_segment_ptr", "amdhsa_user_sgpr_"), \
                            ("flat_scratch_init", "amdhsa_user_sgpr_"), \
                            ("workgroup_id_x", "amdhsa_system_sgpr_"), \
                            ("workgroup_id_y", "amdhsa_system_sgpr_"), \
                            ("workgroup_id_z", "amdhsa_system_sgpr_")]:
    # Obtain if a ROCm ABI feature is declared
    host_declared = (kernel_metadata_dict[host_kernel][prefix + feature] == 1)
    guest_declared = (kernel_metadata_dict[guest_kernel][prefix + feature] == 1)

    # Obtain if registers for a ROCm ABI feature is used
    host_used = kernel_metadata_dict[host_kernel].get(feature + "_used")
    host_used = False if host_used is None else host_used
    guest_used = kernel_metadata_dict[guest_kernel].get(feature + "_used")
    geust_used = False if guest_used is None else guest_used

    # Obtain if registers for a ROCm ABI feature is overriden
    host_overriden = kernel_metadata_dict[host_kernel].get(feature + "_overriden")
    host_overriden = False if host_overriden is None else host_overriden
    guest_overriden = kernel_metadata_dict[guest_kernel].get(feature + "_overriden")
    guest_overriden = False if guest_overriden is None else guest_overriden

    abi_analysis[feature] = {}
    abi_analysis[feature]["host_declared"] = host_declared
    abi_analysis[feature]["guest_declared"] = guest_declared
    abi_analysis[feature]["host_used"] = host_used
    abi_analysis[feature]["guest_used"] = guest_used
    abi_analysis[feature]["host_overriden"] = host_overriden
    abi_analysis[feature]["guest_overriden"] = guest_overriden
  return abi_analysis

def emit_context_adjust_logic(kernel_metadata_dict, abi_analysis_dict, host_kernel, guest_kernel):
  # Emit context adjust logic
  # Prior analysis was already carried out to decide it's necessary to do the emission
  context_adjust_logic = []
  context_adjust_logic.append("; context adjust logic")
  for feature in ["private_segment_buffer", "dispatch_ptr", "queue_ptr", "kernarg_segment_ptr", "flat_scratch_init", "workgroup_id_x", "workgroup_id_y", "workgroup_id_z"]:
    host_used = abi_analysis_dict[feature]["host_used"]
    if host_used == True:
      host_registers = kernel_metadata_dict[host_kernel][feature]
      guest_registers = kernel_metadata_dict[guest_kernel][feature]
      context_adjust_logic.append('\t; adjust ' + feature + ' SGPR')
      for [host_reg, guest_reg] in zip(host_registers, guest_registers):
        context_adjust_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(host_reg) + ', ' + 's' + str(guest_reg))
  context_adjust_logic.append("; begin of host kernel before context adjust")
  return context_adjust_logic

if __name__ == "__main__":
    # Kernel fusion process
    # obtain guest / host kernel logic from source/binary
    # obtain guest / host kernel descriptor from binary
    # compute guest / host kernel metadata (potentially from kernel descriptor)
    # compute guest / host kernel register liveness analysis
    # decide if host kernel metadata on ABI features has to be modified
    # - produce context adjust logic
    # - modify host kernel metadata on ABI features
    # - modify host kernel logic by inserting context adjust logic in the front
    # - re-compute host kernel register liveness analysis
    # produce context save/restore logic
    # modify host kernel metadata on resource allocation
    # peep-hole host kernel logic modification
    # peep-hole guest kernel logic modification
    # product global sync logic
    # kernel fusion by concatenating:
    # - context save logic
    # - host kernel logic (may have context adjust logic in the beginning)
    # - global sync logic
    # - context restore logic
    # - guest kernel logic

    fuse_source_with_source(HOST_KERNEL, GUEST_KERNEL)
    #fuse_source_with_dumper(HOST_KERNEL, RCCL_KERNEL_NAME)
