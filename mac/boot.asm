start:
    xor dx, dx        ;等价于mov dx, 0 这里用异或是因为在寄存器内部计算速度更快
    mov ax, 65535
    mov bx, 10
    div bx          ; Ax = 商， DX = 余数
current:
    times 510 - (current - start) db 0;

    db 0x55, 0xaa
    