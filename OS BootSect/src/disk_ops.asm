readDisk:
    pusha
    mov ah, 02h
    mov dl, 00h ; QEMU = 80h FLOPPY EMU = 00h
    mov ch, 0
    mov dh, 0
    ;mov al, 1
    ;mov cl, 2
    
    push bx
    mov bx, 0
    mov es, bx
    pop bx
    mov bx, 0x7c00 + 512

    int 13h

    jc disk_error
    popa
    ret

    disk_error:
        mov si, ERROR_SECTORS
        call printf
        jmp $

recalibrate_drive:
    pusha
    mov ah, 11h
    mov dl, 00h ; QEMU_HARD_DISK = 80h FLOPPY EMU = 00h HARD_DISK == 80h
    int 13h

    cmp ah, 00h
    jne recalibration_error
    mov si, CALIBRATION_FINISHED
    call printf
    popa
    ret

    recalibration_error:
        mov ah, 00h
        int 13h
        mov si, DRIVE_ERROR_CALIBRATING
        call printf
        jmp $

DRIVE_CALLIBRATED: db "Drive Calibrated"
ERROR_SECTORS: db "Error Loading Disk!", 0xa, 0xd, 0
CALIBRATION_FINISHED: db "Disk Calibration Finished!", 0xa, 0xd, 0
DRIVE_ERROR_CALIBRATING: db "Error Calibrating Disk!", 0xa, 0xd, 0