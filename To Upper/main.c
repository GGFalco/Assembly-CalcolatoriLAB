#include <stdio.h>

int ToUpper(char* s);

int main(void) {
	char s[255] = "ciao come va";
	printf("Stringa prima: %s\n", s);
	ToUpper(s);
	printf("Stringa dopo: %s", s);
}