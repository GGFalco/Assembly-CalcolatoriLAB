#include <stdio.h>

int assitoa(int src, int sgn, char* stringa);

int main(void) {
	char src[255];
	int num = -123;
	int ret = assitoa(num, 0, src);
	printf("Numero: %d\nRitorno: %d\nStringa: \"%s\"", num, ret, src);
}