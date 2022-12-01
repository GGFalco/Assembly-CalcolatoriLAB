#include <stdio.h>

//int main(void) {
//	
//	int a, b, c;
//	a = 5; b = 7;
//	__asm {   // Somma a + b
//
//		mov eax,a    // mov dest,src - Sposto il contenuto di src in dest
//		mov ebx,b
//		add ebx,eax  // add dest,src - dest = dest + src
//		mov c,ebx
//	}
//	printf("%d",c);
//}
//
//int main(void) {
//
//	int a[5] = { 1,2,3,4,5 };
//	int* b = &a[0];  // Indirizzo del primo elemento del vettore
//	int c;
//	__asm {   // Somma primi due elementi
//
//		mov ebx, b
//		mov eax, dword ptr[ebx]	
//		add eax, dword ptr[ebx + 4]
//		mov c, eax
//
//	}
//	printf("%d", c);
//}

//int main(void) {
//
//	int a[5] = { 1,2,3,4,5 };
//	int* b = &a[0];  // Valore di c nell'ultima posizione del vettore
//	int c;
//	__asm {
//
//		mov ebx,b
//		mov esi,0 // 0 indice
//		mov ecx, dword ptr [ebx+esi*4]
//		mov esi,2 // 2 indice
//		add ecx, dword ptr [ebx+ esi*4] // a[0] + a[2] - 1 + 3 = 4
//		mov c, ecx
//
//		mov esi,4 // 4 indice
//		mov dword ptr [ebx + esi*4], ecx
//	}
//	printf("%d", a[4]);
//}

int main(void) {

	char a[255] = "ciao mamma";
	char* b = &a[0];				                        // RICORDA i puntatori sono sempre a 32 BIT
	__asm {       // Il quarto carattere diventa maiuscolo
		
		mov ebx,b // sono nell'indice 0
		add ebx, 3 // quarto carattere
		add byte ptr [ebx], 'A' - 'a'
	}
	printf("%s", a);
}