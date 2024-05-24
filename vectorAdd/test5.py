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

def extract_section(elf, section_name):
    for section in elf.iter_sections():
        if section.name == section_name:
            return section.data(), section['sh_addralign'], section

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

def dump_section_header(section):
    print('Section: %s, type: %s(%d), flags: %d, addr: %d, offset: %d, size: %d, link: %d, info: %d, addralign: %d, entsize: %d' % (section.name, section['sh_type'], ENUM_SH_TYPE_BASE[section['sh_type']], section['sh_flags'], section['sh_addr'], section['sh_offset'], section['sh_size'], section['sh_link'], section['sh_info'], section['sh_addralign'], section['sh_entsize']))

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

def create_amdgpu_codeobject(input_stream, output_stream, selected_kernel_list):
    elf_file = ELFFile(input_stream)
    #print("Program header offset: %d" % elf_file['e_phoff'])
    #print("Program header entry size: %d" % elf_file['e_phentsize'])
    #print("Program header entry number: %d" % elf_file['e_phnum'])
    #print("--------------------")
    #print("Section table offset: %d" % elf_file['e_shoff'])
    #print("Section entry size: %d" % elf_file['e_shentsize'])
    #print("Section entry number: %d" % elf_file['e_shnum'])
    #print("--------------------")
    #print("shstrtab index: %d" % elf_file['e_shstrndx'])

    #####################################
    # Extract relevant sections from input file
    #####################################

    # NULL section
    (null_section, null_section_alignment, null_section_header) = extract_section(elf_file, '')

    # .note section
    (note_section, note_section_alignment, note_section_header) = extract_section(elf_file, '.note')

    # .rodata section
    (rodata_section, rodata_section_alignment, rodata_section_header) = extract_section(elf_file, '.rodata')

    # .text section
    (text_section, text_section_alignment, text_section_header) = extract_section(elf_file, '.text')

    # Extract .symtab / .shstrtab / .strtab instead of generating for now
    (symtab_section, symtab_section_alignment, symtab_section_header) = extract_section(elf_file, '.symtab')
    (shstrtab_section, shstrtab_section_alignment, shstrtab_section_header) = extract_section(elf_file, '.shstrtab')
    (strtab_section, strtab_section_alignment, strtab_section_header) = extract_section(elf_file, '.strtab')

    # dump section headers
    #dump_section_header(null_section_header)
    #dump_section_header(note_section_header)
    #dump_section_header(rodata_section_header)
    #dump_section_header(text_section_header)
    #dump_section_header(symtab_section_header)
    #dump_section_header(shstrtab_section_header)
    #dump_section_header(strtab_section_header)

    #####################################
    # Fetch individual kernel data
    #####################################

    # Parse .note section
    #print(note_section)
    #print(len(note_section))
    #print(note_section[0:4])
    #print(int.from_bytes(note_section[4:8], byteorder='little'))
    #print(note_section[8:12])
    #print(note_section[12:20])
    #print(len(note_section) - 20)
    symbol_note_map = {}
    for note in note_section_header.iter_notes():
        if note['n_type'] == 32:
            amdgpu_metadata = msgpack.unpackb(note['n_desc'])
            #print(amdgpu_metadata.keys())
            #pprint.pprint(amdgpu_metadata)
            for amdgpu_kernel in amdgpu_metadata['amdhsa.kernels']:
                symbol_note_map[amdgpu_kernel['.name']] = amdgpu_kernel

    # Build a symbol offset to size/name map
    symbol_offset_map = {}
    for i in range(symtab_section_header.num_symbols()):
        symbol = symtab_section_header.get_symbol(i)
        symbol_offset_map[symbol['st_value']] = {'size': symbol['st_size'], 'name': symbol.name}

    #print(symbol_offset_map)

    # Enumerate each kernel
    kernel_map = {}
    for i in range(int(len(rodata_section) / KERNEL_DESCRIPTOR_SIZE)):
        #print('Kernel: %d' % i)
        #print('Kernel descriptor offset relative to .rodata section: 0x%x' % (0x40 * i))
        kernel_descriptor = rodata_section[i * KERNEL_DESCRIPTOR_SIZE : (i + 1) * KERNEL_DESCRIPTOR_SIZE]
        #print(kernel_descriptor)
        kernel_descriptor_offset = rodata_section_header['sh_addr'] + 0x40 * i
        kernel_code_entry_byte_offset = int.from_bytes(kernel_descriptor[16:24], byteorder='little')
        kernel_code_offset = kernel_descriptor_offset + kernel_code_entry_byte_offset
        kernel_code_relative_offset  = kernel_code_offset - text_section_header['sh_addr']
        #print('Kernel code offset: 0x%x' % kernel_code_offset)
        #print('Kernel code offset relative to .text section: 0x%x' % kernel_code_relative_offset)
        kernel_code_size = symbol_offset_map[kernel_code_offset]['size']
        #print('Kernel code size: %d' % kernel_code_size)
        kernel_code_name = symbol_offset_map[kernel_code_offset]['name']
        #print('Kernel name: %s' % kernel_code_name)
        #kernel_descriptor_name = symbol_offset_map[kernel_descriptor_offset]['name']
        #print('Kernel descriptor name: %s' % kernel_descriptor_name)
        #print(text_section[kernel_code_relative_offset : kernel_code_relative_offset + kernel_code_size])
        #print('Kernel metadata:')
        #pprint.pprint(symbol_note_map[kernel_code_name])
        #print('--------------------')

        kernel_map[kernel_code_name] = { 'index': i, 'offset': kernel_code_offset, 'code': text_section[kernel_code_relative_offset : kernel_code_relative_offset + kernel_code_size], 'metadata': symbol_note_map[kernel_code_name], 'descriptor': kernel_descriptor }

    #for kernel_name in selected_kernel_list:
    #    print('-------------------------------')
    #    print('Kernel: %s' % kernel_name)
    #    kernel = kernel_map[kernel_name]
    #    print('Kernel descriptor:' + str(kernel['descriptor']))
    #    print('Kernel code: ' + str(kernel['code']))
    #    print('Kernel metadata: ' + str(msgpack.packb(kernel['metadata'])))

    #####################################
    # Compute new sections: .note / .rodata / .text
    #####################################

    # new kernel order index
    for i in range(len(selected_kernel_list)):
        kernel_name = selected_kernel_list[i]
        kernel = kernel_map[kernel_name]
        kernel_map[kernel_name]['new_index'] = i

    # .note section
    new_amdgpu_metadata = {}
    new_amdgpu_metadata['amdhsa.target'] = amdgpu_metadata['amdhsa.target']
    new_amdgpu_metadata['amdhsa.version'] = amdgpu_metadata['amdhsa.version']
    new_amdgpu_metadata['amdhsa.kernels'] = []
    for kernel_name in selected_kernel_list:
        kernel = kernel_map[kernel_name]
        new_amdgpu_metadata['amdhsa.kernels'].append(kernel['metadata'])

    #print(len(msgpack.packb(new_amdgpu_metadata)))
    #pprint.pprint(new_amdgpu_metadata)
    new_note_section_desc = msgpack.packb(new_amdgpu_metadata)
    new_note_section = note_section[0:4] + \
                       len(new_note_section_desc).to_bytes(4, byteorder='little') + \
                       note_section[8:12] + \
                       note_section[12:20] + \
                       new_note_section_desc
    new_note_section = maybe_create_padding_bytes(new_note_section, 4)
    #print('New .note section:')
    #print(len(new_note_section))
    #print(new_note_section)

    # .rodata section
    new_rodata_section = b''
    for kernel_name in selected_kernel_list:
        kernel = kernel_map[kernel_name]
        new_rodata_section += kernel['descriptor']
        # each kernel descriptor is exactly 64 bytes so no padding is needed
    #print('New .rodata section:')
    #print(len(new_rodata_section))
    #print(new_rodata_section)

    # .text
    new_text_section = b''
    for kernel_name in selected_kernel_list:
        kernel = kernel_map[kernel_name]
        kernel_map[kernel_name]['new_relative_offset'] = len(new_text_section)
        new_text_section += kernel['code']
        # pad kernel codes to 256 bytes aligned
        new_text_section = maybe_create_padding_bytes(new_text_section, 256)
    #print('New .text section:')
    #print(len(new_text_section))
    #print(new_text_section)

    #####################################
    # Compute section table offset
    #####################################

    offset = 64 # ELF header
    offset += 56 * 3 # program header (3 entries)
    # NULL section doesn't participate in offset computation
    # Use new .note / .rodata / .text sections
    (note_section_offset, offset) = compute_section_offset(offset, new_note_section, note_section_alignment)
    (rodata_section_offset, offset) = compute_section_offset(offset, new_rodata_section, rodata_section_alignment)
    (text_section_offset, offset) = compute_section_offset(offset, new_text_section, text_section_alignment)
    (symtab_section_offset, offset) = compute_section_offset(offset, symtab_section, symtab_section_alignment)
    (shstrtab_section_offset, offset) = compute_section_offset(offset, shstrtab_section, shstrtab_section_alignment)
    (strtab_section_offset, offset) = compute_section_offset(offset, strtab_section, strtab_section_alignment)
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
    # Re-compute symbol offset / section index
    #####################################

    for i in range(symtab_section_header.num_symbols()):
        symbol = symtab_section_header.get_symbol(i)

        symbol_offset = symbol['st_value'] 
        if symbol['st_shndx'] in ENUM_ST_SHNDX:
            symbol_section_index = ENUM_ST_SHNDX[symbol['st_shndx']]
        else:
            symbol_section_index = int(symbol['st_shndx'])

        # For each symbol, check if it's inside .rodata or .text section

        # If it's inside .rodata section, find the original index, find the kernel name, find the new index, compute the new offset
        if (symbol_offset >= rodata_section_header['sh_offset']) and (symbol_offset < rodata_section_header['sh_offset'] + rodata_section_header['sh_size']):
            # Find the original descriptor index
            original_index = int((symbol_offset - rodata_section_header['sh_offset']) / KERNEL_DESCRIPTOR_SIZE)
            #print('Original index: %d' % original_index)
            kernel_descriptor = rodata_section[original_index * KERNEL_DESCRIPTOR_SIZE : (original_index + 1) * KERNEL_DESCRIPTOR_SIZE]
            kernel_code_entry_byte_offset = int.from_bytes(kernel_descriptor[16:24], byteorder='little')
            kernel_code_offset = rodata_section_header['sh_offset'] + 0x40 * original_index + kernel_code_entry_byte_offset
            kernel_code_name = symbol_offset_map[kernel_code_offset]['name']
            #print('Kernel name: %s' % kernel_code_name)
            if 'new_index' in kernel_map[kernel_code_name].keys():
                new_index = kernel_map[kernel_code_name]['new_index']
            else:
                # symbol not used in the new binary, set new index be an aribitrary value 0
                new_index = 0
            #print('New index: %d' % new_index)
            symbol_offset = 0x40 * new_index + rodata_section_offset
            #print('New offset: 0x%x' % symbol_offset)

            symbol_section_index = 2 # .rodata section index in the new ELF binary

        # If it's inside .text section, find the original index, find the kernel name, find the new index, compute the new offset
        elif (symbol_offset >= text_section_header['sh_addr']) and (symbol_offset < text_section_header['sh_addr'] + text_section_header['sh_size']):
            #print('Symbol: %s' % symbol.name)
            # Find the original kernel index
            min_offset = sys.maxsize
            kernel_name_with_least_diff = ''
            for kernel_name in kernel_map:
                offset = symbol_offset - kernel_map[kernel_name]['offset']
                if (offset >= 0) and (offset < min_offset):
                    min_offset = offset
                    kernel_name_with_least_diff = kernel_name
            original_index = kernel_map[kernel_name_with_least_diff]['index']
            #print('Min offset: 0x%x' % min_offset)
            #print('Original index: %d' % original_index)
            #print('Kernel name: %s' % kernel_name_with_least_diff)
            if 'new_relative_offset' in kernel_map[kernel_name_with_least_diff].keys():
                #print('Relative offset: 0x%x' % kernel_map[kernel_name_with_least_diff]['new_relative_offset'])
                new_offset = kernel_map[kernel_name_with_least_diff]['new_relative_offset'] + min_offset
            else:
                # symbol not used in the new binary, set new offset be an aribitrary value 0
                new_offset = 0
            #print('New relative offset: 0x%x' % new_offset)

            symbol_offset = new_offset + text_section_offset
            #print('Symbol offset: 0x%x' % symbol_offset)
            symbol_section_index = 3 # .text section index in the new ELF binary

        # Otherwise keep the symbol information largely as-is
        # Only change fields truely necessary
        elif (symbol_offset >= note_section_header['sh_offset']) and (symbol_offset < note_section_header['sh_offset'] + note_section_header['sh_size']):
            symbol_offset = (symbol_offset - note_section_header['sh_offset']) + note_section_offset
            symbol_section_index = 1 # .note section index in the new ELF binary

        elif (symbol_offset >= symtab_section_header['sh_offset']) and (symbol_offset < symtab_section_header['sh_offset'] + symtab_section_header['sh_size']):
            symbol_offset = (symbol_offset - symtab_section_header['sh_offset']) + symtab_section_offset
            symbol_section_index = 4 # .symtab section index in the new ELF binary

        elif (symbol_offset >= shstrtab_section_header['sh_offset']) and (symbol_offset < shstrtab_section_header['sh_offset'] + shstrtab_section_header['sh_size']):
            symbol_offset = (symbol_offset - shstrtab_section_header['sh_offset']) + shstrtab_section_offset
            symbol_section_index = 5 # .shstrtab section index in the new ELF binary

        elif (symbol_offset >= strtab_section_header['sh_offset']) and (symbol_offset < strtab_section_header['sh_offset'] + strtab_section_header['sh_size']):
            symbol_offset = (symbol_offset - strtab_section_header['sh_offset']) + strtab_section_offset
            symbol_section_index = 6 # .strtab section index in the new ELF binary

        #print('Original Name: %s, name index: %d, shndx: %s, value: 0x%x, size: %d' % (symbol.name, symbol['st_name'], symbol['st_shndx'], symbol['st_value'], symbol['st_size']))
        #print('Modified Name: %s, name index: %d, shndx: %d, value: 0x%x, size: %d' % (symbol.name, symbol['st_name'], symbol_section_index, symbol_offset, symbol['st_size']))
        # Modify st_offset, st_shndx
        symtab_section = symtab_section[:24 * i + 6] + symbol_section_index.to_bytes(2, byteorder='little') + symbol_offset.to_bytes(8, byteorder='little') + symtab_section[24 * i + 8 + 8:]


    #####################################
    # Re-compute kernel code entry byte offset
    #####################################

    for i in range(int(len(new_rodata_section) / KERNEL_DESCRIPTOR_SIZE)):
        kernel_descriptor = new_rodata_section[i * KERNEL_DESCRIPTOR_SIZE : (i + 1) * KERNEL_DESCRIPTOR_SIZE]
        for kernel_code_name in kernel_map:
            kernel = kernel_map[kernel_code_name]
            if 'new_index' in kernel.keys() and kernel['new_index'] == i:
                new_kernel_relative_offset = kernel['new_relative_offset']
                new_kernel_code_entry_byte_offset = (text_section_offset + new_kernel_relative_offset) - (rodata_section_offset + 0x40 * i)
                break

        #print('New kernel code entry byte offset: ' + str(hex(new_kernel_code_entry_byte_offset)))
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
    create_amdgpu_codeobject_section(output_stream, new_note_section, note_section_alignment)

    # .rodata section
    create_amdgpu_codeobject_section(output_stream, new_rodata_section, rodata_section_alignment)

    # .text section
    create_amdgpu_codeobject_section(output_stream, new_text_section, text_section_alignment)

    # .symtab section
    create_amdgpu_codeobject_section(output_stream, symtab_section, symtab_section_alignment)

    # .shstrtab section
    create_amdgpu_codeobject_section(output_stream, shstrtab_section, shstrtab_section_alignment)

    # .strtab section
    create_amdgpu_codeobject_section(output_stream, strtab_section, strtab_section_alignment)

    # Padding for section table
    maybe_create_padding(output_stream, 4)

    # section table entry: NULL
    create_amdgpu_codeobject_section_table_entry(output_stream, null_section_header, 0, 0)

    # section table entry: note
    create_amdgpu_codeobject_section_table_entry(output_stream, note_section_header, note_section_offset, len(new_note_section))

    # section table entry: rodata
    create_amdgpu_codeobject_section_table_entry(output_stream, rodata_section_header, rodata_section_offset, len(new_rodata_section))

    # section table entry: text
    create_amdgpu_codeobject_section_table_entry(output_stream, text_section_header, text_section_offset, len(new_text_section), text_section_offset + 0x1000)

    # section table entry: symtab
    create_amdgpu_codeobject_section_table_entry(output_stream, symtab_section_header, symtab_section_offset, len(symtab_section), 0, 6, 3)

    # section table entry: shstrtab
    create_amdgpu_codeobject_section_table_entry(output_stream, shstrtab_section_header, shstrtab_section_offset, len(shstrtab_section), 0)

    # section table entry: strtab
    create_amdgpu_codeobject_section_table_entry(output_stream, strtab_section_header, strtab_section_offset, len(strtab_section), 0)

# Selected kernel list
selected_kernel_list = ['_Z15vectoradd_floatPfPKfS1_ii', '_Z15vectormul_floatPfPKfS1_ii']

with open(sys.argv[1], 'rb') as input_stream:
    with open(sys.argv[2], 'wb') as output_stream:
       create_amdgpu_codeobject(input_stream, output_stream, selected_kernel_list)
