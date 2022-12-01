#include <stdio.h>

// Sostituire nella stringa s1 tutte le vocali con v solo se v è una vocale
// la sostituzione non modifica s1, ma la stringa risultante va copiata in s2
int farfallinami(char* s1, char* s2, char v);

	
// concatena s1 e s2 e mette il risulato in s3 a seconda della modalità scelta
// mode = 0 s2 viene preposta a s1 (prendo s2 e concateno s1) 
// mode = 1 s1 viene preposta a s2 (prendo s1 e concateno s2)
// mode = 3 la prima metà di s1 viene preposta alla prima metà di s2 (sottrarre per vedere quale è la metà)
int concatena(char* s1, char* s2, char * s3, int mode);

// calcola n! ESEGUIRLO CON NUMERI PICCOLI
int fattoriale(unsigned int n);

//int main(void) {
//
//	char s1[255] = "chiu";
//	char s2[255];
//	char v = 'a';
//	farfallinami(s1, s2, v);
//	printf("%s", s2);
//}

//int main(void) {
//
//	char s1[255] = "abcd";
//	char s2[255] = "efgh";
//	char s3[255];
//	concatena(s1, s2, s3, 3);
//	printf("%s", s3);
//}

int main(void) {
	
	unsigned int fat = fattoriale(3);
	printf("%d", fat);
}