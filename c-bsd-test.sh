nasm -f elf64 test.asm -DBSD64
ld -m elf_x86_64_fbsd -e _main test.o -o test
./test
echo $?
