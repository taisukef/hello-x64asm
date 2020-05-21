nasm -f elf64 hello.asm -DBSD64
ld -m elf_x86_64_fbsd -e _main hello.o -o hello
./hello
echo $?
