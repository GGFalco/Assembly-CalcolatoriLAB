#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int OrdinaParole(char* s, char* dst);

int main(void) {
	char s[255] = "ciao bello a";
	char dst[255];
	OrdinaParole(s, dst);
	printf("Stringa: %s\nParole in ordine: %s", s, dst);

}