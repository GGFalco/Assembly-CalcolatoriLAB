#include <stdio.h>

int SubStr(char* src, char* sub);

int main(void) {
	char src[255] = "mamma come va?";
	char sub[255] = "mamma";
	int ret = SubStr(src, sub);
	printf("Stringa: %s\nParola da cercare: %s\nReturn: %d", src, sub, ret);
	// Ritorniamo l'indice della prima occorrenza della parola che cerchiamo
}