         ;代码清单5-1 
         ;文件名：c05_mbr.asm
         ;文件说明：硬盘主引导扇区代码
         ;创建日期：2011-3-31 21:15 
         
         mov ax,0xb800                 ;指向文本模式的显示缓冲区(显存)
         mov es,ax

         ;以下显示字符串"Label offset:"
         mov byte [es:0x00],'L'
         mov byte [es:0x01],0x07	; 黑底白字
         mov byte [es:0x02],'a'
         mov byte [es:0x03],0x07
         mov byte [es:0x04],'b'
         mov byte [es:0x05],0x07
         mov byte [es:0x06],'e'
         mov byte [es:0x07],0x07
         mov byte [es:0x08],'l'
         mov byte [es:0x09],0x07
         mov byte [es:0x0a],' '
         mov byte [es:0x0b],0x07
         mov byte [es:0x0c],"o"
         mov byte [es:0x0d],0x07
         mov byte [es:0x0e],'f'
         mov byte [es:0x0f],0x07
         mov byte [es:0x10],'f'
         mov byte [es:0x11],0x07
         mov byte [es:0x12],'s'
         mov byte [es:0x13],0x07
         mov byte [es:0x14],'e'
         mov byte [es:0x15],0x07
         mov byte [es:0x16],'t'
         mov byte [es:0x17],0x07
         mov byte [es:0x18],':'
         mov byte [es:0x19],0x07

		; 每个标号代表的是一个汇编地址,即每个标号都等效于一个数字
         mov ax,number                 ;被除数高位， 取得标号number的汇编地址(汇编地址是指在程序运行时数据或者指令在段内的偏移地址，在程序编写时，这个相对偏移量叫汇编地址，从0开始)
         mov bx,10			;除数， 采用除10取余法分解每个数位

         ;设置数据段的基地址
		 ; 将段寄存器ds的内容设置为段寄存器cs的内容，这样代码段和数据段是同一个段
		 ; 可以看出可以将段寄存器内容传递给通用寄存器
         mov cx,cs
         mov ds,cx
; 因为不知道标号地址代表的有多大，所以才按最大值65535处理		
		; 分解第一个数位
         ;求个位上的数字
         mov dx,0 ; 这样dx 和ax一起组成一个32位的被除数
         div bx	;除数，并且将最终结果的余数放到dx中，由于余数小于10，所以结果实际上在dl中
         mov [0x7c00+number+0x00],dl   ;保存个位上的数字, 这条指令的段地址位于段寄存器ds，这里给出的只是偏移地址

         ;求十位上的数字
         xor dx,dx
         div bx
         mov [0x7c00+number+0x01],dl   ;保存十位上的数字

         ;求百位上的数字
         xor dx,dx
         div bx
         mov [0x7c00+number+0x02],dl   ;保存百位上的数字

         ;求千位上的数字
         xor dx,dx
         div bx
         mov [0x7c00+number+0x03],dl   ;保存千位上的数字

         ;求万位上的数字 
         xor dx,dx
         div bx
         mov [0x7c00+number+0x04],dl   ;保存万位上的数字

         ;以下用十进制显示标号的偏移地址
         mov al,[0x7c00+number+0x04]
         add al,0x30	; 转换成数字的编码
         mov [es:0x1a],al	; 使用段超越前缀es 将al中的字符写入上面字符串后面的显存
         mov byte [es:0x1b],0x04
         
         mov al,[0x7c00+number+0x03]
         add al,0x30
         mov [es:0x1c],al
         mov byte [es:0x1d],0x04
         
         mov al,[0x7c00+number+0x02]
         add al,0x30
         mov [es:0x1e],al
         mov byte [es:0x1f],0x04

         mov al,[0x7c00+number+0x01]
         add al,0x30
         mov [es:0x20],al
         mov byte [es:0x21],0x04

         mov al,[0x7c00+number+0x00]
         add al,0x30
         mov [es:0x22],al
         mov byte [es:0x23],0x04
         
         mov byte [es:0x24],'D'
         mov byte [es:0x25],0x07
          
   infi: jmp near infi                 ;无限循环，生成near 生成3字节的跳转指令
      
  number db 0,0,0,0,0	; 用伪指令定义的5个字节，数据保存在这里，第一个字节标号是number
  
  times 203 db 0	;203是手动算出来的
            db 0x55,0xaa