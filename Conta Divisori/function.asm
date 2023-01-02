.586
.model flat
.code

_ContaDivisori proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione
						mov edi, dword ptr[ebp + 12]
						mov ecx, 1
						mov eax, dword ptr[ebp + 8]
						mov ebx, dword ptr[ebp + 16]
						mov esi, 0

			Ciclo:
						cmp ecx, edi
						je Fine
						CDQ
						idiv ecx
						cmp edx, 0
						je Divisore
						mov eax, dword ptr[ebp + 8]
						mov edx, 0
						inc ecx
						jmp Ciclo
			Divisore:
						mov dword ptr[ebx + esi*4], ecx
						inc esi
						inc ecx
						mov eax, dword ptr[ebp + 8]
						jmp Ciclo
			Fine:
						mov dword ptr[ebx + esi*4], 0
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_ContaDivisori endp
end