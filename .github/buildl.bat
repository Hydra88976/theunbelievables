nasm ponchoboot.asm -f bin -o pboot.bin

nasm extended.asm -f elf64 -o extended.o

gcc -Ttext 0x7e00 -ffreestanding -mno-red-zone -m64 -c "kernel.cpp" -o "kernel.o"

ld -T"linker.ld"

copy /b pboot.bin+kernel.bin boot.bin

pause
