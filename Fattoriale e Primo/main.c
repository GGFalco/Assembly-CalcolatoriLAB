#include <stdio.h>

int fattoriale(int n);
int fattorialeNoMul(int n);
int primo(int n);
int primoNoDiv(int n);

int main(void) {
	int res = fattoriale(3);
	int res2 = fattorialeNoMul(3);
	int ret = primo(8); // 1 Primo - 0 Non Primo
	int ret2 = primoNoDiv(8);
 	printf("Risultato: %d\nRisultato2: %d\nPrimo: %d\nPrimo2: %d", res, res2, ret, ret2);
}