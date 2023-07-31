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
  max_line_number = len(isa)
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
        liveness_dict[register] = [ line_number, line_number, max_line_number, max_line_number ]
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
        if liveness_dict[register][2] == max_line_number and liveness_dict[register][3] == max_line_number:
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

def main():
  input_file = open("rccl.s", "r")
  liveness_dict = liveness_analysis(input_file.read())

  [max_sgpr, max_vgpr, max_agpr] = get_register_usage(liveness_dict)
  print("SGPR: " + str(max_sgpr))
  print("VGPR: " + str(max_vgpr))
  print("AGPR: " + str(max_agpr))

  for sgpr in range(max_sgpr):
    liveness = liveness_dict.get('s' + str(sgpr))
    if liveness is not None and (liveness[0] > 0) and (liveness[0] < liveness[2]):
      print("SGPR" + str(sgpr) + "(*): ", liveness_dict['s' + str(sgpr)])
  for vgpr in range(max_vgpr):
    liveness = liveness_dict.get('v' + str(vgpr))
    if liveness is not None and (liveness[0] > 0) and (liveness[0] < liveness[2]):
      print("VGPR" + str(vgpr) + ":(*) ", liveness_dict['v' + str(vgpr)])

if __name__ == '__main__':
  main()
