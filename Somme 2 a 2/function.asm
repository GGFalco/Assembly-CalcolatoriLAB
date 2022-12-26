.586
.model flat
.code

_somme_2a2 proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
	; Corpo Funzione		(v,dest,lunghezza)
						mov ebx, dword ptr[ebp + 8]
						mov ecx, dword ptr[ebp + 12]
						mov esi, 0
						mov edi, 0
			Ciclo:
						cmp esi, dword ptr[ebp + 16]
						je Fine
						mov eax, dword ptr[ebx + esi*4]
						inc esi
						add eax, dword ptr[ebx + esi*4]
						inc esi
						mov dword ptr[ecx + edi*4], eax
						inc edi
						jmp Ciclo
			Fine:
	; Fine Funzione
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_somme_2a2 endp
end