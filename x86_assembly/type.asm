; 字节
db 100 ;define byte

; 两个字节，一个字
dw 0xaa55 ;define word 存储的时候是55 aa 是以小端的形式存储的，intel的cpu都是小端方式存储

; 四个字节, 两个字
dd 0x12345678; define doubleword 存储 78 56 34 12

; 数字表示的不同形式

dw 55aah ; 16进制
db 11110000b ; 2进制
db 1111_0000b ; 2进制
db 0b00001111 ; 2进制
db 0b0000_1111 ; 2进制

; 字符串

db "hello world!!!"
db "hello world!!!", 0, 12, 123 ; 定义的时候后面也可以跟逗号定义字节