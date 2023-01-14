#include <stdio.h>

int contaconsonanti(char* v, int* aggiuntivo);

int main(void) {
	char v[] = "abc";
	int ret;
	int aggiuntivo;
	ret = contaconsonanti(v, &aggiuntivo);
	printf("consonanti=%d, minuscole=%d\n", ret, aggiuntivo);
}