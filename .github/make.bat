nasm ponchoboot.asm -o pboot.bin

nasm extended.asm -o pextended.bin

copy /b pboot.bin+pextended.bin boot.bin

pause