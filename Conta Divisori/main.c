#include <stdio.h>

int ContaDivisori(int num, int max, int *divisori);

int main(void) {
	int num = 20;
	int max = 100;
	int divisori[255];
	ContaDivisori(num, max, divisori);

	printf("Num: %d\nMax: %d\nDivisori: {", num, max);
	int i;
	if (max >= num) {
		for (i = 0; divisori[i] != num; i++) {
			printf("%d, ", divisori[i]);
		}
		printf("%d}", divisori[i]);
		return;
	}
	for (i = 0; divisori[i] != 0; i++) {
		if (divisori[i + 1] != 0) {
			printf("%d, ", divisori[i]);
		}
		else {
			printf("%d", divisori[i]);
		}
	}
	printf("}");
	
}