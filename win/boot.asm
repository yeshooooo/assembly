; 使用相对偏移量的段跳转和近跳转

start:
    mov ax, 0xb800
    mov ds, ax

    mov byte [0x00], 0x41
    mov byte [0x01], 0x0c

    mov byte [0x02], 's'
    mov byte [0x03], 0x04

    mov byte [0x04], 's'
    mov byte [0x05], 0x04

    mov byte [0x06], 'e'
    mov byte [0x07], 0x04

    mov byte [0x08], 'm'
    mov byte [0x09], 0x04

    mov byte [0x0a], 'b'
    mov byte [0x0b], 0x04
dest:
    mov byte [0x0c], 'l'
    mov byte [0x0d], 0x04

    mov byte [0x0e], 'y'
    mov byte [0x0f], 0x04

    mov byte [0x10], '.'
    mov byte [0x11], 0x04


; 起循环作用
; 标号代表的是离他最近的指令的汇编地址，而jmp 实际需要跳转的是段内偏移地址
; 但是目标地址相对地址不会变, 跳转可以向前跳也可以向后跳
; 跳的不太远在-128在128之间，是两个字节，机器码为 EB 8位的相对偏移量
again:
    jmp near again ; 短跳转， 编译后是两个字节，short 可以有也可以没有，三个字节的是E9 16 位的 关键字是near
current:
    times 510-(current-start) db 0

    db 0x55, 0xaa 