.586
.model flat
.code

_conta_parole proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione    (stringa)
							mov esi, 0
							mov eax, 1
							mov ebx, dword ptr[ebp + 8]

				Ciclo:
							cmp byte ptr[ebx + esi], 0
							je Fine
							cmp byte ptr[ebx + esi], ' '
							je Conta
							inc esi
							jmp Ciclo
				Conta:
							inc eax
							inc esi
							jmp Ciclo
				Fine:
	; Fine Funzione	
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_conta_parole endp
end
