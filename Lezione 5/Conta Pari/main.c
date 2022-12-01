#include <stdio.h>

int contapari(char* v, int lunghezza);

int main(void) {
	char v[10] = { 1,2,2};
	int num_pari = 0;
	num_pari = contapari(v, 3);
	printf("Nel vettore ci sono %d numeri pari", num_pari);
}