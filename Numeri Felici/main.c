#include <stdio.h>

//	Partiamo da un numero e lo sostiuiamo con la somma dei quadrati delle sue cifre, ripetiamo il processo finchè non otteniamo 1, se otteniamo 4 il numero è infelice
int Felice(unsigned int num);

int main(void) {
	int ret = Felice(7);
	printf("Ritorno: %d\nFelice: 1\nInfelice: 0", ret);
}