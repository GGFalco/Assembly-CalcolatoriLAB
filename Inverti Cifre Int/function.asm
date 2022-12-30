.586
.model flat
.code

_Inverti proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione
								mov eax, dword ptr[ebp + 8]			; numero
								mov edx, 0							; azzero
								mov esi, 10
								mov edi, 0
								mov ecx, 0
				Ciclo:
								CDQ
								idiv esi
								add ecx, edx
								cmp eax, 0
								je Fine
						push eax
								mov eax, 0
								add eax, ecx
								mov edx, 0
								imul esi
								mov ecx, eax
						pop eax
								jmp Ciclo
				Fine:
								mov eax, ecx
	; Fine Funzione			
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_Inverti endp
end