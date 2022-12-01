#include <stdio.h>

int gaus(int* v, int lunghezza, int* media, int* var);


int main(void) {
	int v[10] = { 1,2,3,4,5,6,7,8,-5,9 };
	int media_intera = 0;
	int varianza_intera = 0;

	gaus(v, 10, &media_intera, &varianza_intera);
	printf("Media %d\nVarianza %d", media_intera, varianza_intera);
}

//int main(void) {
//	char v[10] = { 1,2,3,4,5,6,7,8,-5,9 };
//	int num_pari = 0;
//	num_pari = contapari(v, 10);
//	printf("%d", num_pari);
//}