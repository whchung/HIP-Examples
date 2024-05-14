#!/usr/bin/env python3
from elftools.elf.elffile import ELFFile
def extract_symbol_data(elf_path, symbol_name):
    with open(elf_path, 'rb') as f:
        elf = ELFFile(f)
        symtab = elf.get_section_by_name('.symtab')
        if not symtab:
            print("Symbol table not found.")
            return None

        symbol = symtab.get_symbol_by_name(symbol_name)
        if not symbol:
            print("Symbol not found.")
            return None

        # Assuming the symbol is in the text section
        data = elf.get_section_by_name('.text')
        offset = symbol[0]['st_value'] - data['sh_addr']
        size = symbol[0]['st_size']
        data.stream.seek(data['sh_offset'] + offset)
        return data.stream.read(size)

# Example usage
data = extract_symbol_data('fused.o', '_Z7kernel1PKfS0_Pf')
print(data)
