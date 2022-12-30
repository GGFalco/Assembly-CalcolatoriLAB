#include <stdio.h>

int Converti(int num, char* s);

int main(void) {
	int num = 8;
	char s[255];
	Converti(num, s);
	printf("Decimale: %d\nBinario: %s", num, s);
}