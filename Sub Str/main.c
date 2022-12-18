#include <stdio.h>

int substr(char* str, char* find);

int main(void) {
	char str[255] = "Ciao come stai?";
	char find[255] = "z";
	int ret = substr(str, find);	// Ritornare l'indice della prima occorrenza trovata (CASE SENSITIVE) altrimenti ritorna -1
	printf("Ritorno: %d", ret);
}