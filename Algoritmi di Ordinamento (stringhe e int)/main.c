#include <stdio.h>


void BubbleSort(int* v, int lunghezza);

int main(void) {
	int v[3] = { 1,2,3};
	int size = 3;
	BubbleSort(v, size);
	for (int i = 0; i < size; i++) {
		printf("%d ", v[i]);
	}
}