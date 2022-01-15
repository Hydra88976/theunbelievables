OUTPUT_FORMAT(binary)

ENTRY(_main)

INPUT
(
    extended.o
    kernel.o
)

OUTPUT
(
    kernel.bin
)

SECTIONS
{
    . = 0x7e00;

    .text : ALIGN(0x1000)
    {
        *(text)
    }

    .idt BLOCK(0x1000) : ALIGN(0x1000)
    {
        _idt = .;
        . = . + 0x1000;
    }

    .data : ALIGN(0x1000)
    {
        *(.data)
    }

    .rodata : ALIGN(0x1000)
    {
        *(.rodata)
    }

    .bss : ALIGN(0x1000)
    {
        *(COMMON)
        *(.bss)
    }
}