#include <stdio.h>

int main(void) { // Somma degli elementi maggiore di ogni elemento

	int a[] = { -1,-1,3 }; int b = &a[0]; int s;

	__asm {
		mov ebx, b
		mov esi, 0
		mov eax, 0
		mov ecx, 0
		calcolosomma:
			cmp esi,3
			je next
			add eax, [ebx + esi*4]
			inc esi
			jmp calcolosomma
		next:
			mov esi, 0
		controllo:
			cmp esi,3
			je fine // fine ciclo
			add ecx, [ebx + esi*4]
			inc esi
			cmp ecx,eax  
			jl controllo  // ecx < eax posso continuare
			dec esi
			sub ecx, [ebx + esi*4] // ecx > eax rimuovo l'ultimo elemento
			inc esi
			jmp controllo		  // e continuo a sommare
		fine:
			mov s, ecx
	}
	printf("La somma e': %d", s);
}