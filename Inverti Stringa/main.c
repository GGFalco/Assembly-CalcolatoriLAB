#include <stdio.h>

void inverti(char* str);

int main(void) {   
	char str[255] = "ciao cari2";
	inverti(str);
	printf("%s", str);
}