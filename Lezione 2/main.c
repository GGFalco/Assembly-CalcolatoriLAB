#include <stdio.h>
#include <string.h>

//int main(void) {
//	unsigned int a = 1;
//	unsigned int b = 3;
//	__asm {					// a > 0 ??
//
//			mov eax, a
//			cmp eax, 0		
//			jbe else
//			mov ebx, 1		// then block
//			mov dword ptr[b], ebx
//			jmp Fine
//		else:				// else block
//			mov ebx, 2
//			mov b, ebx
//		Fine:
//	}
//	printf("b: %u\na: %u", b,a);  // N.B unsigned int 
//
//}


//int main(void) {
//
//	unsigned int i = 0; unsigned int s = 0; unsigned int n = 3;
//
//	__asm {		// Somma dei numeri fino a n = 3
//		mov esi,i
//		mov ebx,0
//		mov ecx,n
//		condizione:
//		cmp esi,ecx
//		ja fine
//		add ebx, esi
//		mov s,ebx
//		add esi,1    
//		jmp condizione
//		fine:
//	}
//
//	printf("La somma è: %d", s);
//}

//int main(void) {
//
//	int a = 5; int b = 9; int c;
//	__asm {				// Metto in c il più grande tra a e b
//		mov eax, a
//		mov ebx, b
//		cmp eax,ebx
//		jl else
//		mov c,eax		// then block
//		jmp fine
//		else:			// else block
//		mov c,ebx
//		fine:
//	}
//	printf("Il maggiore e': %d", c);
//}

//int main(void) {
//
//	int a[10] = { 1,2,3,4,5,6,7,8,9,10 };
//	int* p = &a[0];
//	int s = 0;
//	__asm {	 // La somma del vettore
//		
//		mov ebx,p   // prima posizione vettore
//		mov esi,0	// indice
//		mov eax,10  // lunghezza vettore
//		mov ecx,0	// somma
//		condizione:
//		cmp esi,eax
//		je fine		// finiti gli elementi interrompo
//		add ecx, dword ptr[ebx + esi * 4]
//		mov s,ecx	// sommo
//		add esi, 1	// incremento i
//		jmp condizione  // loop
//		fine:
//	}
//	printf("La somma e': %d", s);
//}

//int main(void) {
//
//	int c; char s[255] = "la parola cringe non esiste";
//	char *p = &s[0];
//	__asm {
//
//		mov ebx,p		// prima posizione vettore
//		mov esi,0		// indice del vettore
//		condizione:
//		mov al, byte ptr[ebx + esi * 1]		// carattere della stringa 
//		cmp al,0		// controllo se è il terminatore
//		je fine
//		inc esi			// incremento l'indice
//		mov c, esi		// conto i caratteri
//		jmp condizione	// loop
//		fine:
//	}
//	printf("La lunghezza e': %d\nRisultato esatto: %d", c, strlen(s));
//}

//int main(void) {
//
//	unsigned int a = 2; unsigned int b = 3; unsigned int s = 0;
//
//	__asm {		// Prodotto tra due numeri unsigned
//		mov eax,a
//		mov ebx,b
//		mov esi,0
//		condizione:
//		cmp esi,ebx
//		je fine
//		add ecx,eax
//		inc esi
//		jmp condizione
//			fine:
//		mov s,ecx
//	}
//	printf("Il prodotto tra %d e %d e': %d", a, b, s);
//}
//
//int main(void) {
//
//	int a = -3; int b = 3; int s = 0;
//
//	__asm {		// Prodotto tra due numeri signed
//		mov eax, a
//		mov ebx, b
//		mov esi, 0
//		
//		cmp eax,0
//		jg apos // a > 0
//		cmp ebx,0
//		jg bpos	// b > 0
//				// a e b minori di 0
//		neg	eax	// nego a e b e li tratto come unsigned
//		neg ebx
//		condizione:   // li tratto come a > 0 e b > 0
//			cmp esi,ebx
//			je fine
//			add ecx, eax
//			inc esi
//			mov s, ecx
//			jmp condizione
//		apos:   // a > 0 e b non lo so ancora
//			cmp ebx,0
//			jg condizione // se b > 0 ritorno a condizione
//			neg ebx
//		condizione2:      // qua tratto a > 0 e b < 0 avendolo negato prima
//			cmp esi, ebx
//			je fine2
//			add ecx, eax
//			inc esi
//			mov s, ecx
//		jmp condizione2
//
//		bpos:	// b > 0 e a < 0
//			cmp eax, 0	// devo negare a ed andare a fine2
//			jg condizione // se a > 0 torno a condizione
//			neg eax
//		jmp condizione2
//
//			fine2: neg s	// a > 0 && b < 0 || a < 0 e b >0
//			fine :	// a > 0 && b > 0
//		
//	}
//	printf("Il prodotto tra %d e %d e': %d", a, b, s);
//}

