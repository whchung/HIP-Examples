#!/usr/bin/env python3
#-------------------------------------------------------------------------------
# elftools example: elf_low_high_api.py
#
# A simple example that shows some usage of the low-level API pyelftools
# provides versus the high-level API while inspecting an ELF file's symbol
# table.
#
# Eli Bendersky (eliben@gmail.com)
# This code is in the public domain
#-------------------------------------------------------------------------------
from __future__ import print_function
import sys
import re

# If pyelftools is not installed, the example can also run from the root or
# examples/ dir of the source distribution.
sys.path[0:0] = ['.', '..']

from elftools.elf.elffile import ELFFile
from elftools.elf.sections import SymbolTableSection


def process_file(filename):
    print('Processing file:', filename)
    with open(filename, 'rb') as f:
        #section_info_lowlevel(f)
        #f.seek(0)
        section_info_highlevel(f)


def section_info_lowlevel(stream):
    #print('Low level API...')
    # We'll still be using the ELFFile context object. It's just too
    # convenient to give up, even in the low-level API demonstation :-)
    elffile = ELFFile(stream)

    # The e_shnum ELF header field says how many sections there are in a file
    print('  %s sections' % elffile['e_shnum'])

    # Try to find the symbol table
    for i in range(elffile['e_shnum']):
        section_offset = elffile['e_shoff'] + i * elffile['e_shentsize']
        # Parse the section header using structs.Elf_Shdr
        stream.seek(section_offset)
        section_header = elffile.structs.Elf_Shdr.parse_stream(stream)
        if section_header['sh_type'] == 'SHT_SYMTAB':
            # Some details about the section. Note that the section name is a
            # pointer to the object's string table, so it's only a number
            # here. To get to the actual name one would need to parse the string
            # table section and extract the name from there (or use the
            # high-level API!)
            print('  Section name: %s, type: %s' % (
                    section_header['sh_name'], section_header['sh_type']))
            break
    else:
        print('  No symbol table found. Perhaps this ELF has been stripped?')


def section_info_highlevel(stream):
    print('High level API...')
    elffile = ELFFile(stream)

    # Just use the public methods of ELFFile to get what we need
    # Note that section names are strings.
    print('Section header table offset %d' % elffile['e_shoff'])
    print('  %s sections' % elffile.num_sections())
    for i in range(elffile.num_sections()):
      section = elffile.get_section(i)
      print('Section: %s, type: %s, offset: %d, addr: %d, size: %d, flags: %d' % (section.name, section['sh_type'], section['sh_offset'], section['sh_addr'], section['sh_size'], section['sh_flags']))

    print('---------------------------')
    section = elffile.get_section_by_name('.symtab')

    if not section:
        print('  No symbol table found. Perhaps this ELF has been stripped?')
        return

    # A section type is in its header, but the name was decoded and placed in
    # a public attribute.
    print('  Section name: %s, type: %s' %(
        section.name, section['sh_type']))

    # But there's more... If this section is a symbol table section (which is
    # the case in the sample ELF file that comes with the examples), we can
    # get some more information about it.
    if isinstance(section, SymbolTableSection):
        num_symbols = section.num_symbols()
        print("  It's a symbol section with %s symbols" % num_symbols)
        for i in range(num_symbols):
          symbol = section.get_symbol(i)
          print('Symbol: %s, Offset: %d, Size: %d' % (symbol.name, symbol['st_value'], symbol['st_size']))
          #print(symbol.entry)

        print('---------------------------')

        # Enumerate kernels
        for i in range(num_symbols):
          symbol = section.get_symbol(i)
          if (symbol['st_info']['bind'] == 'STB_GLOBAL' and symbol['st_info']['type'] == 'STT_FUNC'):
            print('Kernel: %s, Offset: %d, Size: %d' % (symbol.name, symbol['st_value'], symbol['st_size']))

        # Enumerate kernel descriptors
        for i in range(num_symbols):
          symbol = section.get_symbol(i)
          if (symbol.name.endswith('.kd') and symbol['st_info']['bind'] == 'STB_GLOBAL' and symbol['st_info']['type'] == 'STT_OBJECT' and symbol['st_size'] == 64):
            print('Kernel descriptor: %s, Offset: %d, Size: %d' % (symbol.name, symbol['st_value'], symbol['st_size']))


if __name__ == '__main__':
    for filename in sys.argv[1:]:
      process_file(filename)
