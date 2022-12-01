#include <stdio.h>

int main(void) {

	char s[] = "ca";
	char* b = &s[0];
	int consonanti = 0;

	__asm {
		mov ebx, b
		mov esi, 0
		mov ecx, 0
		Ciclo:
		cmp esi,2
		je fine
		mov al, byte ptr[ebx + esi]
			cmp eax, 'a'
			je Vocale
			cmp eax, 'A'
			je Vocale
			cmp eax, 'e'
			je Vocale
			cmp eax, 'E'
			je Vocale
			cmp eax, 'i'
			je Vocale
			cmp eax, 'I'
			je Vocale
			cmp eax, 'o'
			je Vocale
			cmp eax, 'O'
			je Vocale
			cmp eax, 'u'
			je Vocale
			cmp eax, 'U'
			je Vocale
		inc esi
		inc ecx
		jmp Ciclo

		Vocale:
		inc esi
		jmp Ciclo
		fine:
		mov consonanti, ecx
	}

	printf("Le vocali sono: %d", consonanti);
}