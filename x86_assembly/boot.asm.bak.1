; 让程序从7c00开始
[org 0x7c00]

; 清除bochs显示的乱七八糟的东西
mov ax, 3
int 0x10 ; 将显示模式设置成文本模式

; magic breakpoint
xchg bx, bx

; 把 message上的字符串移动到显卡
mov ax, 0xb800
mov es, ax

mov ax, 0
mov ds, ax

mov si, message
mov di, 0
mov cx, (message_end - message)

loop1:
    mov al, [ds:si]
    mov [es:di], al
    ; add si, 1
    inc si ;同add si, 1
    add di, 2 ; 显示器是两个字节表示一个字符，所以这里加2， 第二个字节是字体的格式

    loop loop1


halt:
    jmp halt

; 标签可以表示在程序中的地址
message:
    db "hello world!!!!", 0

; 需要知道字符串多长，标记字符串结束
message_end:

times 510 - ($ - $$) db 0
db 0x55, 0xaa