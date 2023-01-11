#include <stdio.h>

int numeri_nonprimi(unsigned char* src, unsigned char* dst, int size);

int main(void) {
	unsigned char s[3] = { 4,4,4};
	unsigned char dst[3];
	int ret = numeri_nonprimi(s, dst, 3);
	printf("Ritorno: %d", ret);
	printf("\nNumeri: {");
	for (int i = 0; i < 3; i++) {
		printf("%d ", s[i]);
	}
	printf("}\nDest:   {");
	for (int i = 0; i < 3; i++) {
		printf("%d ", dst[i]);
	}
	printf("}");
}