#include <stdio.h>

int main(void) {	// Max e Min di un vettore signed e unsigned

	int a[] = { -1,-2 };
	int b = &a[0]; int max = 0;
	__asm {

		mov ebx,b
		mov esi,0
		mov ecx,  dword ptr[ebx]
		while:
			cmp esi, 2
			je fine
			inc esi
			cmp ecx, dword ptr [ebx + esi*4]
			jg while  // ecx > prox
			mov ecx, dword ptr [ebx + esi*4] // ho trovato il nuovo grande
			jmp while
		fine:
			mov max,ecx
	}
	printf("Il massimo e' %d", max);
}