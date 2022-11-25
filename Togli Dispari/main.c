#include <stdio.h>

int togli_dispari(unsigned char* src, int lunghezza);

int main(void) {

	unsigned char src[6] = { 1,1,1,1,1,1 };
	int ret = togli_dispari(src, 6);
	printf("Il vettore e: [");
	for (int i = 0; i < 5; i++) {
		printf("%d, ", src[i]);
	}
	printf("%d]\nRitorno: %d", src[5], ret);
}