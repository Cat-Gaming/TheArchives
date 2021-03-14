;BOOTLOADER START
[org 0x7c00]

mov si, BOOTLOADERSTR
call printf

mov al, 1 ; Sectors to Read
mov cl, 2 ; Sector to Read
call readDisk
jmp 0x7c00 + 512

jmp $

%include "./src/printf.asm"
%include "./src/disk_ops.asm"

BOOTLOADERSTR: db "Bootloader Loaded in Location: 0x7c00", 0xa, 0xd, 0 ; Explains that the Bootloader was loaded in 0x7c00 location
LOADING: db "Loading...", 0xa, 0xd, 0

;padding and magic number
times 510-($-$$) db 0
dw 0xaa55
