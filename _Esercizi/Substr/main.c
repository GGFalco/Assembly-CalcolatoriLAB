#include <stdio.h>

int main(void) {
	
	char str[] = "ciao cane";
	char sub[] = "cane";
	char* a = &str[0];
	char* b = &sub[0];
	int c = 0;
	__asm {
		mov eax, a
		mov ebx, b
		mov ecx, 0
		mov esi, 0
		mov edi, 0
		mov cl, byte ptr[eax + esi]
		mov dl, byte ptr[ebx + edi]

		Ciclo:
		cmp cl, 0
		je Fine
			mov cl, byte ptr[eax+esi]

				cmp edi, 4
				je Trovata
				mov dl, byte ptr[ebx+edi]
				cmp cl, dl
				jne Ripristino
				inc edi

		inc esi
		jmp Ciclo

			Ripristino :
			mov edi, 0 // contatore substr
			inc esi
			jmp Ciclo

		Trovata:
			CicloT:
			cmp edi, 0
			je FineT
			sub edi, 1
			sub esi, 1
			jmp CicloT
				FineT:
			mov c, esi
		Fine:
	}

	printf("L'indice e': %d", c);
}