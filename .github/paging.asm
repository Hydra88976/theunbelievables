PageTableEntry equ 0x1000

Setup_identitypaging:
    mov edi, PageTableEntry
    mov cr3, edi
    mov dword [edi], 0x2003
    add edi, 0x1000
    mov dword [edi], 0x3003
    add edi, 0x1000
    mov dword [edi], 0x4003
    add edi, 0x1000
    
    mov ebx, 0x00000003
    mov ecx, 1024   ;512
    
    .SetEntry:
        mov dword [edi], ebx
        add ebx, 0x1000
        add edi, 8  ;8
        loop .SetEntry
     
    ;Enable Paging   
    mov eax, cr4
    or eax, 1 << 5 ;5
    mov cr4, eax
    
    ;Set Long Mode Enable
    mov ecx, 0xC0000080
    rdmsr
    or eax, 1 << 8
    wrmsr
    
    mov eax, cr0
    or eax, 1 << 31
    mov cr0, eax
    ret
    
    
    
    