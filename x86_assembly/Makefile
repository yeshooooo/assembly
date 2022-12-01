
# 改为通配符
%.bin: %.asm
# $< 表示输入文件 $@表示输出文件
	nasm -f bin $< -o $@
# 将编译完成的指令写进硬盘
master.img: boot.bin
	dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc

#假的目标，每次必执行
.PHONY:bochs
bochs: master.img
	bochs -q
.PHONY:clean
#清除生成的文件
clean:
	rm -rf *.bin
