#include <stdio.h>

int conta_parole(const char* s);

int main(void) {
	char s[255] = "questa 2";
	int ret = conta_parole(s);
	printf("La stringa \"%s\" ha %d parole", s, ret);

}