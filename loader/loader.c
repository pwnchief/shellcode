#include <stdio.h>
#include <curses.h>
#include <string.h>
#include <stdlib.h>
#include <sys/mman.h>

void main(int argc, char const *argv[])
{
	printf("Starting our loader\n");
	char filename[256];
	if ( argc != 2){
			printf("WARNING! defaulting to test.bin shellcode\n");
			strcpy(filename,"bin-sh-excecute.bin");
		}
	else {
		strcpy(filename,argv[1]);
		}
	FILE *f;
	size_t fsize = 0;
	f=fopen(filename,"r");
	if(!f)
	{
		printf("Could not open %s \n",filename);
		exit(1);
	}
	fseek(f,0,SEEK_END);
	fsize = (size_t) ftell(f);
	fseek(f, 0, SEEK_SET);
	
	void (*shellcode)();
	shellcode = malloc(fsize);

	if(!shellcode){
		printf("Allocating %ld bytes failed\n",fsize );
	} 
	void *ptr;
	ptr = (void (*)()) ((long long )shellcode & 0xfffffffffffff000);

	if (mprotect(ptr, fsize+0x1000,PROT_EXEC|PROT_WRITE|PROT_READ))
	{
		printf("Mprotect failures for %p \n",shellcode );
		exit(1);
	}
	fread(shellcode, 1, fsize, f);
	shellcode();
	}
