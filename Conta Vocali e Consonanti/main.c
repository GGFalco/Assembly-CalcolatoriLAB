#include <stdio.h>

int conta_vocali_consonanti(unsigned char* src, int* dstV, int* dstC);

int main(void) {
	char src[255] = "CiAo Mamma 123"; 
	//char src[255] = "123 "; 
	int dstV = 0;
	int dstC = 0;
	int ret = conta_vocali_consonanti(src, &dstV, &dstC);
	printf("Stringa %s\nVocali: %d\nConsonanti: %d\nRitorno: %d", src, dstV, dstC, ret);
}