start:
; 设置段地址
mov ax, 0xb800
mov ds, ax

; 用于向文本模式下的显存写入要显示的字符的编码和颜色属性
; 将字符A的编码写入到内存单元 [] 表明是一个地址，在这里是偏移地址
; 如果没有附加任何指示， 段地址是默认在段寄存器ds中，前面被设置成0xb800
; 在这里立即数0x41 的长度实际上不明确
; byte 用于修饰目的操作数的长度，本地传递是以字节的方式传递,那么源操作数也是一个字节的长度
mov byte [0x00], 0x41  ; 字符A的ASCII编码
mov byte [0x01], 0x04  ; 黑底红字， 无闪烁

mov byte [0x02], 's'   ; 等同于 mov byte [0x02], 0x73
mov byte [0x03], 0x04

mov byte [0x04], 's'
mov byte [0x05], 0x04

mov byte [0x06], 'e'
mov byte [0x07], 0x04

mov byte [0x08], 'm'
mov byte [0x09], 0x04

mov byte [0x0a], 'b'
mov byte [0x0b], 0x04

mov byte [0x0c], 'l'
mov byte [0x0d], 0x04

mov byte [0x0e], 'y'
mov byte [0x0f], 0x04

mov byte [0x10], '.'
mov byte [0x11], 0x04

;;测试标号
;times 60 db 0xcc

; 段间直接绝对跳转指令
; 段间指的是这条指定将跳到另一个段里执行
; 这里改的是cs和ip
; 这里没必要跳到0x7c00 那么远，可以无休止的重复自己
; 这条指令的物理地址就是0x7c00 + 0x5f = 0x7c5f
;jmp 0x0000:0x7c00 ;跳回到物理地址0x7c00,循环往复，不停执行这段代码
; jmp 0x0000:0x7c5f   ;跳回他自己

; 标号代表指令的汇编地址，因此可以将5f 变成标号
again:
    jmp 0x0000:0x7c5f + again
; 在汇编程序中10进制和16进制可以放在一起运算
current:    times 510-(current-start) db 0

; db 可以定义多个字节，每个字节用,分开
db 0x55, 0xaa