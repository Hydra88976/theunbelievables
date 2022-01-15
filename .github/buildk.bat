nasm ponchoboot.asm -f bin -o pboot.bin

nasm extended.asm -f elf64 -o extended.o

gcc -ffreestanding -mno-red-zone -m64 -c "kernel.cpp" -o "kernel.o"

ld -o kernel.tmp -Ttext 0x7e00 extended.o kernel.o

objcopy -O binary kernel.tmp kernel.bin

copy /b pboot.bin+kernel.bin boot.bin

pause
