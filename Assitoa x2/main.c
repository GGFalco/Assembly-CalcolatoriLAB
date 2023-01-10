#include <stdio.h>

int AssiToA(int src, int sgn, char* stringa);

int main(void) {
	char src[255];
	int num = -123;
	int ret = AssiToA(num, 0, src);
	printf("Numero: %d\nStringa: \"%s\"\nRitorno: %d", num, src, ret);
}