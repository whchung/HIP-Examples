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
  # entries is a 4-tuple:
  # 0: earliest input
  # 1: latest input
  # 2: earliest output
  # 3: latest output
  liveness_dict = {}
  line_number = 0
  for line in isa.splitlines():
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
  return liveness_dict

def main():
  input_file = open("rccl.s", "r")
  liveness_dict = liveness_analysis(input_file.read())
  
  liveness_dict = dict(sorted(liveness_dict.items(), key = register_key_func))
  for sgpr in range(16):
    print("SGPR" + str(sgpr) + ": ", liveness_dict['s' + str(sgpr)])

if __name__ == '__main__':
  main()
