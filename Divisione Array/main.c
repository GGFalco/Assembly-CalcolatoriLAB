#include <stdio.h>

divisione_array(int* src, int divisore, int lunghezza, int* resto);

int main(void) {

	int v[3] = { 1,2,3};
	int resto[3];
	int ret = divisione_array(v, 3, 3, resto);
	printf("Vettore con i risultati: [");
	for (int i = 0; i < 2; i++) {
		printf("%d, ", v[i]);
	}
	printf("%d]\nIl vettore dei resti e: [", v[2]);
	for (int i = 0; i < 2; i++) {
		printf("%d, ", resto[i]);
	}
	printf("%d]\nRitorno: %d", resto[2], ret);
}