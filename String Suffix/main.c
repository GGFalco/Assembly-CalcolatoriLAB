#include <stdio.h>

void StringSuffix(char* str, char* suffix);

int main(void) {
	char str[255] = "Stringa Originale";
	char suffix[255] = "#";
	printf("Stringa di partenza: %s\n", str);
	StringSuffix(str, suffix);
	printf("Suffisso: %s\nRisultato: %s", suffix, str);

}