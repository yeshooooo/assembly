; 显示标号的汇编地址
    jmp start
mytext db 'L', 0x07, 'a', 0x07, 'b', 0x07, 'e', 0x07, 'l', 0x07, ' ', 0x07, 'o', 0x07,\
         'f', 0x07, 'f', 0x07, 's', 0x07, 'e', 0x07,'t', 0x07, ':', 0x07

start:
    mov ax, 0x7c0
    mov ds, ax

    mov ax, 0xb800
    mov es, ax

    cld
    mov si, mytext
    mov di, 0
    mov cx, (start-mytext)/2
    rep movsw

    ; 得到标号所代表的汇编地址
    mov ax, number
    ; 分解各个数位
    mov bx, ax
    mov cx, 5   ;循环次数
    mov si, 10  ; 除数
digit:
    xor dx, dx ; dx会保存相除之后的余数，在循环开始前清零
    div si ; 想出之后，商在ax中， 余数在dx中
    mov [bx], dl ; 保存数位 ，这种写法访问内存时的偏移地址来自于bx寄存器 
    inc bx ;用于将bx的内容加1，以指向下一个相邻的内存地址 
    loop digit  ; 在执行时，会先判断寄存器cx的值，cx非0才会跳转，如果cx的值为0，则终止循环


    jmp $
number db 0, 0, 0, 0, 0 ; 存放分解出来的数位
    times 510-($-$$) db 0
    db 0x55, 0xaa