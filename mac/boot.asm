; 计算机中的负数

    jmp start
data1 db -1
data2 dw -25

start:
    mov dx, [0x2002]
    neg dx
    