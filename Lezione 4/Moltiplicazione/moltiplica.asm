.586
.model flat
.code


_moltiplica proc
	
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx
	push ecx
		; Corpo Funzione
			
			mov ebx, 0 ; azzero il registro e riempio gli 8 bit meno significativi
			mov bl, byte ptr [ebp + 8]
			mov ecx, 0 ; ; azzero il registro e riempio gli 8 bit meno significativi
			mov cl, byte ptr [ebp + 12]
			mov esi, 0
			mov eax, 0
			Ciclo:
				cmp esi, ecx
				je FineCiclo
				add al, bl
				inc esi
				jmp Ciclo
			FineCiclo:

		; Fine Funzione
	pop ecx
	pop ebx
	pop edi
	pop esi
	mov esp, ebp
	pop ebp
	ret



_moltiplica endp


end