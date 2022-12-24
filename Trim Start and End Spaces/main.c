#include <stdio.h>

void TrimSpaces(char* s, char * dest);

int main(void) {
	char s[255] = "  ciao parola ";
	char dest[255];
	printf("Stringa con spazi \"%s\"\n", s);
	TrimSpaces(s,dest);
	printf("Stringa senza spazi \"%s\"", dest);
}