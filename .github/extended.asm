;[org 0x7e00]

jmp Enter32bitProtectedMode

%include 'gdt.asm'
%include 'printstr.asm'

;--------------------------------------
;mov bx, extendedspace
;call printstring

;jmp $

;extendedspace:
;db 'success!',0
;---------------------------------------

Enter32bitProtectedMode:
call EnableA20
cli         ;disable interrupts
lgdt [gdt_descriptor]       ;load gdt in lgdt 
mov cr0, eax                ; move cr0 register in eax register
or eax, 1                   ; move 1 byte in eax register
mov cr0, eax                ; move cr0 register back to eax register

jmp codeseg:StartProtectedMode

EnableA20:
in al, 0x92
or al, 2
out 0x92, al
ret

[bits 32]

%include 'cpuid.asm'
%include 'paging.asm'


StartProtectedMode:

mov ax, dataseg
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax


;mov [0xb8000],byte 'H'
call Detect_cpuid       ;check cpu id for more information about processor
call Detect_longmode    ;check if cpu supports Long mode 64bit
call Setup_identitypaging ;main problem was here -> because of so many typing mistakes in various files but now the problems are resolved.
call EditGDT              ;call Edited gdt for long mode 
jmp codeseg:Start64bit

[BITS 64]
[extern _main]
;%include 'idt.asm'
Start64bit:
    mov edi, 0xb8000
	mov rax, 0x1f201f201f201f20
	mov ecx, 500
	rep stosq
	;call ActivateSSE
	call _main
	jmp $

;ActivateSSE:
	;mov rax, cr0
	;and ax, 0b11111101
	;or ax, 0b00000001
	;mov cr0, rax

	;mov rax, cr4
	;or ax, 0b1100000000
	;mov cr4, rax
	;ret

;times 2048-($-$$) db 0