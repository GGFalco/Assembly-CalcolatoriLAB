#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int OrdinaVettore(int* v, int lunghezza);

int main(void) {

	int v[] = { 3,4,-1,7,9,3 };
	int lunghezza = sizeof(v) / sizeof(v[0]);
	printf("Vettore non Ordinato: ");
	for (int i = 0; i < lunghezza; i++) {
		printf("%d ", v[i]);
	}
	int max = OrdinaVettore(v, lunghezza);
	printf("\nVettire Ordinato: ");
	for (int i = 0; i < lunghezza; i++) {
		printf("%d ", v[i]);
	}
	printf("\nIl max: %d", max);
}