#!/usr/bin/env python3
#from elftools.elf.elffile import ELFFile
#def extract_symbol_data(elf_path, symbol_name):
#    with open(elf_path, 'rb') as f:
#        elf = ELFFile(f)
#        symtab = elf.get_section_by_name('.symtab')
#        if not symtab:
#            print("Symbol table not found.")
#            return None
#
#        symbol = symtab.get_symbol_by_name(symbol_name)
#        if not symbol:
#            print("Symbol not found.")
#            return None
#
#        # Assuming the symbol is in the data section
#        data = elf.get_section_by_name('.data')
#        offset = symbol[0]['st_value'] - data['sh_addr']
#        size = symbol[0]['st_size']
#        data.stream.seek(data['sh_offset'] + offset)
#        return data.stream.read(size)
#
## Example usage
#data = extract_symbol_data('fused.o', '_Z7kernel1PKfS0_Pf')
#print(data)

#!/usr/bin/env python3
import sys
from elftools.elf.elffile import ELFFile
if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("You must provide this script with an elf binary file you want to examine")
        exit(1)
    print(f"Mapping between segments and sections in the file {sys.argv[1]}")
    elffile = ELFFile(open(sys.argv[1], 'rb'))
    segments = list()
    for segment_idx in range(elffile.num_segments()):
        segments.insert(segment_idx, dict())
        segments[segment_idx]['segment'] = elffile.get_segment(segment_idx)
        segments[segment_idx]['sections'] = list()
    for section_idx in range(elffile.num_sections()):
        section = elffile.get_section(section_idx)
        for segment in segments:
            if segment['segment'].section_in_segment(section):
                segment['sections'].append(section)
    for segment in segments:
        seg_head = segment['segment'].header
        print("Segment:")
        print(f"Type: {seg_head.p_type}\nFlag: {hex(seg_head.p_flags)}\nOffset: {hex(seg_head.p_offset)}\nVirtual address: {hex(seg_head.p_vaddr)}\nPhysical address: {(seg_head.p_paddr)}\nSize in file: {hex(seg_head.p_filesz)}\nSize in memory: {hex(seg_head.p_memsz)}\nAlign: {hex(seg_head.p_align)}\n")
        if segment['sections']:
            print("Segment's sections:")
            print([(section.name, hex(section['sh_addr'])) for section in segment['sections']], sep=', ', end='\n')
        else:
            print('Segment contains no sections')
        print('\n--------------------------------------------------------------------------------')
