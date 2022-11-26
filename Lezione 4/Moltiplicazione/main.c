#include <stdio.h>

unsigned int moltiplica(unsigned char a, unsigned char b);
int moltiplicasigned(int a, int b);

int main(void) {

	unsigned char a = 3;
	unsigned char b = 2;
	unsigned char res = moltiplica(a, b);
	int c = -3;
	int d = 2;
	int res2 = moltiplicasigned(c, d);
	printf("Risultato unsigned: %d\nRisultato signed: %d", res, res2);

}