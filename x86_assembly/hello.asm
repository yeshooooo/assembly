; 清除bochs显示的乱七八糟的东西
mov ax, 3
int 0x10 ; 将显示模式设置成文本模式

mov ax, 0xb800
mov ds, ax

; 这里省略了设置样式，所以地址中间空了一个字节
mov byte[0], 'h'
mov byte[2], 'e'
mov byte[4], 'l'
mov byte[6], 'l'
mov byte[8], 'o'
mov byte[10], ','
mov byte[12], 'w'
mov byte[14], 'o'
mov byte[16], 'r'
mov byte[18], 'l'
mov byte[20], 'd'
mov byte[22], '!'

halt:
    jmp halt

times 510 - ($ - $$) db 0
db 0x55, 0xaa
