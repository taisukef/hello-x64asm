nasm -f elf64 hello.asm -DLINUX64
ld -e _main hello.o -o hello
./hello
echo $?
