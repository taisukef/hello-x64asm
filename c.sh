nasm -f macho64 hello.asm -DMAC64
ld -lSystem hello.o -o hello
./hello
echo $?
