; 从1加到100并显示累加结果

    jmp start
;字符串，等同于 db '1', '+',....'0','0','='
message db '1+2+3+...+100=' 

start:
    mov ax, 0x7c0   ;设置数据段的段基地址
    mov ds, ax

    mov ax, 0xb800 ;设置附加段基地址到显示缓冲区
    mov es, ax
    
    ; 显示字符串
    ; 将字符串首地址传送到寄存器si
    ; message代表的是字符串的汇编地址
    mov si, message
    mov di, 0   ; 显存内的偏移地址，一开始是0
    mov cx, start-message ; 循环次数

showmsg:
    mov al,[si] ;
    mov [es:di],al ; 将al内容写进显存
    inc di ; di指向下个字符位置
    mov byte [es:di], 0x07 ;颜色属性
    ;下一个字符
    inc di
    inc si
    loop showmsg ; 循环依赖cx寄存器，循环次数等于字符个数

    ;以下计算1到100的和
    xor ax,ax   ;异或置零，AX用于存放累加结果
    mov cx,1 ; cx充当加数
summate:
    add ax,cx
    inc cx
    cmp cx, 100
    jle summate ;<=

    jmp $ ; 死循环

    times 510-($-$$) db 0
    db 0x55,0xaa


