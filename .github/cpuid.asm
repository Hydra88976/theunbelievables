Detect_cpuid:
    pushfd
    pop eax
    
    mov ecx, eax
    
    mov eax, 1 << 21
    push eax
    popfd
    
    pushfd
    pop eax
    
    push ecx
    popfd
    
    xor eax, ecx
    jz No_cpuid
    ret
    
Detect_longmode:
    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz No_longmode
    ret
    
No_longmode:
    hlt ;Long mode not supported
    
No_cpuid:
    hlt ;not supported