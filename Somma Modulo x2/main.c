#include <stdio.h>
#include <stdlib.h>

int SommaModuli(int* src, int lunghezza, int* dst, int divisore);

int main(void) {

	int src[10] = { 1,2,3,4,57,-1,-2,-3,-46,-55 };
	int dst[10];
	int somma = SommaModuli(src, 10, dst, -5);
	printf("Dest: ");
	for (int i = 0; i < sizeof(dst)/ sizeof(int) ; i++) {
		printf("%d ", dst[i]);
	}
	printf("\nSomma: %d", somma);
}