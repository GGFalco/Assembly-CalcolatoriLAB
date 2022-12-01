#include <stdio.h>

int main(void) {

	char s[] = "aeiou";
	char* b = &s[0];
	int vocali = 0;

	__asm {
		mov ebx, b
		mov esi, 0
		mov ecx, 0
		Ciclo:
		cmp esi, 5
		je fine
		mov al, byte ptr[ebx + esi]
			cmp eax, 'a'
			je conta
			cmp eax, 'A'
			je conta
			cmp eax, 'e'
			je conta
			cmp eax, 'E'
			je conta
			cmp eax, 'i'
			je conta
			cmp eax, 'I'
			je conta
			cmp eax, 'o'
			je conta
			cmp eax, 'O'
			je conta
			cmp eax, 'u'
			je conta
			cmp eax, 'U'
			je conta
		inc esi
		jmp Ciclo

		conta:
		inc ecx
		jmp Ciclo
		fine:
		mov vocali, ecx
	}

	printf("Le vocali sono: %d", vocali);
}