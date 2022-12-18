.586
.model flat
.code

_inttostr proc
push ebp
mov ebp ,esp
push esi
push edi
push ebx
push edx
	; Corpo Funzione				(dest, numero)
									mov ebx, dword ptr[ebp + 8]
									mov eax, dword ptr[ebp + 12]
									call lunghezza2					; in edi lunghezza
									mov byte ptr[ebx + edi], 0		; 0 termino la stringa
									dec edi
									mov esi, 0
					Ciclo:
									cmp edi, 0
									jl Fine
									CDQ
						push esi
									mov esi, 10
									idiv esi
						pop esi
									add dl, 48
									mov byte ptr[ebx + edi], dl
									dec edi
									jmp Ciclo
					Fine:
	; Fine Funzione
pop edx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_inttostr endp

lunghezza2 proc
push eax
push esi
				mov eax, dword ptr[ebp + 12]
				mov edi, 0
				mov esi, 10
		Ciclo:
				CDQ
				idiv esi
				cmp eax, 0
				je Fine
				inc edi
				jmp Ciclo
		Fine:
				inc edi
pop esi
pop eax
ret
lunghezza2 endp

end