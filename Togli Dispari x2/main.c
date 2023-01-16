#include <stdio.h>
#include <stdlib.h>

int TogliDispari(unsigned char* src, int lunghezza);

int main(void) {
	unsigned char s[6] = { 2,3,4,4,5,8 };
	printf("Vettore: ");
	for (int i = 0; i < sizeof(s) / sizeof(unsigned char); i++) {
		printf("%d ", s[i]);
	}
	int ret = TogliDispari(s, 6);
	printf("\nNewVect: ");
	for (int i = 0; i < sizeof(s) / sizeof(unsigned char) ; i++) {
		printf("%d ", s[i]);
	}
	printf("\nRitorno: %d", ret);
}