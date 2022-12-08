; 在一个段打算内换来换去很麻烦， 可以使用附加段寄存器es
; 为了应付当前这种需要，可以使用ds取数字字符，使用es操作显存，互不干扰
; 将数字字符写入显存
; intel 处理器不允许指令的两个操作数都是内存地址，需要使用寄存器中转 

; 加法运算符
; 显示数字
; 使用标号访问内存数据
; 不定义buffer，直接使用current定义的空间也是可以的，这里定义buffer是为了便于理解
start:
; 第一个数位
    mov ax, 65535
    xor dx, dx
    mov bx, 10
    div bx      ; ax = 商（6553）， dx = 余数（5）
    ;为了显示这个数字，需要将其转换为数字字符，加上0x30
    add dl, 0x30 ; 余数实际上是保存在dl中的-->将数字转换为对应的数字字符

    ; 设置段寄存器
    mov cx, 0
    mov ds, cx
    ; 访问buffer的第一个字节
    mov [0x7c00+buffer], dl ; 将dl处的字符传送到段内这个偏移地址处， 访问的实际上就是下面的db 0 这个位置， 因为dl是8位的，所以传送操作是以字节为单位进行的
; 第二个数位
    xor dx, dx ; 余数已经被妥善保存了，这时候清零， 因为他需要当作被除数的高16位
    div bx
    add dl, 0x30
    mov [0x7c00 + buffer + 1], dl
; 第三~五个数位
    xor dx, dx
    div bx
    add dl, 0x30
    mov [0x7c00 + buffer + 2], dl
    xor dx, dx
    div bx
    add dl, 0x30
    mov [0x7c00 + buffer + 3], dl
    xor dx, dx
    div bx
    add dl, 0x30
    mov [0x7c00 + buffer + 4], dl

; 将分解完的字符传入显存
    ; 把段地址传送到附加段寄存器es
    mov cx, 0xb800
    mov es, cx
    ; 用段地址ds 取字符编码
    ; 如果没有特别指明，我们访问内存时，默认使用段寄存器ds
    mov al, [0x7c00 + buffer + 4] ; 这里实际上是将段寄存器打算的内容左移四位加上此偏移地址形成20位的物理地址

;偏移地址前面的es: 叫做段超越前缀， 如果没有段超越前缀，访问内存时，段地址默认是在ds中
    ; 用段寄存器es填充显存
    mov [es:0x00], al ;写入字符编码
    mov byte [es:0x01], 0x2f ; 颜色属性
    ; 2~5
    mov al, [0x7c00 + buffer + 3]
    mov [es:0x02], al
    mov byte [es:0x03], 0x2f
    mov al, [0x7c00 + buffer + 2]
    mov [es:0x04], al
    mov byte [es:0x05], 0x2f
    mov al, [0x7c00 + buffer + 1]
    mov [es:0x06], al
    mov byte [es:0x07], 0x2f
    mov al, [0x7c00 + buffer]
    mov [es:0x08], al
    mov byte [es:0x09], 0x2f

; 写一个无限循环防止跑飞 
again:
    jmp again ;反复跳往自己
    ; 需要将结果保存到内存中，使用伪指令db 开辟空间
    ; 光有空间还不够，没办法找到他们，还要为他们添加标号
    ; 这个标号没有冒号结尾，跟前面的不一样, 这是合法的，标号的最后一个字符是冒号，冒号可以省略
    ; 习惯上，伪指令前面的标号的冒号省略掉
    ; buffer 代表第一个 0的汇编地址（相对地址,从0开始）
    buffer db 0, 0, 0, 0, 0 ; 使用db 开辟5个字节的空间，因为65535 有5个数位
    ; 这里的地址就是0000:0x7c00 + buffer
    ; 要访问数据，必须使用数据段寄存器ds，因此要把0传递给ds


     




