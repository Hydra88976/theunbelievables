[org 0x7c00]

boot:
    jmp main
    
bpbOEM:                 db "mkfs.fat"
bpbBytesPerSector:      dw 512
sectPerCluster:         db 1
reservedSectors:        dw 1
numFAT:                 db 2
numRootDirEntries:      dw 224
numSectors:             dw 2880
mediaType:              db 0xf0
numFATsectors:          dw 9
sectorsPerTrack:        dw 18
numHeads:               dw 2
numHiddenSectors:       dd 0
numSectorsHuge:         dd 0
driveNum:               db 0
reserved:               db 0
signature:              db 0x29
volumeID:               dd 0x2d7e5a1a
volumeLabel:            db "NO NAME   "
fileSysType:            db "FAT12  "

main:
xor ax, ax
mov ds, ax
mov es, ax

mov [boot_disk], dl

mov bp, 0x7c00
mov sp, bp

;mov bx, teststr
;call printstring

call read_disk

;mov ah, 0x0e
;mov al, [program_space]
;int 0x10

;jmp $
jmp program_space


%include 'diskread.asm'
%include 'printstr.asm'

times 510-($-$$) db 0
dw 0xaa55