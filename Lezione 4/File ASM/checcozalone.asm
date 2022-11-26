.586
.model flat
.code

_sommalung proc
	
	push ebp
	mov ebp,esp
	push esi
	push edi
	push ebx
	

		mov ebx, dword ptr [ebp+8]  ; Puntatore al primo carattere della prima stringa
		mov esi, 0 

		Ciclo:
				mov al, byte ptr[ebx + esi]
				cmp al, 0
				je FineCiclo
				inc esi
				jmp Ciclo
		FineCiclo:


		mov ebx, dword ptr [ebp+12]
		mov edi, 0

		Ciclo2:
				mov al, byte ptr[ebx+edi]
				cmp al, 0
				je FineCiclo2
				inc edi
				jmp Ciclo2
		FineCiclo2:
		add esi, edi
		mov eax, esi

	pop ebx
	pop edi
	pop esi
	mov esp, ebp
	pop ebp
	ret	

_sommalung endp
end


