%.bin: %.asm
	nasm -f bin $< -o $@

master.img: boot.bin
	dd if=boot.bin of=master.img bs=512 count=1 conv=notrunc
.PHONY:bochs
	bochs -q
