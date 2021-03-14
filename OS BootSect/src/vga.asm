write_pixel:
    pusha
    mov ah, 0Ch
    mov bx, 0
    ; X = CX Register
    ; Y = DX Register
    int 10h
    popa
    ret
change_background:
    pusha
    mov ah, 0Bh
    mov bh, 00h
    ; BL = COLOR Attribute
    int 10h
    popa
    ret
COLOR_TEST:
    mov bl, 04h ; RED
    call change_background

    mov cx, 0Fh
    mov dx, 4240h ; Wait 1 Sec
    mov ah, 86h
    int 15h

    mov bl, 02h ; GREEN
    call change_background

    mov cx, 0Fh
    mov dx, 4240h ; Wait 1 Sec
    mov ah, 86h
    int 15h

    mov bl, 01h ; BLUE
    call change_background

    mov cx, 0Fh
    mov dx, 4240h ; Wait 1 Sec
    mov ah, 86h
    int 15h


    mov bl, 00h ; BLACK
    call change_background

    mov si, COLOR_TEST_SUCESS
    call printf
    ret

COLOR_TEST_SUCESS: db "Color Test Complete!", 0xa, 0xd, 0