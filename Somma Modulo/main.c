#include <stdio.h>

int somma_modulo(int* src, int lunghezza, int* dst, int divisore);

int main(void) {

	//int src[10] = { 1,2,3,4,57,-1,-2,-3,-46,-55 };
	int src[10] = { 1,1,1,1,1,1,1,1,1,1};
	int dst[10];
	int divisore = -5;
	int ret = somma_modulo(src, 10, dst, divisore);
	if (ret != -1 && ret != -2) {
		printf("Somma: %d\nVettore dei resti: [", ret);
	}
	else if (ret == -1) {
		printf("Tutti i numeri sono divisibili per %d\n", divisore);
	}
	else {
		printf("Tutti i numeri NON sono divisibili per %d\n", divisore);
	}
	for (int i = 0; i < 9; i++) {
		printf("%d, ", dst[i]);
	}
	printf("%d]", dst[9]);
}