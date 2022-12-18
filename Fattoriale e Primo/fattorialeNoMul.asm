.586
.model flat
.code


_fattorialeNoMul proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione
							mov eax, dword ptr[ebp + 8]		; N
							mov ebx, eax					; N - 1
							dec ebx
				Ciclo:
							cmp ebx, 1
							je Fine
							call prodotto
							dec ebx
							jmp Ciclo
				Fine:			
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_fattorialeNoMul endp

prodotto proc
push ecx
				mov ecx, eax
				mov esi, 1
		Ciclo:
				cmp esi, ebx
				je Fine
				add eax, ecx
				inc esi
				jmp Ciclo
		Fine:
pop ecx
ret
prodotto endp
end