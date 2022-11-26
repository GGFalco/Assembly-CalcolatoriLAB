#include <stdio.h>

int strlun(char* s);
int SommaAscii(char* s, int* p);
int toUpper(char* s);

int main(void) {

	char s[255] = "ciao";
	int p = 0;
	SommaAscii(s, &p);
	toUpper(s);
	printf("La stringa e lunga %d\n\nLa somma Ascii e' %d\n\nLa stringa MAIUSC: %s", strlun(s),p,s);
	
}

__declspec (naked) int toUpper(char* s) {

	__asm {
		push ebp
		mov ebp,esp
		push esi
		push edi
		push ebx
		push ecx
		// Corpo
			mov ebx, dword ptr[ebp+8]
			mov esi, 0
			
			Ciclo:
			mov cl, byte ptr[ebx + esi] // indirizzo primo carattere
			cmp cl, 0 // carattere
			je fine
			
			cmp cl, 'a'
			jb nominuscolo  // non è minuscolo
			cmp cl, 'z'
			ja nominuscolo
			add cl, 'A' - 'a'
			mov byte ptr[ebx+esi], cl // scrivo nella stringa
			inc esi
			jmp Ciclo

			nominuscolo:
			inc esi
			jmp Ciclo
			fine:			
		// Fine
		pop ecx
		pop ebx
		pop edi
		pop esi
		mov esp,ebp
		pop ebp
		ret

	}
}

__declspec (naked) int SommaAscii(char* s, int* p) {
	
	__asm {
		push ebp
		mov ebp, esp
		push esi
		push ebx
		push edi
		push ecx
		// Funzione
			mov ebx, dword ptr[ebp+8]
			mov esi,0
			mov eax,0
			Ciclo:
			mov cx, word ptr[ebx + esi] // indirizzo primo carattere
			cmp cx, 0
			je fine
			inc esi
			add ax, cx
			jmp Ciclo
				fine:	
			mov ebx, dword ptr[ebp+12] // vado in p
			mov word ptr [ebx], ax
		//Fine
		pop ecx
		pop edi
		pop ebx
		pop esi
		mov esp, ebp
		pop ebp
		ret
	}

}

__declspec (naked) int strlun(char* s) {
	
	__asm {
		push ebp
		mov ebp, esp
		push esi
		push edi
		push ebx
		push ecx
		//Corpo funzione
			mov ebx, dword ptr[ebp+8]

			mov esi, 0
			ciclo:
			mov cl, byte ptr[ebx + esi] // indirizzo primo carattere
			cmp cl, 0		// è il terminatore?
			je fine
			inc esi
			jmp ciclo

			fine:
			mov eax,esi
		// Fine corpo
		pop ecx
		pop ebx
		pop edi
		pop esi
		mov esp,ebp
		pop ebp
		ret
	}
}
