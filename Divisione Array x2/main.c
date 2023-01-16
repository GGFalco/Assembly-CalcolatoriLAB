#include <stdio.h>
#include <stdint.h>

int DivisioneArray(int* src, int divisore, int lunghezza, int* resto);

int main(void) {
	int v[3] = { 1,2,3 };
	int resto[3]; 
	int divisore = 3;
	printf("Vettore: ");
	for (int i = 0; i < sizeof(v)/sizeof(int); i++) {
		printf("%d ", v[i]);
	}
	printf("\nNewVect: ");
	int ret = DivisioneArray(v, divisore, 3, resto);
	for (int i = 0; i < sizeof(v)/sizeof(int); i++) {
		printf("%d ", v[i]);
	}
	printf("\nResto: ");
	for (int i = 0; i < sizeof(v) / sizeof(int); i++) {
		printf("%d ", resto[i]);
	}
	printf("\nRitorno: %d", ret);
}	