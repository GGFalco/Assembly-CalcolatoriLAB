#include <stdio.h>

int strtoint(char* s);
void inttostr(char* dest, int num);

int main(void) {
	char src[255] = "42";
	int num = strtoint(src);
	char dest[255];
	inttostr(dest, num);
	printf("Numero: %d\nStringa: \"%s\"", num,dest);	
}