#!/usr/bin/env python3
#-------------------------------------------------------------------------------
# elftools example: elf_notes.py
#
# An example of obtaining note sections from an ELF file and examining
# the notes it contains.
#
# Eli Bendersky (eliben@gmail.com)
# This code is in the public domain
#-------------------------------------------------------------------------------
from __future__ import print_function
import sys
import msgpack
import pprint

# If pyelftools is not installed, the example can also run from the root or
# examples/ dir of the source distribution.
sys.path[0:0] = ['.', '..']

from elftools.elf.elffile import ELFFile
from elftools.elf.sections import NoteSection
from elftools.common.utils import bytes2hex


def process_file(filename):
    print('Processing file:', filename)
    with open(filename, 'rb') as f:
        for sect in ELFFile(f).iter_sections():
            if not isinstance(sect, NoteSection):
                continue
            print('  Note section "%s" at offset 0x%.8x with size %d' % (
                sect.name, sect.header['sh_offset'], sect.header['sh_size']))
            for note in sect.iter_notes():
                print('    Name:', note['n_name'])
                print('    Type:', note['n_type'])
                desc = note['n_desc']
                if note['n_type'] == 'NT_GNU_ABI_TAG':
                    print('    Desc: %s, ABI: %d.%d.%d' % (
                        desc['abi_os'],
                        desc['abi_major'],
                        desc['abi_minor'],
                        desc['abi_tiny']))
                elif note['n_type'] in {'NT_GNU_BUILD_ID', 'NT_GNU_GOLD_VERSION'}:
                    print('    Desc:', desc)
                elif note['n_type'] == 32: # NT_AMDGPU_METADATA
                    amdgpu_metadata = msgpack.unpackb(desc)
                    pprint.pprint(amdgpu_metadata)
                else:
                    print('    Desc:', bytes2hex(desc))

        f.seek(0)
        elf_file = ELFFile(f)
        print("Program header offset: %d" % elf_file['e_phoff'])
        print("Program header entry size: %d" % elf_file['e_phentsize'])
        print("Program header entry number: %d" % elf_file['e_phnum'])
        print("--------------------")
        print("Section offset: %d" % elf_file['e_shoff'])
        print("Section entry size: %d" % elf_file['e_shentsize'])
        print("Section entry number: %d" % elf_file['e_shnum'])
        print("--------------------")
        print("shstrtab index: %d" % elf_file['e_shstrndx'])


if __name__ == '__main__':
    for filename in sys.argv[1:]:
       process_file(filename)
