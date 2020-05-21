nasm -f elf64 test.asm -DLINUX64
ld -e _main test.o -o test
./test
echo $?
