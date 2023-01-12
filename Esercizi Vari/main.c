#include <stdio.h>

void copiaStringaLimitato(char* dst, char* src, int n);
int ConfrontaStringa(char* prima, char* seconda);
void ConcatenaStringa(char* dst, char* src);
void ConcatenaStringaLimitata(char* dst, char* src, int n);
void InvertiStringa(char* src);
void signedToString(char* dst, int num);
void StringToSigned(int *num, char* dst);

int main(void) {

	char src[255] = "ciao";	
	char dst[255];
	int limit = 3;
	copiaStringaLimitato(dst, src, limit);
	printf("[Copia Stringa Limitato]\n");
	printf("Source: \"%s\"\nDest:   \"%s\"\nLimite: %d\n", src, dst, limit);

	char prima[255] = "ciao";
	char seconda[255] = "ciao";
	int ret = ConfrontaStringa(prima, seconda);
	printf("\n[Confronto Stringhe]\nPrima:   \"%s\"\nSeconda: \"%s\"\nRitorno: %d", prima, seconda, ret);

	char source[255] = "def";
	char dest[255] = "abc";
	ConcatenaStringa(dest, source);
	printf("\n\n[Concatena Stringa]\nSource: \"%s\"\nDest:   \"%s\"", source, dest);
	int limite = 1;

	char source2[255] = "456";
	char dest2[255] = "123";
	ConcatenaStringaLimitata(dest2, source2, limite);
	printf("\n\n[Concatena Stringa Limitata]\nSource: \"%s\"\nDest:   \"%s\"\nLimite: %d", source2, dest2, limite);

	char invertire[255] = "ciao";
	printf("\n\n[Inverti Stringa]\nStringa: \"%s\"", invertire);
	InvertiStringa(invertire);
	printf("\nInvert:  \"%s\"", invertire);

	int num = 123;
	char destination[255];
	signedToString(destination, num);
	printf("\n\n[Signed to String]\nNumero: %d\nStringa: \"%s\"", num, destination);


	int num2[1] = { 0 };
	char numero[255] = "-123";
	StringToSigned(&num2, numero);
	printf("\n\n[String To Signed]\nStringa: \"%s\"\nNumero: %d\n", numero, num2[0]);

}