#!/usr/bin/python3

import re
import sys

import dumper
import liveness

# Configuration
INPUT_FILE = "vectoradd_hip-hip-amdgcn-amd-amdhsa-gfx90a.s"
FUSED_MANIFEST_FILE = "fused_manifest.txt"
HOST_KERNEL = '_Z7kernel1PKfS0_PfPi'
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
AGPR_OFFSET = r'amdhsa_accum_offset'

KERNARG_SIZE = r'amdhsa_kernarg_size'
LDS_SIZE = r'amdhsa_group_segment_fixed_size'
PRIVATE_SIZE = r'amdhsa_private_segment_fixed_size'
USER_SGPR_COUNT = r'amdhsa_user_sgpr_count'
XNACK_MASK = r'amdhsa_reserve_xnack_mask'

SYSTEM_SGPR_WORKGROUP_ID = r'amdhsa_system_sgpr_workgroup_id_'
SYSTEM_SGPR_PRIVATE_SEGMENT_WAVEFRONT_OFFSET = r'amdhsa_system_sgpr_private_segment_wavefront_offset'

DIMENSIONS = [ 'x', 'y', 'z' ]

USER_SGPR_CP_COUNT = r'user_sgpr_cp_count'
USER_SGPR_ADC_COUNT = r'user_sgpr_adc_count'
USER_SGPR_SPI_COUNT = r'user_sgpr_spi_count'

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
LIBRCCL_PATH = "/home/jack/projects/rccl/build/librccl.so"
RCCL_KERNEL_NAME = "_Z42ncclKernel_SendRecv_RING_SIMPLE_Sum_int8_tP11ncclDevCommmP8ncclWork"

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

  # user sgprs set by SPI
  user_sgpr_spi_count = 0
  if metadata_dict[kernel_name][SYSTEM_SGPR_PRIVATE_SEGMENT_WAVEFRONT_OFFSET] == 1:
      user_sgpr_spi_count += 1
  metadata_dict[kernel_name][USER_SGPR_SPI_COUNT] = user_sgpr_spi_count
  #print("User sgpr set by SPI: " + str(user_sgpr_spi_count))

def decide_host_metadata_modification_needed(abi_analysis_dict):
  needed = False
  for feature in ["private_segment_buffer", "dispatch_ptr", "queue_ptr", "kernarg_segment_ptr", "flat_scratch_init", "workgroup_id_x", "workgroup_id_y", "workgroup_id_z", "private_segment_wavefront_offset"]:
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
                            ("workgroup_id_z", "amdhsa_system_sgpr_"), \
                            ("private_segment_wavefront_offset", "amdhsa_system_sgpr_")]:
    # _used, _overriden will be computed by liveness analysis
    # only modify metadata fields and registers used
    kernel_metadata_dict[host_kernel][prefix + feature] = kernel_metadata_dict[guest_kernel][prefix + feature]
    guest_registers = kernel_metadata_dict[guest_kernel].get(feature)
    if guest_registers is not None:
      kernel_metadata_dict[host_kernel][feature] = guest_registers

  # Merge metadta regarding to the total SGPRs set by CP and ADC and SPI
  kernel_metadata_dict[host_kernel][USER_SGPR_CP_COUNT] = kernel_metadata_dict[guest_kernel][USER_SGPR_CP_COUNT]
  kernel_metadata_dict[host_kernel][USER_SGPR_ADC_COUNT] = kernel_metadata_dict[guest_kernel][USER_SGPR_ADC_COUNT]
  kernel_metadata_dict[host_kernel][USER_SGPR_SPI_COUNT] = kernel_metadata_dict[guest_kernel][USER_SGPR_SPI_COUNT]

def emit_context_save_restore_logic(kernel_metadata_dict, host_kernel, guest_kernel, kernel_code_dict):
  # Produce context save/restore logic
  context_save_logic = []
  context_save_logic.append("; context save logic")
  context_restore_logic = []
  context_restore_logic.append("; context restore logic")
  
  # Obtain the next available SGPR / VGPR
  next_sgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR]
  next_sgpr_unset_by_cp_adc_spi = kernel_metadata_dict[host_kernel][USER_SGPR_CP_COUNT] + kernel_metadata_dict[host_kernel][USER_SGPR_ADC_COUNT] + kernel_metadata_dict[host_kernel][USER_SGPR_SPI_COUNT]
  if next_sgpr < next_sgpr_unset_by_cp_adc_spi:
    next_sgpr = next_sgpr_unset_by_cp_adc_spi
  next_vgpr = kernel_metadata_dict[host_kernel][NEXT_FREE_VGPR]
  
  user_sgpr_adc_saved = 0
  # Produce logic to preserve workgroup ID SGPR
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

  user_sgpr_spi_saved = 0
  # Produce logic to preserve private segment wavefront offst SGPR
  overriden = kernel_metadata_dict[host_kernel].get("private_segment_wavefront_offset" + "_overriden")
  if overriden is not None and overriden == 1:
    context_save_logic.append('\t; save private segment wavefront offset')
    context_save_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(next_sgpr) + ', ' + 's' + str(kernel_metadata_dict[host_kernel][USER_SGPR_CP_COUNT] + kernel_metadata_dict[host_kernel][USER_SGPR_ADC_COUNT] + user_sgpr_spi_saved))
    context_restore_logic.append('\t; restore private segment wavefront offset')
    context_restore_logic.append('\ts_mov_b32_e32' + ' ' + 's' + str(kernel_metadata_dict[guest_kernel][USER_SGPR_CP_COUNT] + kernel_metadata_dict[host_kernel][USER_SGPR_ADC_COUNT] + user_sgpr_spi_saved) + ', ' + 's' + str(next_sgpr))
    next_sgpr += 1
    user_sgpr_spi_saved += 1

  kernel_metadata_dict[host_kernel][NEXT_FREE_SGPR] = next_sgpr
  
  # Produce logic to preserve workitem ID VGPR
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
    # Only produce context save/restore logic in case:
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
  # XXX. FIX guest_agpr_offset.
  if abs(guest_agpr_offset - guest_next_free_vgpr) > 4:
    guest_agpr_offset = (guest_next_free_vgpr + 4) // 4 * 4
  
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

def kernel_prologue_peephole_modification(kernel_prologue_list):
  # Manipulate kernel prologue, modify .amdgcn_target
  for line_number in range(len(kernel_prologue_list)):
    line = kernel_prologue_list[line_number]
    m = re.search(r'amdgcn_target', line)
    if m is not None:
      kernel_prologue_list[line_number] = re.sub('-gfx90a"', '-gfx90a:xnack-"', line)
      break
  return kernel_prologue_list

def host_peephole_modification(host_kernel_code):
  # Manipulate host kernel
  # Disable s_endpgm
  # Add s_waitcnt vmcnt(0) lgkmcnt(0)
  for line_number in range(len(host_kernel_code)):
    line = host_kernel_code[line_number]
    m = re.search(r'^[ \t]+s_endpgm', line)
    if m is not None:
      host_kernel_code[line_number] = "\t;s_endpgm"
      host_kernel_code.insert(line_number + 1, "\ts_waitcnt vmcnt(0) lgkmcnt(0)")
  return host_kernel_code

def guest_peephold_modification(guest_kernel_code):
  # Manipulate guest kernel, rename BBs
  for line_number in range(len(guest_kernel_code)):
    line = guest_kernel_code[line_number]
    m = re.search(r'(.*)BB(\d+)_(\d+)(.*)', line)
    if m is not None:
      guest_kernel_code[line_number] = m.group(1) + r'FUSED_BB' + m.group(2) + '_' + m.group(3) + m.group(4)
  return guest_kernel_code

def emit_modified_kernel_epilogue(kernel_metadata_dict, host_kernel, kernel_epilogue_list):
  # Emit logic to modify resource allocation
  # - Modify SGPR / VGPR allocation on the fused kernel
  # - Modify kernarg size on the fused kernel
  # - Modify LDS size on the fused kernel
  # - Modify private size on the fused kernel
  # - Modify USER SGPR count
  # - Modify .amdhsa_reserve_xnack_mask
  done_next_free_vgpr = False
  done_next_free_sgpr = False
  done_agpr_offset = False
  done_kernarg_size = False
  done_group_segment_fixed_size = False
  done_private_segment_fixed_size = False
  done_user_sgpr_count = False
  reach_end_of_metadata = False
  modified_kernel_epilogue_list = []
  for line in kernel_epilogue_list:
    m = re.search(KERNEL_METADATA_END_REGEX, line)
    if m is not None:
      reach_end_of_metadata = True

    if reach_end_of_metadata == False and (done_next_free_vgpr == False or done_next_free_sgpr == False or done_kernarg_size == False or done_group_segment_fixed_size == False or done_private_segment_fixed_size == False or done_agpr_offset == False or done_user_sgpr_count == False):
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
        elif m.group(1) == AGPR_OFFSET:
          done_agpr_offset = True
          agpr_offset = kernel_metadata_dict[host_kernel].get(AGPR_OFFSET)
          agpr_offset = 0 if agpr_offset is None else agpr_offset
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(agpr_offset))
        elif m.group(1) == USER_SGPR_COUNT:
          done_user_sgpr_count = True
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(kernel_metadata_dict[host_kernel][USER_SGPR_CP_COUNT]))
        elif m.group(1) == XNACK_MASK:
          done_xnack_mask = True
          modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + '0')
        else:
          modified_kernel_epilogue_list.append(line.rstrip())
      else:
        modified_kernel_epilogue_list.append(line.rstrip())
    else:
      # Need to clear XNACK mask on every metadata
      m = re.search(KERNEL_METADATA_ENTRY_REGEX, line)
      if m is not None and m.group(1) == XNACK_MASK:
        modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + '0')
      else:
        modified_kernel_epilogue_list.append(line.rstrip())
  kernel_epilogue_list = modified_kernel_epilogue_list

  # Emit merged metadata on ROCm ABI features
  modified_kernel_epilogue_list = []
  reach_end_of_metadata = False
  for line in kernel_epilogue_list:
    m = re.search(KERNEL_METADATA_END_REGEX, line)
    if m is not None:
      reach_end_of_metadata = True

    if reach_end_of_metadata == False:
      m = re.search(KERNEL_METADATA_ENTRY_REGEX, line)
      if m is not None:
        for [feature, prefix] in [("private_segment_buffer", "amdhsa_user_sgpr_"), \
                                  ("dispatch_ptr", "amdhsa_user_sgpr_"), \
                                  ("queue_ptr", "amdhsa_user_sgpr_"), \
                                  ("kernarg_segment_ptr", "amdhsa_user_sgpr_"), \
                                  ("flat_scratch_init", "amdhsa_user_sgpr_"), \
                                  ("workgroup_id_x", "amdhsa_system_sgpr_"), \
                                  ("workgroup_id_y", "amdhsa_system_sgpr_"), \
                                  ("workgroup_id_z", "amdhsa_system_sgpr_"), \
                                  ("private_segment_wavefront_offset", "amdhsa_system_sgpr_")]:
          if m.group(1) == prefix + feature:
            modified_kernel_epilogue_list.append('\t\t.' + m.group(1) + ' ' + str(kernel_metadata_dict[host_kernel][prefix + feature]))
            break
        else:
          modified_kernel_epilogue_list.append(line.rstrip())
      else:
        modified_kernel_epilogue_list.append(line.rstrip())
    else:
      modified_kernel_epilogue_list.append(line.rstrip())
  kernel_epilogue_list = modified_kernel_epilogue_list
  return kernel_epilogue_list

def emit_global_sync_logic(kernarg_segment_pointer_sgpr = [4, 5], semaphore_pointer_offset = 0x18, workitem_id_vgpr = [5], workgroup_id_sgpr = [10], host_kernel_workgroup_number = 288, guest_kernel_workgroup_number = 32, work_vgpr = [2, 3, 18, 19], work_sgpr = [20, 18, 19], to_emit_debug_output = False, debug_vgpr = [0, 1]):
  # To dynamically emit global sync logic, following data are needed:
  # - Kernarg segment pointer SGPRs
  # - Offset to the semaphore pointer
  # - VGPRs to hold workitem ID X (TBD: handle 2D/3D cases where Y/Z needs to be considered)
  # - SGPRs to hold workgroup ID X (TBD: handle 2D/3D cases where Y/Z needs to be considered)
  # - Workgroup # in the host kernel
  # - Workgroup # in the guest kernel
  # - 4 available VGPRs, the last 2 of them must be in consecutive numbers
  # - 3 available SGPRs, the last 2 of them must be in consecutive numbers
  global_sync_logic = []
#; global sync logic
#GLOBAL_SYNC_ENTRY:
  global_sync_logic.append('; global sync logic')
  global_sync_logic.append('GLOBAL_SYNC_ENTRY:')

#    ; fetch semaphore pointer
#    ; s[4:5] = kernarg segment pointer
#    ; s[4:5]+0x18 = sempahore pointer on global memory
#    s_load_dwordx2 s[18:19], s[4:5], 0x18
  sgpr_kernarg_segment_pointer = 's[' + str(kernarg_segment_pointer_sgpr[0]) + ':' + str(kernarg_segment_pointer_sgpr[1]) + ']'
  sgpr_semaphore = 's[' + str(work_sgpr[1]) + ':' + str(work_sgpr[2]) + ']'
  semaphore_offset = str(hex(semaphore_pointer_offset))
  global_sync_logic.append('\t; fetch semaphore pointer')
  global_sync_logic.append('\t; ' + sgpr_kernarg_segment_pointer + ' = kernarg segment pointer')
  global_sync_logic.append('\t; ' + sgpr_kernarg_segment_pointer + ' + ' + sgpr_semaphore + ' = semaphore pointer on global memory')
  global_sync_logic.append('\ts_load_dwordx2 ' + sgpr_semaphore + ', ' + sgpr_kernarg_segment_pointer + ', ' + semaphore_offset)
  global_sync_logic.append('\t')

#    ; check if we are at workitem 0
#    ; v5 = workitem ID X
#    v_cmp_eq_u32_e32 vcc, 0, v5
#    s_waitcnt lgkmcnt(0)
#    ; backup EXEC mask
#    s_and_saveexec_b64 s[4:5], vcc
  vgpr_workitem_id_x = 'v' + str(workitem_id_vgpr[0])
  global_sync_logic.append('\t; check if we are at workitem 0')
  global_sync_logic.append('\t; ' + vgpr_workitem_id_x + ' = workitem ID X')
  global_sync_logic.append('\tv_cmp_eq_u32_e32 vcc, 0, ' + vgpr_workitem_id_x)
  global_sync_logic.append('\ts_waitcnt lgkmcnt(0)')
  global_sync_logic.append('\t; backup EXEC mask')
  global_sync_logic.append('\ts_and_saveexec_b64 ' + sgpr_kernarg_segment_pointer + ', vcc')
  global_sync_logic.append('\t')
    
#    ; workitem 0 in a workgroup atomically increase 1 to the semaphore
#    v_mov_b32_e32 v2, 1
#    v_mov_b32_e32 v3, 288 + 1
#    v_mov_b32_e32 v18, s18
#    v_mov_b32_e32 v19, s19
#    flat_atomic_inc v2, v[18:19], v3 glc
#    s_waitcnt vmcnt(0)
  vgpr_one = 'v' + str(work_vgpr[0])
  vgpr_host_kernel_workgroup_number_plus_one = 'v' + str(work_vgpr[1])
  sgpr_semaphore_lsb = 's' + str(work_sgpr[1])
  vgpr_semaphore_lsb = 'v' + str(work_vgpr[2])
  sgpr_semaphore_msb = 's' + str(work_sgpr[2])
  vgpr_semaphore_msb = 'v' + str(work_vgpr[3])
  vgpr_semaphore = 'v[' + str(work_vgpr[2]) + ':' + str(work_vgpr[3]) + ']'
  global_sync_logic.append('\t; workitem 0 in a workgroup atomically increase 1 to the semaphore')
  global_sync_logic.append('\tv_mov_b32_e32 ' + vgpr_one + ', 1')
  global_sync_logic.append('\tv_mov_b32_e32 ' + vgpr_host_kernel_workgroup_number_plus_one + ', ' + str(host_kernel_workgroup_number + 1))
  global_sync_logic.append('\tv_mov_b32_e32 ' + vgpr_semaphore_lsb + ', ' + sgpr_semaphore_lsb)
  global_sync_logic.append('\tv_mov_b32_e32 ' + vgpr_semaphore_msb + ', ' + sgpr_semaphore_msb)
  global_sync_logic.append('\tflat_atomic_inc ' + vgpr_one + ', ' + vgpr_semaphore + ', ' + vgpr_host_kernel_workgroup_number_plus_one + ' glc')
  global_sync_logic.append('\ts_waitcnt vmcnt(0)')
  global_sync_logic.append('\t')
    
#    ; for workitems != 0 enter barrier directly
#    s_cbranch_execz GLOBAL_SYNC_LOOP_END
#    ; for workgroups >= 32 enter barrier directly
#    s_cmpk_lt_u32_e32 s10, 32
#    s_cbranch_scc0 GLOBAL_SYNC_LOOP_END
  sgpr_workgroup_id_x = 's' + str(workgroup_id_sgpr[0])
  global_sync_logic.append('\t; for workitems != 0 enter barrier directly')
  global_sync_logic.append('\ts_cbranch_execz GLOBAL_SYNC_LOOP_END')
  global_sync_logic.append('\t; for workgroups >= ' + str(guest_kernel_workgroup_number) + ' enter barrier directly')
  global_sync_logic.append('\ts_cmpk_lt_u32_e32 ' + sgpr_workgroup_id_x + ', ' + str(guest_kernel_workgroup_number))
  global_sync_logic.append('\ts_cbranch_scc0 GLOBAL_SYNC_LOOP_END')
  global_sync_logic.append('\t')
    
#    ; only workitem 0 in workgroups to be used by the guest kernel participate in the spin loop
#    ; use atomic add instructions to retrieve the # of workgroups finished
#GLOBAL_SYNC_LOOP:
#    v_mov_b32_e32 v2, 0
#    flat_atomic_add v2, v[18:19], v2 glc
#    s_waitcnt vmcnt(0)
#    v_cmp_eq_u32_e32 vcc, 288, v2
#    s_waitcnt vmcnt(0)
#    s_cbranch_vccz GLOBAL_SYNC_LOOP
  global_sync_logic.append('\t; only workitem 0 in workgroups to be used by the guest kernel participate in the spin loop')
  global_sync_logic.append('\t; use atomic add instructions to retrieve the # of workgroups finished')
  global_sync_logic.append('GLOBAL_SYNC_LOOP:')
  global_sync_logic.append('\tv_mov_b32_e32 ' + vgpr_one + ', 0')
  global_sync_logic.append('\tflat_atomic_add ' + vgpr_one + ', ' + vgpr_semaphore + ', ' + vgpr_one + ' glc')
  global_sync_logic.append('\ts_waitcnt vmcnt(0)')
  global_sync_logic.append('\tv_cmp_eq_u32_e32 vcc, ' + str(host_kernel_workgroup_number) + ', ' + vgpr_one)
  global_sync_logic.append('\ts_waitcnt vmcnt(0)')
  global_sync_logic.append('\ts_cbranch_vccz GLOBAL_SYNC_LOOP')
  global_sync_logic.append('\t')
    
  if to_emit_debug_output == True:
    #; store the # of workgroups exit atomic spin loop to C for debugging
    #global_store_dword v[0:1], v2, off
    #s_waitcnt vmcnt(0)
    vgpr_debug = 'v[' + str(debug_vgpr[0]) + ':' + str(debug_vgpr[1]) + ']'
    global_sync_logic.append('\t; store the # of workgroups exit atomic spin loop to C for debugging')
    global_sync_logic.append('\tglobal_store_dword ' + vgpr_debug + ', ' + vgpr_one + ', off')
    global_sync_logic.append('\ts_waitcnt vmcnt(0)')
    global_sync_logic.append('\t')
  else: 
    #; do an no-effect atomic add plus 0 once again
    #v_mov_b32_e32 v2, 0
    #flat_atomic_add v2, v[18:19], v2 glc
    #s_waitcnt vmcnt(0)
    global_sync_logic.append('\t; do an no-effect atomic add plus 0 once again')
    global_sync_logic.append('\tv_mov_b32_e32 ' + vgpr_one + ', 0')
    global_sync_logic.append('\tflat_atomic_add ' + vgpr_one + ', ' + vgpr_semaphore + ', ' + vgpr_one + ' glc')
    global_sync_logic.append('\ts_waitcnt vmcnt(0)')
    global_sync_logic.append('\t')

#GLOBAL_SYNC_LOOP_END:
#    s_barrier
#    ; restore EXEC mask
#    s_or_saveexec_b64 s[4:5], s[4:5]
    global_sync_logic.append('GLOBAL_SYNC_LOOP_END:')
    global_sync_logic.append('s_barrier')
    global_sync_logic.append('; restore EXEC mask')
    global_sync_logic.append('s_or_saveexec_b64 ' + sgpr_kernarg_segment_pointer + ', ' + sgpr_kernarg_segment_pointer)
    global_sync_logic.append('\t')
    
#    ; clear the semaphore only on workgroup 0
#    ; s10 = workgroup ID X
#    s_cmpk_eq_u32_e32 s10, 0
#    s_cbranch_scc0 GLOBAL_SYNC_END
#    s_mov_b32 s20, 0
#    s_store_dword s20, s[18:19] glc
#    s_waitcnt vmcnt(0) lgkmcnt(0)
#GLOBAL_SYNC_END:
    sgpr_zero = 's' + str(work_sgpr[0])
    global_sync_logic.append('\t; clear the semaphore only on workgroup 0')
    global_sync_logic.append('\t; ' + sgpr_workgroup_id_x + ' = workgroup ID X')
    global_sync_logic.append('\ts_cmpk_eq_u32_e32 ' + sgpr_workgroup_id_x + ', 0')
    global_sync_logic.append('\ts_cbranch_scc0 GLOBAL_SYNC_END')
    global_sync_logic.append('\ts_mov_b32 ' + sgpr_zero + ', 0')
    global_sync_logic.append('\ts_store_dword ' + sgpr_zero + ', ' + sgpr_semaphore + ' glc')
    global_sync_logic.append('\ts_waitcnt vmcnt(0) lgkmcnt(0)')
    global_sync_logic.append('\tGLOBAL_SYNC_END:')

  return global_sync_logic

def fuse_kernel(kernel_code_dict, kernel_metadata_dict, host_kernel, guest_kernel, kernel_prologue_list, kernel_epilogue_list, guest_kernel_is_from_binary = False, call_graph = None, call_graph_isa = None, to_use_global_sync = False):
  # Switch guest kernel logic from call graph ISA if it's available
  # Call sites have been modified already
  if call_graph is not None:
    assert call_graph_isa is not None
    assert len(call_graph) == len(call_graph_isa)
    # Guest kernel logic is the first
    kernel_code_dict[guest_kernel] = call_graph_isa[0]
    
    # For all others, insert into kernel prologue list
    # TBD. Find a better way to handle kernel prologue list
    host_kernel_prologue = kernel_prologue_list[2:]
    host_kernel_prologue.insert(0, kernel_prologue_list[0])
    kernel_prologue_list = [kernel_prologue_list[1]]
    for index in range(1, len(call_graph)):
      kernel_prologue_list.append('\t.text')
      kernel_prologue_list.append('\t.p2align\t2')
      kernel_prologue_list.append('\t.type\t' + call_graph[index] + ',@function')
      kernel_prologue_list.append(call_graph[index] + ':')
      kernel_prologue_list.extend(call_graph_isa[index])
      kernel_prologue_list.append('.Lfunc_end_call_graph' + str(index) + ':')
      kernel_prologue_list.append('\t.size\t' + call_graph[index] + ', .Lfunc_end_call_graph' + str(index) + '-' + call_graph[index])
      kernel_prologue_list.append('')

    kernel_prologue_list.extend(host_kernel_prologue)

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

  # Emit logic modified metadata on  resource allocation and ROCm ABI features
  kernel_epilogue_list = emit_modified_kernel_epilogue(kernel_metadata_dict, host_kernel, kernel_epilogue_list)
  
  # Peephole modification for host kernel
  kernel_code_dict[host_kernel] = host_peephole_modification(kernel_code_dict[host_kernel])

  # Peephole modification for kernel prologue
  kernel_prologue_list = kernel_prologue_peephole_modification(kernel_prologue_list)
  
  # Skip renaming BBs if guest kernel is extracted from binary.
  if guest_kernel_is_from_binary != True:
    kernel_code_dict[guest_kernel] = guest_peephold_modification(kernel_code_dict[guest_kernel])

  # global sync logic between host kernel and guest kernel
  if to_use_global_sync == True:
    global_sync_logic = emit_global_sync_logic()
  else:
    global_sync_logic = []
  
  # Start fusion
  kernel_code_dict[host_kernel] = context_save_logic + kernel_code_dict[host_kernel] + global_sync_logic + context_restore_logic + kernel_code_dict[guest_kernel]
  
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
  
def fuse_source_with_binary(host_kernel, guest_kernel, to_use_global_sync = False):
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

  # Obtain symbol table of the code object containing the guest kernel
  symbol_table = dumper.get_symbol_table(code_object_filename)

  # Obtain call graph and ISA rooted from the guest kernel
  call_graph = [guest_kernel]
  call_graph_isa = []
  [call_graph, call_graph_isa] = dumper.follow_call_graph(code_object_filename, guest_kernel, kernel_code_dict[guest_kernel], symbol_table, call_graph, call_graph_isa, True)

  fuse_kernel(kernel_code_dict, kernel_metadata_dict, host_kernel, guest_kernel, kernel_prologue_list, kernel_epilogue_list, True, call_graph, call_graph_isa, to_use_global_sync)

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
                            ("workgroup_id_z", "amdhsa_system_sgpr_"), \
                            ("private_segment_wavefront_offset", "amdhsa_system_sgpr_")]:
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
  for feature in ["private_segment_buffer", "dispatch_ptr", "queue_ptr", "kernarg_segment_ptr", "flat_scratch_init", "workgroup_id_x", "workgroup_id_y", "workgroup_id_z", "private_segment_wavefront_offset"]:
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
    # - obtain device functions used following call graph
    # - modify device function addresses from absolute values to relative ones 
    # obtain guest / host kernel descriptor from binary
    # compute guest / host kernel metadata (potentially from kernel descriptor)
    # compute guest / host kernel register liveness analysis
    # - register liveness analysis needs to consider call graph
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

    #fuse_source_with_source(HOST_KERNEL, GUEST_KERNEL)
    fuse_source_with_binary(HOST_KERNEL, RCCL_KERNEL_NAME, True)
