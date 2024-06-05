#!/usr/bin/env python3

import sys
import msgpack
import pprint
from elftools.elf.enums import *
from elftools.elf.elffile import ELFFile
from elftools.elf.sections import NoteSection

################
# ELF constants
################
EI_MAG0 = 0
EI_MAG3 = 3
EI_CLASS = 4
EI_DATA = 5
EI_VERSION = 6
EI_OSABI = 7
EI_ABIVERSION = 8
EI_PAD = 9
EI_NIDENT = 16

EV_CURRENT = 1
ELFOSABI_AMDGPU_HSA = 64
ELFABIVERSION_AMDGPU_HSA_V4 = 2
ELFABIVERSION_AMDGPU_HSA_V5 = 3

EF_AMDGPU_FEATURE_XNACK_V4 = 0x300
EF_AMDGPU_FEATURE_XNACK_UNSUPPORTED_V4 = 0x000
EF_AMDGPU_FEATURE_XNACK_ANY_V4 = 0x100
EF_AMDGPU_FEATURE_XNACK_OFF_V4 = 0x200
EF_AMDGPU_FEATURE_XNACK_ON_V4 = 0x300

EF_AMDGPU_FEATURE_SRAMECC_V4 = 0xC00
EF_AMDGPU_FEATURE_SRAMECC_UNSUPPORTED_V4 = 0x000
EF_AMDGPU_FEATURE_SRAMECC_ANY_V4 = 0x400
EF_AMDGPU_FEATURE_SRAMECC_OFF_V4 = 0x800
EF_AMDGPU_FEATURE_SRAMECC_ON_V4 = 0xC00

EF_AMDGPU_MACH_AMDGCN_GFX900 = 0x02C
EF_AMDGPU_MACH_AMDGCN_GFX90A = 0x03F
EF_AMDGPU_MACH_AMDGCN_GFX942 = 0x04C

################
# ROCm ABI constants
################

KERNEL_DESCRIPTOR_SIZE = 64

def create_amdgpu_codeobject_elf_header(stream, section_table_offset):
    # e_ident
    e_ident = [0]
    e_ident[EI_MAG0:EI_MAG0] = b'\x7fELF'
    e_ident[EI_CLASS:EI_CLASS] = ENUM_EI_CLASS['ELFCLASS64'].to_bytes(1, byteorder='little')
    e_ident[EI_DATA:EI_DATA] = ENUM_EI_DATA['ELFDATA2LSB'].to_bytes(1, byteorder='little')
    e_ident[EI_VERSION:EI_VERSION] = EV_CURRENT.to_bytes(1, byteorder='little')
    e_ident[EI_OSABI:EI_OSABI] = ELFOSABI_AMDGPU_HSA.to_bytes(1, byteorder='little')
    e_ident[EI_ABIVERSION:EI_ABIVERSION] = ELFABIVERSION_AMDGPU_HSA_V4.to_bytes(1, byteorder='little')
    e_ident[EI_PAD:EI_NIDENT] = [0] * (EI_NIDENT - EI_PAD)

    # e_type
    e_type = ENUM_E_TYPE['ET_DYN'].to_bytes(2, byteorder='little')

    # e_machine
    e_machine = ENUM_E_MACHINE['EM_AMDGPU'].to_bytes(2, byteorder='little')

    # e_version
    e_version = (1).to_bytes(4, byteorder='little')

    # e_entry
    e_entry = (0).to_bytes(8, byteorder='little')

    # e_phoff
    # Program Header fixed as 64
    e_phoff = (64).to_bytes(8, byteorder='little')

    # e_shoff
    # Need to understand sizes of all other sections
    e_shoff = (section_table_offset).to_bytes(8, byteorder='little')

    # e_flags
    # Hard-coded as:
    # amdgcn-amd-amdhsa--gfx942:sramecc+:xnack-
    e_flags = (EF_AMDGPU_FEATURE_XNACK_OFF_V4 | EF_AMDGPU_FEATURE_SRAMECC_ON_V4 | EF_AMDGPU_MACH_AMDGCN_GFX942).to_bytes(4, byteorder='little')

    # e_ehsize
    e_ehsize = (64).to_bytes(2, byteorder='little')

    # e_phentsize program header entry size
    # Program Header entry size fixed as 56
    e_phentsize = (56).to_bytes(2, byteorder='little')

    # e_phnum program header entries
    # Temporary set as 3. They are:
    # - PT_PHDR for program header table
    # - PT_LOAD for .note and .rodata
    # - PT_LOAD for .text
    e_phnum = (3).to_bytes(2, byteorder='little')

    # e_shentsize section entry size
    e_shentsize = (64).to_bytes(2, byteorder='little')

    # e_shnum section entries
    # Temporary set as 7. They are:
    # - NULL
    # - .note
    # - .rodata
    # - .text
    # - .symtab
    # - .shstrtab
    # - .strtab
    e_shnum = (7).to_bytes(2, byteorder='little')

    # e_shstrndx .shstrtab string table index
    # According to the sections aforementioned, .shstrtab lies on #5
    e_shstrndx = (5).to_bytes(2, byteorder='little')

    # Write the ELF header
    stream.write(bytes(e_ident))
    stream.write(bytes(e_type))
    stream.write(bytes(e_machine))
    stream.write(bytes(e_version))
    stream.write(bytes(e_entry))
    stream.write(bytes(e_phoff))
    stream.write(bytes(e_shoff))
    stream.write(bytes(e_flags))
    stream.write(bytes(e_ehsize))
    stream.write(bytes(e_phentsize))
    stream.write(bytes(e_phnum))
    stream.write(bytes(e_shentsize))
    stream.write(bytes(e_shnum))
    stream.write(bytes(e_shstrndx))

def create_amdgpu_codeobject_program_header_entry(stream, in_type, in_flags, in_offset, in_vaddr, in_paddr, in_filesz, in_memsz, in_align):
    # p_type
    p_type = in_type.to_bytes(4, byteorder='little')

    # p_flags
    p_flags = in_flags.to_bytes(4, byteorder='little')

    # p_offset
    p_offset = in_offset.to_bytes(8, byteorder='little')

    # p_vaddr
    p_vaddr = in_vaddr.to_bytes(8, byteorder='little')

    # p_paddr
    p_paddr = in_paddr.to_bytes(8, byteorder='little')

    # p_filesz
    p_filesz = in_filesz.to_bytes(8, byteorder='little')

    # p_memsz
    p_memsz = in_memsz.to_bytes(8, byteorder='little')

    # p_align
    p_align = in_align.to_bytes(8, byteorder='little')

    stream.write(bytes(p_type))
    stream.write(bytes(p_flags))
    stream.write(bytes(p_offset))
    stream.write(bytes(p_vaddr))
    stream.write(bytes(p_paddr))
    stream.write(bytes(p_filesz))
    stream.write(bytes(p_memsz))
    stream.write(bytes(p_align))

def create_amdgpu_codeobject_program_header(stream, text_section_offset, text_section_length):
    # Create PT_PHDR entry
    create_amdgpu_codeobject_program_header_entry(stream, ENUM_P_TYPE_BASE['PT_PHDR'], 0x4, 64, 64, 64, 56 * 3, 56 * 3, 8)

    # Create PT_LOAD entry for .note and .rodata section
    # Need to understand the size of .note section and .rodata section, or the starting position of .text section
    create_amdgpu_codeobject_program_header_entry(stream, ENUM_P_TYPE_BASE['PT_LOAD'], 0x4, 0, 0, 0, text_section_offset, text_section_offset, 0x1000)

    # Create PT_LOAD entry for .text section
    # Need to understand the size of .text section
    create_amdgpu_codeobject_program_header_entry(stream, ENUM_P_TYPE_BASE['PT_LOAD'], 0x5, text_section_offset, text_section_offset, text_section_offset, text_section_length, text_section_length, 0x1000)

def create_amdgpu_codeobject_section_table(stream):
    pass

def maybe_create_padding_bytes(byte_array, alignment):
    padding = len(byte_array) % alignment
    if padding != 0:
        padding_bytes = [0] * (alignment - padding)
        byte_array = byte_array + bytes(padding_bytes)
    return byte_array

def maybe_create_padding(output_stream, alignment):
    output_stream_pos = output_stream.tell()
    padding = output_stream_pos % alignment
    if padding != 0:
        padding_bytes = [0] * (alignment - padding)
        output_stream.write(bytes(padding_bytes))

def create_amdgpu_codeobject_section(output_stream, section_data, section_alignment):
    #print('Current offset: %d, length: %d, alignment: %d' % (output_stream.tell(), len(section_data), section_alignment))
    maybe_create_padding(output_stream, section_alignment)
    output_stream.write(section_data)

def compute_section_offset(offset, section, section_alignment):
    padding = offset % section_alignment
    if padding != 0:
        offset += (section_alignment - padding)
    start_offset = offset
    offset += len(section)
    return start_offset, offset

def create_amdgpu_codeobject_section_table_entry(output_stream, section_header, section_offset, section_size = -1, section_address = -1, section_link = 0, section_info = 0, section_entsize = 0):
    # sh_name
    sh_name = section_header['sh_name'].to_bytes(4, byteorder='little')

    # sh_type
    sh_type = ENUM_SH_TYPE_BASE[section_header['sh_type']].to_bytes(4, byteorder='little')

    # sh_flags
    sh_flags = section_header['sh_flags'].to_bytes(8, byteorder='little')

    # sh_addr
    # Use user-supplied value
    address = section_offset if (section_address == -1) else section_address
    sh_addr = address.to_bytes(8, byteorder='little')

    # sh_offset
    # Use user-supplied section_offset instead as the section will be moved around
    sh_offset = section_offset.to_bytes(8, byteorder='little')

    # sh_size
    size = section_size if (section_size > 0) else section_header['sh_size']
    sh_size = size.to_bytes(8, byteorder='little')
    #sh_size = section_header['sh_size'].to_bytes(8, byteorder='little')

    # sh_link
    # Use user-supplied value
    link = section_link if (section_link != 0) else section_header['sh_link']
    sh_link = link.to_bytes(4, byteorder='little')

    # sh_info
    # Use user-supplied value
    info = section_info if (section_info != 0) else section_header['sh_info']
    sh_info = info.to_bytes(4, byteorder='little')

    # sh_addralign
    sh_addralign = section_header['sh_addralign'].to_bytes(8, byteorder='little')

    # sh_entsize
    # Use user-supplied value
    entsize = section_entsize if (section_entsize != 0) else section_header['sh_entsize']
    sh_entsize = entsize.to_bytes(8, byteorder='little')

    output_stream.write(bytes(sh_name))
    output_stream.write(bytes(sh_type))
    output_stream.write(bytes(sh_flags))
    output_stream.write(bytes(sh_addr))
    output_stream.write(bytes(sh_offset))
    output_stream.write(bytes(sh_size))
    output_stream.write(bytes(sh_link))
    output_stream.write(bytes(sh_info))
    output_stream.write(bytes(sh_addralign))
    output_stream.write(bytes(sh_entsize))

class CodeObjectFile:
    """AMDGPU Code Object"""

    def has_kernel(self, kernel_name):
        return kernel_name in self.kernel_map

    def get_kernel(self, kernel_name):
        return self.kernel_map[kernel_name]

    def set_kernel_attr(self, kernel_name, key, value):
        self.kernel_map[kernel_name][key] = value

    def get_amdgpu_metadata(self):
        return self.amdgpu_metadata

    def get_note_section(self):
        return self.note_section

    def dump_section_header(self, section):
        print('Section: %s, type: %s(%d), flags: %d, addr: %d, offset: %d, size: %d, link: %d, info: %d, addralign: %d, entsize: %d' % (section.name, section['sh_type'], ENUM_SH_TYPE_BASE[section['sh_type']], section['sh_flags'], section['sh_addr'], section['sh_offset'], section['sh_size'], section['sh_link'], section['sh_info'], section['sh_addralign'], section['sh_entsize']))

    def dump_code_object_info(self):
        print("Code Object Filename: %s" % self.filename)
        print("--------------------")
        print("Program header offset: %d" % self.elf_file['e_phoff'])
        print("Program header entry size: %d" % self.elf_file['e_phentsize'])
        print("Program header entry number: %d" % self.elf_file['e_phnum'])
        print("--------------------")
        print("Section table offset: %d" % self.elf_file['e_shoff'])
        print("Section entry size: %d" % self.elf_file['e_shentsize'])
        print("Section entry number: %d" % self.elf_file['e_shnum'])
        print("--------------------")
        print("shstrtab index: %d" % self.elf_file['e_shstrndx'])

    def extract_section(self, section_name):
        for section in self.elf_file.iter_sections():
            if section.name == section_name:
                return section.data(), section['sh_addralign'], section

    def __init__(self, filename, elf_file, is_assembly = False):
        self.filename = filename
        self.elf_file = elf_file
        self.is_assembly = is_assembly
        #self.dump_code_object_info()

        #####################################
        # Extract relevant sections from input file
        #####################################

        # NULL section
        (self.null_section, self.null_section_alignment, self.null_section_header) = self.extract_section('')

        # .note section
        (self.note_section, self.note_section_alignment, self.note_section_header) = self.extract_section('.note')

        # .rodata section
        (self.rodata_section, self.rodata_section_alignment, self.rodata_section_header) = self.extract_section('.rodata')

        # .text section
        (self.text_section, self.text_section_alignment, self.text_section_header) = self.extract_section('.text')

        # Extract .symtab / .shstrtab / .strtab sections
        (self.symtab_section, self.symtab_section_alignment, self.symtab_section_header) = self.extract_section('.symtab')
        (self.shstrtab_section, self.shstrtab_section_alignment, self.shstrtab_section_header) = self.extract_section('.shstrtab')
        (self.strtab_section, self.strtab_section_alignment, self.strtab_section_header) = self.extract_section('.strtab')

        # dump section headers
        #self.dump_section_header(self.null_section_header)
        #self.dump_section_header(self.note_section_header)
        #self.dump_section_header(self.rodata_section_header)
        #self.dump_section_header(self.text_section_header)
        #self.dump_section_header(self.symtab_section_header)
        #self.dump_section_header(self.shstrtab_section_header)
        #self.dump_section_header(self.strtab_section_header)

        #####################################
        # Fetch individual kernel data
        #####################################

        # Parse .note section
        self.symbol_note_map = {}
        for note in self.note_section_header.iter_notes():
            if note['n_type'] == 32:
                self.amdgpu_metadata = msgpack.unpackb(note['n_desc'])
                #pprint.pprint(self.amdgpu_metadata)
                for amdgpu_kernel in self.amdgpu_metadata['amdhsa.kernels']:
                    self.symbol_note_map[amdgpu_kernel['.name']] = amdgpu_kernel

        # Build a symbol offset to size/name map
        # In an assembly kernel, kernel code size will also be computed
        self.symbol_offset_map = {}
        self.kernel_code_size = 0
        for i in range(self.symtab_section_header.num_symbols()):
            symbol = self.symtab_section_header.get_symbol(i)
            self.symbol_offset_map[symbol['st_value']] = {'size': symbol['st_size'], 'name': symbol.name}

            # For assembly-based kernel, kernel size is marked with 'label_ASM_End'
            if self.is_assembly and symbol.name == 'label_ASM_End':
                kernel_code_size = symbol['st_value']

        #print(self.symbol_offset_map)

        # Enumerate each kernel
        self.kernel_map = {}
        for i in range(int(len(self.rodata_section) / KERNEL_DESCRIPTOR_SIZE)):
            #print('Kernel: %d' % i)
            #print('Kernel descriptor offset relative to .rodata section: 0x%x' % (0x40 * i))
            kernel_descriptor = self.rodata_section[i * KERNEL_DESCRIPTOR_SIZE : (i + 1) * KERNEL_DESCRIPTOR_SIZE]
            #print(kernel_descriptor)
            kernel_descriptor_offset = self.rodata_section_header['sh_addr'] + 0x40 * i
            kernel_code_entry_byte_offset = int.from_bytes(kernel_descriptor[16:24], byteorder='little')
            kernel_code_offset = kernel_descriptor_offset + kernel_code_entry_byte_offset
            kernel_code_relative_offset  = kernel_code_offset - self.text_section_header['sh_addr']
            #print('Kernel code offset: 0x%x' % kernel_code_offset)
            #print('Kernel code offset relative to .text section: 0x%x' % kernel_code_relative_offset)
            if self.is_assembly == False:
                kernel_code_size = self.symbol_offset_map[kernel_code_offset]['size']
            #print('Kernel code size: %d' % kernel_code_size)
            kernel_code_name = self.symbol_offset_map[kernel_code_offset]['name']
            print('Kernel name: %s' % kernel_code_name)
            kernel_descriptor_name = self.symbol_offset_map[kernel_descriptor_offset]['name']
            #print('Kernel descriptor name: %s' % kernel_descriptor_name)
            #print(self.text_section[kernel_code_relative_offset : kernel_code_relative_offset + kernel_code_size])
            #print('Kernel metadata:')
            #pprint.pprint(self.symbol_note_map[kernel_code_name])
            #print('--------------------')

            self.kernel_map[kernel_code_name] = { 'index': i, 'offset': kernel_code_offset, 'code': self.text_section[kernel_code_relative_offset : kernel_code_relative_offset + kernel_code_size], 'metadata': self.symbol_note_map[kernel_code_name], 'descriptor': kernel_descriptor }

def create_amdgpu_codeobject(input_filename_list, input_stream_list, input_is_assembly_list, output_stream, selected_kernel_list):
    code_object_list = []
    for i in range(len(input_filename_list)):
        input_filename = input_filename_list[i]
        input_stream = input_stream_list[i]
        elf_file = ELFFile(input_stream)
        code_object_file = CodeObjectFile(input_filename, elf_file, input_is_assembly_list[i])
        code_object_list.append(code_object_file)

    map_kernel_name_code_object = {}
    for kernel_name in selected_kernel_list:
        #print('-------------------------------')
        #print('Kernel: %s' % kernel_name)
        for code_object in code_object_list:
            if code_object.has_kernel(kernel_name):
                map_kernel_name_code_object[kernel_name] = code_object
                kernel = code_object.get_kernel(kernel_name)
                #print('Code Object File: %s' % code_object.filename)
                #print('Kernel descriptor: %s' % str(kernel['descriptor']))
                #print('Kernel code: %s' % str(kernel['code']))
                #print('Kernel metadata: %s' % str(msgpack.packb(kernel['metadata'])))

    #####################################
    # Compute new sections: .note / .rodata / .text
    #####################################

    # new kernel order index
    for i in range(len(selected_kernel_list)):
        kernel_name = selected_kernel_list[i]
        code_object = map_kernel_name_code_object[kernel_name]
        code_object.set_kernel_attr(kernel_name, 'new_index', i)

    first_code_object = map_kernel_name_code_object[selected_kernel_list[0]]
    common_amdgpu_metadata = first_code_object.get_amdgpu_metadata()
    common_note_section = first_code_object.get_note_section()

    # .note section
    new_amdgpu_metadata = {}
    new_amdgpu_metadata['amdhsa.kernels'] = []
    if 'amdhsa.target' in common_amdgpu_metadata:
        new_amdgpu_metadata['amdhsa.target'] = common_amdgpu_metadata['amdhsa.target']
    new_amdgpu_metadata['amdhsa.version'] = common_amdgpu_metadata['amdhsa.version']
    for kernel_name in selected_kernel_list:
        code_object = map_kernel_name_code_object[kernel_name]
        kernel = code_object.get_kernel(kernel_name)
        new_amdgpu_metadata['amdhsa.kernels'].append(kernel['metadata'])

    #print(len(msgpack.packb(new_amdgpu_metadata)))
    #pprint.pprint(new_amdgpu_metadata)
    new_note_section_desc = msgpack.packb(new_amdgpu_metadata)
    new_note_section = common_note_section[0:4] + \
                       len(new_note_section_desc).to_bytes(4, byteorder='little') + \
                       common_note_section[8:12] + \
                       common_note_section[12:20] + \
                       new_note_section_desc
    new_note_section = maybe_create_padding_bytes(new_note_section, 4)
    #print('New .note section:')
    #print(len(new_note_section))
    #print(new_note_section)

    # .rodata section
    new_rodata_section = b''
    for kernel_name in selected_kernel_list:
        code_object = map_kernel_name_code_object[kernel_name]
        kernel = code_object.get_kernel(kernel_name)
        new_rodata_section += kernel['descriptor']
        # each kernel descriptor is exactly 64 bytes so no padding is needed
    #print('New .rodata section:')
    #print(len(new_rodata_section))
    #print(new_rodata_section)

    # .text
    new_text_section = b''
    for kernel_name in selected_kernel_list:
        code_object = map_kernel_name_code_object[kernel_name]
        kernel = code_object.get_kernel(kernel_name)
        code_object.set_kernel_attr(kernel_name, 'new_relative_offset', len(new_text_section))
        new_text_section += kernel['code']
        # pad kernel codes to 256 bytes aligned
        new_text_section = maybe_create_padding_bytes(new_text_section, 256)
    #print('New .text section:')
    #print(len(new_text_section))
    #print(new_text_section)

    #####################################
    # Compute new sections: .symtab / .shstrtab / .strtab
    #####################################

    # .symtab
    new_symtab_section_offset_list = []
    new_symtab_section_length_list = []
    new_symtab_section = b''
    for code_object in code_object_list:
        new_symtab_section_offset_list.append(len(new_symtab_section))
        new_symtab_section_length_list.append(len(code_object.symtab_section))
        new_symtab_section += code_object.symtab_section
    #print('New .symtab section:')
    #print(new_symtab_section)
    #print(new_symtab_section_offset_list)
    #print(new_symtab_section_length_list)

    # .shstrtab
    # Assume all AMDGPU code objects has the same .shstrtab section for now
    new_shstrtab_section = first_code_object.shstrtab_section
    #print('New .shstrtab section:')
    #print(new_shstrtab_section)

    # .strtab
    new_strtab_section_offset_list = []
    new_strtab_section_length_list = []
    new_strtab_section = b''
    for code_object in code_object_list:
        new_strtab_section_offset_list.append(len(new_strtab_section))
        new_strtab_section_length_list.append(len(code_object.strtab_section))
        new_strtab_section += code_object.strtab_section
    #print('New .strtab section:')
    #print(new_strtab_section)
    #print(new_strtab_section_offset_list)
    #print(new_strtab_section_length_list)

    #####################################
    # Compute section table offset
    #####################################

    offset = 64 # ELF header
    offset += 56 * 3 # program header (3 entries)
    # NULL section doesn't participate in offset computation
    # Use new .note / .rodata / .text sections
    (note_section_offset, offset) = compute_section_offset(offset, new_note_section, first_code_object.note_section_alignment)
    (rodata_section_offset, offset) = compute_section_offset(offset, new_rodata_section, first_code_object.rodata_section_alignment)
    (text_section_offset, offset) = compute_section_offset(offset, new_text_section, first_code_object.text_section_alignment)
    (symtab_section_offset, offset) = compute_section_offset(offset, new_symtab_section, first_code_object.symtab_section_alignment)
    (shstrtab_section_offset, offset) = compute_section_offset(offset, new_shstrtab_section, first_code_object.shstrtab_section_alignment)
    (strtab_section_offset, offset) = compute_section_offset(offset, new_strtab_section, first_code_object.strtab_section_alignment)
    (section_table_offset, offset) = compute_section_offset(offset, "", 4)
    #print('----------------------')
    #print('note section offset 0x%x' % note_section_offset)
    #print('rodata section offset 0x%x' % rodata_section_offset)
    #print('text section offset 0x%x' % text_section_offset)
    #print('symtab section offset 0x%x' % symtab_section_offset)
    #print('shstrtab section offset 0x%x' % shstrtab_section_offset)
    #print('strtab section offset 0x%x' % strtab_section_offset)
    #print('----------------------')
    #print("Section table offset: 0x%x" % section_table_offset)
    #print('----------------------')

    #####################################
    # Re-compute symbol name index / symbol offset / section index
    #####################################

    for i in range(len(code_object_list)):
        code_object = code_object_list[i]
        #print('Code Object: %s' % code_object.filename)
        for j in range(code_object.symtab_section_header.num_symbols()):
            symbol = code_object.symtab_section_header.get_symbol(j)

            symbol_offset = symbol['st_value'] 
            if symbol['st_shndx'] in ENUM_ST_SHNDX:
                symbol_section_index = ENUM_ST_SHNDX[symbol['st_shndx']]
            else:
                symbol_section_index = int(symbol['st_shndx'])

            # Modify symbol name according to the new .strtab section
            symbol_name_index = symbol['st_name'] + new_strtab_section_offset_list[i]

            # For each symbol, check if it's inside .rodata or .text section

            # If it's inside .rodata section, find the original index, find the kernel name, find the new index, compute the new offset
            if (symbol_offset >= code_object.rodata_section_header['sh_offset']) and (symbol_offset < code_object.rodata_section_header['sh_offset'] + code_object.rodata_section_header['sh_size']):
                #print('Symbol: %s' % symbol.name)
                # Find the original descriptor index
                original_index = int((symbol_offset - code_object.rodata_section_header['sh_offset']) / KERNEL_DESCRIPTOR_SIZE)
                #print('Original index: %d' % original_index)
                kernel_descriptor = code_object.rodata_section[original_index * KERNEL_DESCRIPTOR_SIZE : (original_index + 1) * KERNEL_DESCRIPTOR_SIZE]
                kernel_code_entry_byte_offset = int.from_bytes(kernel_descriptor[16:24], byteorder='little')
                kernel_code_offset = code_object.rodata_section_header['sh_offset'] + 0x40 * original_index + kernel_code_entry_byte_offset
                kernel_code_name = code_object.symbol_offset_map[kernel_code_offset]['name']
                #print('Kernel name: %s' % kernel_code_name)
                if 'new_index' in code_object.kernel_map[kernel_code_name].keys():
                    new_index = code_object.kernel_map[kernel_code_name]['new_index']
                else:
                    # symbol not used in the new binary, set new index be an aribitrary value 0
                    new_index = 0
                #print('New index: %d' % new_index)
                symbol_offset = 0x40 * new_index + rodata_section_offset
                #print('New offset: 0x%x' % symbol_offset)

                symbol_section_index = 2 # .rodata section index in the new ELF binary

            # If it's inside .text section, find the original index, find the kernel name, find the new index, compute the new offset
            elif (symbol_offset >= code_object.text_section_header['sh_addr']) and (symbol_offset < code_object.text_section_header['sh_addr'] + code_object.text_section_header['sh_size']):
                #print('Symbol: %s' % symbol.name)
                # Find the original kernel index
                min_offset = sys.maxsize
                kernel_name_with_least_diff = ''
                for kernel_name in code_object.kernel_map:
                    offset = symbol_offset - code_object.kernel_map[kernel_name]['offset']
                    if (offset >= 0) and (offset < min_offset):
                        min_offset = offset
                        kernel_name_with_least_diff = kernel_name
                original_index = code_object.kernel_map[kernel_name_with_least_diff]['index']
                #print('Min offset: 0x%x' % min_offset)
                #print('Original index: %d' % original_index)
                #print('Kernel name: %s' % kernel_name_with_least_diff)
                if 'new_relative_offset' in code_object.kernel_map[kernel_name_with_least_diff].keys():
                    #print('Relative offset: 0x%x' % code_object.kernel_map[kernel_name_with_least_diff]['new_relative_offset'])
                    new_offset = code_object.kernel_map[kernel_name_with_least_diff]['new_relative_offset'] + min_offset
                else:
                    # symbol not used in the new binary, set new offset be an aribitrary value 0
                    new_offset = 0
                    #print('Not used')
                #print('New relative offset: 0x%x' % new_offset)

                symbol_offset = new_offset + text_section_offset
                #print('Symbol offset: 0x%x' % symbol_offset)
                symbol_section_index = 3 # .text section index in the new ELF binary

            # Otherwise keep the symbol information largely as-is
            # Only change fields truely necessary
            elif (symbol_offset >= code_object.note_section_header['sh_offset']) and (symbol_offset < code_object.note_section_header['sh_offset'] + code_object.note_section_header['sh_size']):
                symbol_offset = (symbol_offset - code_object.note_section_header['sh_offset']) + note_section_offset
                symbol_section_index = 1 # .note section index in the new ELF binary

            elif (symbol_offset >= code_object.symtab_section_header['sh_offset']) and (symbol_offset < code_object.symtab_section_header['sh_offset'] + code_object.symtab_section_header['sh_size']):
                symbol_offset = (symbol_offset - code_object.symtab_section_header['sh_offset']) + symtab_section_offset
                symbol_section_index = 4 # .symtab section index in the new ELF binary

            elif (symbol_offset >= code_object.shstrtab_section_header['sh_offset']) and (symbol_offset < code_object.shstrtab_section_header['sh_offset'] + code_object.shstrtab_section_header['sh_size']):
                symbol_offset = (symbol_offset - code_object.shstrtab_section_header['sh_offset']) + shstrtab_section_offset
                symbol_section_index = 5 # .shstrtab section index in the new ELF binary

            elif (symbol_offset >= code_object.strtab_section_header['sh_offset']) and (symbol_offset < code_object.strtab_section_header['sh_offset'] + code_object.strtab_section_header['sh_size']):
                symbol_offset = (symbol_offset - code_object.strtab_section_header['sh_offset']) + strtab_section_offset
                symbol_section_index = 6 # .strtab section index in the new ELF binary

            #print('Original Name: %s, name index: %d, shndx: %s, value: 0x%x, size: %d' % (symbol.name, symbol['st_name'], symbol['st_shndx'], symbol['st_value'], symbol['st_size']))
            #print('Modified Name: %s, name index: %d, shndx: %d, value: 0x%x, size: %d' % (symbol.name, symbol_name_index, symbol_section_index, symbol_offset, symbol['st_size']))
            # Modify st_name, st_offset, st_shndx
            new_symtab_section = new_symtab_section[:new_symtab_section_offset_list[i] + 24 * j] + symbol_name_index.to_bytes(4, byteorder='little') + new_symtab_section[new_symtab_section_offset_list[i] + 24 * j + 5 : new_symtab_section_offset_list[i] + 24 * j + 7] + symbol_section_index.to_bytes(2, byteorder='little') + symbol_offset.to_bytes(8, byteorder='little') + new_symtab_section[new_symtab_section_offset_list[i] + 24 * j + 8 + 8:]

    #####################################
    # Re-compute kernel code entry byte offset
    #####################################

    for i in range(int(len(new_rodata_section) / KERNEL_DESCRIPTOR_SIZE)):
        kernel_descriptor = new_rodata_section[i * KERNEL_DESCRIPTOR_SIZE : (i + 1) * KERNEL_DESCRIPTOR_SIZE]
        for code_object in code_object_list:
            for kernel_code_name in code_object.kernel_map:
                kernel = code_object.get_kernel(kernel_code_name)
                if 'new_index' in kernel.keys() and kernel['new_index'] == i:
                    new_kernel_relative_offset = kernel['new_relative_offset']
                    new_kernel_code_entry_byte_offset = (text_section_offset + new_kernel_relative_offset) - (rodata_section_offset + 0x40 * i)
                    break

        print('New kernel code entry byte offset: %s' % str(hex(new_kernel_code_entry_byte_offset)))
        kernel_descriptor = kernel_descriptor[:16] + new_kernel_code_entry_byte_offset.to_bytes(8, byteorder='little') + kernel_descriptor[24:]
        new_rodata_section = new_rodata_section[: i * KERNEL_DESCRIPTOR_SIZE] + kernel_descriptor + new_rodata_section[(i + 1) * KERNEL_DESCRIPTOR_SIZE:]

    #####################################
    # Produce output file
    #####################################

    # ELF header
    create_amdgpu_codeobject_elf_header(output_stream, section_table_offset)

    # Program header
    create_amdgpu_codeobject_program_header(output_stream, text_section_offset, len(new_text_section))

    # .note section
    create_amdgpu_codeobject_section(output_stream, new_note_section, first_code_object.note_section_alignment)

    # .rodata section
    create_amdgpu_codeobject_section(output_stream, new_rodata_section, first_code_object.rodata_section_alignment)

    # .text section
    create_amdgpu_codeobject_section(output_stream, new_text_section, first_code_object.text_section_alignment)

    # .symtab section
    create_amdgpu_codeobject_section(output_stream, new_symtab_section, first_code_object.symtab_section_alignment)

    # .shstrtab section
    create_amdgpu_codeobject_section(output_stream, new_shstrtab_section, first_code_object.shstrtab_section_alignment)

    # .strtab section
    create_amdgpu_codeobject_section(output_stream, new_strtab_section, first_code_object.strtab_section_alignment)

    # Padding for section table
    maybe_create_padding(output_stream, 4)

    # section table entry: NULL
    create_amdgpu_codeobject_section_table_entry(output_stream, first_code_object.null_section_header, 0, 0)

    # section table entry: note
    create_amdgpu_codeobject_section_table_entry(output_stream, first_code_object.note_section_header, note_section_offset, len(new_note_section))

    # section table entry: rodata
    create_amdgpu_codeobject_section_table_entry(output_stream, first_code_object.rodata_section_header, rodata_section_offset, len(new_rodata_section))

    # section table entry: text
    create_amdgpu_codeobject_section_table_entry(output_stream, first_code_object.text_section_header, text_section_offset, len(new_text_section), text_section_offset + 0x1000)

    # section table entry: symtab
    create_amdgpu_codeobject_section_table_entry(output_stream, first_code_object.symtab_section_header, symtab_section_offset, len(new_symtab_section), 0, 6, 3)

    # section table entry: shstrtab
    create_amdgpu_codeobject_section_table_entry(output_stream, first_code_object.shstrtab_section_header, shstrtab_section_offset, len(new_shstrtab_section), 0)

    # section table entry: strtab
    create_amdgpu_codeobject_section_table_entry(output_stream, first_code_object.strtab_section_header, strtab_section_offset, len(new_strtab_section), 0)


# Input files
input_filename_list = ['external.o-offset8192-size9216.co', 'vectoradd_hip.o-offset8192-size11120.co', 'gemm.co', 'gemm2.co' ]
input_is_assembly_list = [ False, False, True, True ]
#input_filename_list = ['gemm.co']
#input_is_assembly_list = [ True ]

# Output file
output_filename = 'blah.co'

# Selected kernel list
# Re-order and trim total number of kernels
selected_kernel_list = ['_Z16vectormul_float3PfPKfS1_ii', '_Z15vectoradd_floatPfPKfS1_ii', '_Z16vectoradd_float4PfPKfS1_ii', '_Z15vectormul_floatPfPKfS1_ii', 'Cijk_Ailk_Bjlk_F8H_HSS_BH_Bias_AS_SAB_SAV_UserArgs_MT64x240x32_MI16x16x1_SN_LDSB1_AFC1_AFEM1_AFEM1_ASEM1_CLR1_CADS0_EPS0_GRVWA8_GRVWB2_GSUAMB_ISA940_IU1_K1_LBSPPA512_LBSPPB1920_LBSPPM0_LPA16_LPB16_LPM0_LRVW4_LWPMn1_MIAV0_MIWT1_15_MO40_NTn1_NTA0_NTB0_NTC0_NTD0_NTM0_NEPBS16_NLCA1_NLCB15_ONLL0_PGR2_PLR1_PKA1_SIA3_SS1_SPO0_SRVW0_SSO0_SVW1_TLDS0_USFGROn1_VSn1_VWA1_VWB1_WSGRA1_WSGRB1_WS64_WG64_4_1', 'Cijk_Ailk_Bjlk_F8H_HSS_BH_Bias_AS_SAB_SAV_UserArgs_MT192x16x32_MI16x16x1_SN_LDSB0_AFC1_AFEM1_AFEM1_ASEM1_CLR1_CADS0_EPS0_GRVWA8_GRVWB2_GSUAMB_ISA942_IU1_K1_LBSPPA1536_LBSPPB128_LBSPPM0_LPA16_LPB16_LPM0_LRVW4_LWPMn1_MIAV0_MIWT3_1_MO40_NTn1_NTA0_NTB0_NTC0_NTD0_NTM0_NEPBS16_NLCA3_NLCB1_ONLL0_PGR2_PLR1_PKA1_SIA3_SS1_SPO0_SRVW0_SSO0_SVW1_TLDS0_USFGROn1_VSn1_VWA1_VWB1_WSGRA1_WSGRB1_WS64_WG64_4_1' ]
#selected_kernel_list = ['Cijk_Ailk_Bjlk_F8H_HSS_BH_Bias_AS_SAB_SAV_UserArgs_MT64x240x32_MI16x16x1_SN_LDSB1_AFC1_AFEM1_AFEM1_ASEM1_CLR1_CADS0_EPS0_GRVWA8_GRVWB2_GSUAMB_ISA940_IU1_K1_LBSPPA512_LBSPPB1920_LBSPPM0_LPA16_LPB16_LPM0_LRVW4_LWPMn1_MIAV0_MIWT1_15_MO40_NTn1_NTA0_NTB0_NTC0_NTD0_NTM0_NEPBS16_NLCA1_NLCB15_ONLL0_PGR2_PLR1_PKA1_SIA3_SS1_SPO0_SRVW0_SSO0_SVW1_TLDS0_USFGROn1_VSn1_VWA1_VWB1_WSGRA1_WSGRB1_WS64_WG64_4_1']

input_stream_list = []
for filename in input_filename_list:
    input_stream = open(filename, 'rb')
    input_stream_list.append(input_stream)

output_stream = open(output_filename, 'wb')

create_amdgpu_codeobject(input_filename_list, input_stream_list, input_is_assembly_list, output_stream, selected_kernel_list)
