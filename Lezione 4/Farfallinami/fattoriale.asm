.586
.model flat
.code

_fattoriale proc
push ebp
mov ebp, esp
push edi
push esi
push ebx
push ecx
	; Corpo funzione
					mov esi, 0
					mov ecx, 0
					mov eax, dword ptr[ebp + 8]		; N
					mov ebx, dword ptr[ebp + 8]		; N
		Ripeti:	sub ebx, 1						; N -1 
					cmp ebx, 1
					je Fine
					call prodotto
					jmp Ripeti
			Fine:
	; Fine funzione
pop ecx
pop ebx
pop esi
pop edi
mov esp, ebp
pop ebp
ret
_fattoriale endp


prodotto proc
push esi
			mov ecx, eax		; N
			mov eax, 0
	Ciclo:
			cmp esi, ebx		; N - 1
			je Fine
			inc esi
			add eax, ecx
			jmp Ciclo
	Fine:
pop esi
ret
prodotto endp
end
