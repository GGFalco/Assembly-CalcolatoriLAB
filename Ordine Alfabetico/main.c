#include <stdio.h>

void ordina(char* source, char* dest);

int main(void) {
	char s[255] = "fedcba abcdef";
	char dest[255];
	ordina(s, dest);
	printf("\"%s\"", dest);

}