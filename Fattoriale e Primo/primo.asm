.586
.model flat
.code

_primo proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione
							mov eax, dword ptr[ebp + 8]			; N
							mov esi, 2

				Ciclo:
							cmp esi, eax
							je Primo
							CDQ
							idiv esi
							mov eax, dword ptr[ebp + 8]
							cmp edx, 0
							je NonPrimo
							inc esi
							jmp Ciclo
				NonPrimo:
							mov eax, 0
							jmp Fine
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
_primo endp
end