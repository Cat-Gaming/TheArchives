;KERNEL START
[org 0x00007E00] ; puts the kernel into conventional memory

kernel_main:
mov si, KERNEL_LOADED ; moves the KERNEL_LOADED string into the Register SI
call printf ; Calls Printf function

call COLOR_TEST

jmp $ ; Infinite Loop


panic: ; panic's just in case of error
    mov si, KERNEL_PANIC
    call printf ; Calls Printf function
    jmp $ ; Infinite Loop

KERNEL_LOADED: db "Kernel Loaded!", 0xa, 0xd, 0
KERNEL_PANIC: db "Panic!", 0xa, 0xd, 0

%include "./src/disk_ops.asm"
%include "./src/printf.asm"
%include "./src/vga.asm"

times 510-($-$$) db 0