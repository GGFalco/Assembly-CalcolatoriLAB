#include <stdio.h>

int TitleCase(char* s);

int main(void) {
	char s[255] = "casa tavolo luce!";
	TitleCase(s);
	printf("Stringa: %s", s);
}