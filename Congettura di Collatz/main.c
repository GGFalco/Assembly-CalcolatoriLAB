#include <stdio.h>

int Collatz(int num, char* printf);

int main(void) {
	int num = 11;
	char s[255];
	Collatz(num, s);
	printf("Numero: %d\nCollatz: %s", num, s);
}