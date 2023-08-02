#!/usr/bin/python3.7

import re

REGISTER_REGEX = r'([sv][0-9]+|[sv]\[[0-9]+:[0-9]+\])'
SINGLE_REGISTER_REGEX = r'([sv])([0-9]+)'
MULTIPLE_REGISTER_REGEX = r'([sv])\[([0-9]+):([0-9]+)\]'

def register_key_func(word):
  register_number = int(word[0][1:])
  register_file_number = 0
  # s -> v -> a
  register_file = word[0][0]
  if register_file == 'v':
    register_file_number = 256
  elif register_file == 'a':
    register_file_number = 512
  return register_file_number + register_number

def liveness_analysis(isa):
  if type(isa) != type([]):
    isa = isa.splitlines()
  # entries is a 4-tuple:
  # 0: earliest input
  # 1: latest input
  # 2: earliest output
  # 3: latest output
  liveness_dict = {}
  line_number = 0
  for line in isa:
    line = line[:line.find('//')].rstrip()
    #print(str(line_number) + ":\t" + line)
  
    token_index = 0
    input_registers = []
    output_registers = []
    for token in line.split()[1:]:
      m = re.search(REGISTER_REGEX, token)
      if m is not None:
        register_list = []
        n = re.search(SINGLE_REGISTER_REGEX, token)
        if n is not None:
          # process single register
          register_list.append(m.group(1))
        else:
          # process multiple registers
          n = re.search(MULTIPLE_REGISTER_REGEX, token)
          for register_index in range(int(n.group(2)), int(n.group(3))+1):
            register_list.append(n.group(1) + str(register_index))
  
        if token_index != 0:
          input_registers.extend(register_list)
        else:
          output_registers.extend(register_list)
      token_index = token_index + 1
  
    #if (len(input_registers) > 0):
    #  print("\tINPUT : " + str(input_registers))
    #if (len(output_registers) > 0):
    #  print("\tOUTPUT :" + str(output_registers))
  
    for register in input_registers:
      if liveness_dict.get(register) is None:
        liveness_dict[register] = [ line_number, line_number, -1, -1 ]
      else:
        if liveness_dict[register][0] == -1 and liveness_dict[register][1] == -1:
          liveness_dict[register][0] = line_number
          liveness_dict[register][1] = line_number
        else:
          liveness_dict[register][1] = line_number
  
    for register in output_registers:
      if liveness_dict.get(register) is None:
        liveness_dict[register] = [ -1, -1, line_number, line_number ]
      else:
        if liveness_dict[register][2] == -1 and liveness_dict[register][3] == -1:
          liveness_dict[register][2] = line_number
          liveness_dict[register][3] = line_number
        else:
          liveness_dict[register][3] = line_number
  
    line_number = line_number + 1
  return dict(sorted(liveness_dict.items(), key = register_key_func))

def get_register_usage(liveness_dict):
  register_list = liveness_dict.keys()
  max_sgpr = -1
  max_vgpr = -1
  max_agpr = -1
  for register in register_list:
    register_value = int(register[1:])
    if register[0] == 's':
      if max_sgpr < register_value:
        max_sgpr = register_value
    elif register[0] == 'v':
      if max_vgpr < register_value:
        max_vgpr = register_value
    elif register[0] == 'a':
      if max_agpr < register_value:
        max_agpr = register_value
  return [max_sgpr + 1, max_vgpr + 1, max_agpr + 1]

FIRST_INPUT = 0
LAST_INPUT = 1
FIRST_OUTPUT = 2
LAST_OUTPUT = 3
def deduce_descriptor(liveness_dict, descriptor_dict):
  # Obtain register usage information
  [max_sgpr, max_vgpr, max_agpr] = get_register_usage(liveness_dict)

  # Set SGPR, VGPR, AGPR information
  descriptor_dict["amdhsa_next_free_sgpr"] = max_sgpr
  descriptor_dict["amdhsa_next_free_vgpr"] = max_vgpr
  if max_agpr != 0:
    descriptor_dict["amdhsa_accum_offset"] = max_agpr

  # Understand the number of SGPRs set by CP from RSRC2
  user_sgpr_cp_count = descriptor_dict["user_sgpr_cp_count"]

  # Identify each SGPR be initialized by CP
  sgpr_initialized_by_cp = []
  for sgpr in range(user_sgpr_cp_count):
    l = liveness_dict.get('s' + str(sgpr))
    if l is not None and (l[0] > 0) and (l[2] == -1 or l[0] < l[2]):
      sgpr_initialized_by_cp.append(sgpr)

  #print("CP: ", sgpr_initialized_by_cp)

  # TBD. Logic here is quite ad-hoc. Need further improvement.
  if user_sgpr_cp_count == 14:
    # private segment buffer is used
    # dispatch ptr is used
    # queue ptr is used
    # kernarg segment ptr is used
    # dispatch id is used
    # flat scratch init is used
    descriptor_dict["amdhsa_user_sgpr_private_segment_buffer"] = 1
    descriptor_dict["amdhsa_user_sgpr_dispatch_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_dispatch_id"] = 1
    descriptor_dict["amdhsa_user_sgpr_flat_scratch_init"] = 1

    descriptor_dict["private_segment_buffer"] = [0, 1, 2, 3]
    descriptor_dict["dispatch_ptr"] = [4, 5]
    descriptor_dict["queue_ptr"] = [6, 7]
    descriptor_dict["kernarg_segment_ptr"] = [8, 9]
    descriptor_dict["dispatch_id"] = [10, 11]
    descriptor_dict["flat_scratch_init"] = [12, 13]
  elif user_sgpr_cp_count == 12:
    # private segment buffer is used
    # dispatch ptr is used
    # queue ptr is used
    # kernarg segment ptr is used
    # either dispatch id or flat scratch init is used, HAVE TO GUESS
    descriptor_dict["amdhsa_user_sgpr_private_segment_buffer"] = 1
    descriptor_dict["amdhsa_user_sgpr_dispatch_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1
    # XXX. TBD. Force guess on the flat scratch init for now.
    descriptor_dict["amdhsa_user_sgpr_dispatch_id"] = 0
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
    descriptor_dict["amdhsa_user_sgpr_dispatch_id"] = 0
    descriptor_dict["amdhsa_user_sgpr_flat_scratch_init"] = 0

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
    descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 0
    descriptor_dict["amdhsa_user_sgpr_dispatch_ptr"] = 1
    #descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_dispatch_id"] = 0
    descriptor_dict["amdhsa_user_sgpr_flat_scratch_init"] = 0

    descriptor_dict["private_segment_buffer"] = [0, 1, 2, 3]
    descriptor_dict["dispatch_ptr"] = [4, 5]
    # XXX. TBD. Force guess on the dispatch ptr for now.
    #descriptor_dict["queue_ptr"] = [6, 7]
    descriptor_dict["kernarg_segment_ptr"] = [6, 7]
  elif user_sgpr_cp_count == 6:
    # private segment buffer is used
    # kernarg segment ptr is used
    descriptor_dict["amdhsa_user_sgpr_private_segment_buffer"] = 1
    descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 0
    descriptor_dict["amdhsa_user_sgpr_dispatch_ptr"] = 0
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_dispatch_id"] = 0
    descriptor_dict["amdhsa_user_sgpr_flat_scratch_init"] = 0

    descriptor_dict["private_segment_buffer"] = [0, 1, 2, 3]
    descriptor_dict["kernarg_segment_ptr"] = [4, 5]
  elif user_sgpr_cp_count == 2:
    # kernarg segment ptr is used
    descriptor_dict["amdhsa_user_sgpr_private_segment_buffer"] = 0
    descriptor_dict["amdhsa_user_sgpr_queue_ptr"] = 0
    descriptor_dict["amdhsa_user_sgpr_dispatch_ptr"] = 0
    descriptor_dict["amdhsa_user_sgpr_kernarg_segment_ptr"] = 1
    descriptor_dict["amdhsa_user_sgpr_dispatch_id"] = 0
    descriptor_dict["amdhsa_user_sgpr_flat_scratch_init"] = 0

    descriptor_dict["kernarg_segment_ptr"] = [0, 1]
  else:
    print("Unknown SGPR CP count!")
    exit(-1)


  # len(sgpr_initialized_by_cp) might be less then user_sgpr_cp_count
  # as some register might be initialized by CP but not used.

  # Log registers from features that are actually used
  for feature in ["private_segment_buffer", "dispatch_ptr", "queue_ptr", "kernarg_segment_ptr", "flat_scratch_init"]:
    if feature in descriptor_dict:
      for reg in descriptor_dict[feature]:
        if reg not in sgpr_initialized_by_cp:
          del descriptor_dict[feature]
          break

  # Log registers from features that are overriden
  for feature in ["private_segment_buffer", "dispatch_ptr", "queue_ptr", "kernarg_segment_ptr", "flat_scratch_init"]:
    if feature in descriptor_dict:
      for reg in descriptor_dict[feature]:
        l = liveness_dict['s' + str(reg)]
        if l[0] < l[2]:
          descriptor_dict[feature + "_overriden"] = 1
        elif l[2] == -1:
          descriptor_dict[feature + "_overriden"] = 0
        else:
          print("Unknown situtaion encountered!")
        break

  # Understand the number of SGPRs set by ADC from RSRC2
  user_sgpr_adc_count = descriptor_dict["amdhsa_system_sgpr_workgroup_id_x"] + descriptor_dict["amdhsa_system_sgpr_workgroup_id_y"] + descriptor_dict["amdhsa_system_sgpr_workgroup_id_z"]

  descriptor_dict["user_sgpr_adc_count"] = user_sgpr_adc_count
  #print("ADC: ", sgpr_initialized_by_adc)

  # Identify each SGPR be initialized by ADC
  sgpr_initialized_by_adc = []
  for index in range(user_sgpr_adc_count):
    sgpr = user_sgpr_cp_count + index
    l = liveness_dict.get('s' + str(sgpr))
    if l is not None and (l[0] > 0) and (l[2] == -1 or l[0] < l[2]):
      sgpr_initialized_by_adc.append(sgpr)
      if index == 0:
        descriptor_dict["workgroup_id_x"] = [sgpr]
      elif index == 1:
        descriptor_dict["workgroup_id_y"] = [sgpr]
      elif index == 2:
        descriptor_dict["workgroup_id_z"] = [sgpr]

  # Log registers from features that are overriden
  for feature in ["workgroup_id_x", "workgroup_id_y", "workgroup_id_z"]:
    if feature in descriptor_dict:
      for reg in descriptor_dict[feature]:
        l = liveness_dict['s' + str(reg)]
        if l[0] < l[2]:
          descriptor_dict[feature + "_overriden"] = 1
        elif l[2] == -1:
          descriptor_dict[feature + "_overriden"] = 0
        else:
          print("Unknown situtaion encountered!")
        break

  return descriptor_dict

INPUT_FILE = "rccl.s"
def main():
  input_file = open(INPUT_FILE, "r")
  kernel_source = input_file.read()
  liveness_dict = liveness_analysis(kernel_source)

  [max_sgpr, max_vgpr, max_agpr] = get_register_usage(liveness_dict)
  print("SGPR: " + str(max_sgpr))
  print("VGPR: " + str(max_vgpr))
  print("AGPR: " + str(max_agpr))

  for sgpr in range(12):
    liveness = liveness_dict.get('s' + str(sgpr))
    if liveness is not None and (liveness[0] > 0) and (liveness[2] == -1 or liveness[0] < liveness[2]):
      if liveness[2] == -1:
        # declared + used
        print("SGPR" + str(sgpr) + "(*): ", liveness_dict['s' + str(sgpr)])
      elif liveness[0] < liveness[2]:
        # declared + used + overriden
        print("SGPR" + str(sgpr) + "(=): ", liveness_dict['s' + str(sgpr)])

  for vgpr in range(3):
    liveness = liveness_dict.get('v' + str(vgpr))
    if liveness is not None and (liveness[0] > 0) and (liveness[2] == -1 or liveness[0] < liveness[2]):
      if liveness[2] == -1:
        # declared + used
        print("VGPR" + str(vgpr) + ":(*) ", liveness_dict['v' + str(vgpr)])
      elif liveness[0] < liveness[2]:
        # declared + used + overriden
        print("VGPR" + str(vgpr) + ":(=) ", liveness_dict['v' + str(vgpr)])

if __name__ == '__main__':
  main()
