#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int* somme_2a2(int* vett,int * dest, size_t size);

int main(void) {

	int v[] = { 3,87,5,7,12,9};
	int* dest = calloc( sizeof(v) / sizeof(v[0]) , sizeof(int));
	size_t size = sizeof(v) / sizeof(v[0]);
	somme_2a2(v, dest, size);
	printf("Vettore: ");
	for (size_t i = 0; i < size; i++) {
		printf("%d ", v[i]);
	}
	printf("\nRisultato: ");
	for (size_t i = 0; i < (size / 2); i++) {
		printf("%d ", dest[i]);
	}

}