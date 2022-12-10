    jmp start   ; 这里可以跳过数据段，跳转到start处执行， 也可以把数据放到尾部
; 字符的字面形式，在编译阶段会转成字符编码, \ 是续行符，在编译的时候，编译器会把续行符去掉，把两行合并成一行
; 也可以不用续行符，重新加一个db，定义一行新的数据也是可以的
; 标号是为了以后访问这些数据用的，如果没有标号，在编写程序的时候，就没办法引用这些文本
mytext db 'L', 0x07, 'a', 0x07, 'b', 0x07, 'e', 0x07, 'l', 0x07, ' ', 0x07, 'o', 0x07,\
          'f', 0x07, 'f', 0x07, 's', 0x07, 't', 0x07, ':', 0x07

; start 是为了让开头跳过来执行，因为 mytext处的都是数据，并不能执行
start:
    ; 设置数据段基地址
    ; ds 设置为7c0的原因是：
    ; 汇编语言源程序的编译符合一种假设，即编译后的代码将从某个内存段中偏移地址为0的地方开始加载，
    ; 这样一来如果有一个标号，如mytext, 他在编译时计算的汇编地址，等于程序加载到内存时的段内偏移地址 
    ; 任何使用标号来访问内存的指令，都不会产生问题，因为加载的偏移地址是0，是从段内偏移地址为0的地方开始加载，汇编地址等于程序加载到内存的段内偏移地址
    mov ax, 0x7c0
    mov ds, ax

    ; 设置附加段基地址
    mov ax, 0xb800
    mov es, ax

    cld
    mov si, mytext
    mov di, 0
    mov cx, (start-mytext) / 2 ; 实际上等于13
    rep movsw
    


