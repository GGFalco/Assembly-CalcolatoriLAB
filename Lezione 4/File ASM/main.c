#include <stdio.h>

int sommalung(char* s1, char* s2);
int sommalung2(char* s1, char* s2);

int main(void) {

	char s1[255] = "ciao";
	char s2[255] = "ciao";
	int len = 0; int len2 = 0;
	len = sommalung(s1, s2);
	len2 = sommalung2(s1, s2);
	printf("Prima lunghezza: %d\nSeconda lunghezza: %d", len,len2);

}
