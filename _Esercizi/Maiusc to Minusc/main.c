#include <stdio.h>

int main(void) {
	char s[] = "ciao";
	char* b = &s[0];
	__asm {
		mov ebx, b
		mov esi, 0
		Ciclo:
		cmp esi, 4
		je Fine
		mov al, byte ptr[ebx+esi]
		cmp al, 'a'
		jb Maiuscola
		cmp al, 'z'
		ja Maiuscola
		add al, 'A' - 'a'
		mov byte ptr[ebx+esi], al
		inc esi
		jmp Ciclo

		Maiuscola:
		inc esi
		jmp Ciclo
		Fine:
	}

	printf("%s", s);
}