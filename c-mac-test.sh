nasm -f macho64 test.asm -DMAC64
ld -lSystem test.o -o test
./test
echo $?
