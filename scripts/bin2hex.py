hexf=open("./hex_file.txt",'w',encoding='utf-8')
hexf=open("./hex_file.txt",'a',encoding='utf-8')

binf=open('', encoding='utf-8')
binf_lines=binf.readlines()

for i in range(len(binf_lines)):
    bin_merge = binf_lines[i].strip('\n') + binf_lines[i].strip('\n') + binf_lines[i].strip('\n') + binf_lines[i].strip('\n')
    print(bin_merge)
    str_hex = str(hex(int(bin_merge, 2 )))
    print(str_hex[2:])
    if (i==len(binf_lines)):
        hexf.write(str_hex[2:])
    else:
        hexf.write(str_hex[2:] + "\n")