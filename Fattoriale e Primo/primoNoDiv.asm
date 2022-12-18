.586
.model flat
.code


_primoNoDiv proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione
						mov eax, dword ptr[ebp + 8]		; N
						mov esi, 2
			Ciclo:
						cmp esi, eax
						je Primo
						call divisione
						cmp eax, 0
						je Fine							; Non è primo
						inc esi
						jmp Ciclo
			Primo:
						mov eax, 1
						jmp Fine
			Fine:
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_primoNoDiv endp

divisione proc
push ecx	
				mov ecx, eax
		Ciclo:
				cmp ecx, 0
				je NonPrimo
				cmp ecx, 0
				jl Fine
				sub  ecx, esi
				jmp Ciclo
		NonPrimo:
				mov eax, 0
				jmp Fine
		Fine:
pop ecx
ret
divisione endp
end