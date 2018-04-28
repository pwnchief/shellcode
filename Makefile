build:
	gcc loader.c -o loader
	nasm test.asm -o test.bin
clean:
	rm -f leader
	rm -f test.bin