program_space equ 0x7e00    ;0x7e00

read_disk:
mov ah, 0x00     ;2 for floppy and 0 for disks
mov bx, program_space
mov al, 32      ;32 ;2 ;disk sectors to load
mov dl, [boot_disk] ;storing drive location in boot disk
mov ch, 0x00     ;0 ; cylinder head to load
mov dh, 0x00     ;0 ;disk head to load
mov cl, 0x02     ;2 ;cylinder to load

int 0x13
jc disk_read_fail
ret


boot_disk:
db 0

diskerror_msg:
db '[+]Disk read error....', 0
 
disk_read_fail:
mov bx, diskerror_msg
call printstring
jmp $