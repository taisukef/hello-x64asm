nasm -f elf64 hello.asm -DBSD64
ld -m elf_i386_fbsd -e _main hello.o -o hello
./hello
echo $?
