printf:
    pusha ; pushes everything in this scope into the stack
    str_loop: ; string loops over and over until it hits 0
        mov al, [si]
        cmp al, 0 ; sets a flag if 0 is found in AL
        jne print_char ; jumps to the function print_char if AL is not equal to 0
        popa ; pops everything off the stack
        ret ; return
    print_char:
        mov ah, 0x0e ; Teletype function for printing characters
        int 0x10 ; calls the Video interrupt
        add si, 1 ; adds to the memory address of si to 1 to get the next Character from the string
        jmp str_loop ; jumps to the str_loop again