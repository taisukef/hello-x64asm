nasm -f elf64 hello.asm -DCENT64
ld -e _main hello.o -o hello
./hello
echo $?
