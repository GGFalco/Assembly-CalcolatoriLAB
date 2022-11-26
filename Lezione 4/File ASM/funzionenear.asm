.586
.model flat
.code

_sommalung2 proc
	
	push ebp
	mov ebp, esp
	push esi
	push ebx
	push edi

		mov ebx, dword ptr[ebp+8]
		call strlun
		mov esi, eax


		mov ebx, dword ptr[ebp+12]
		call strlun
		add eax, esi

	pop edi
	pop ebx
	pop esi
	mov esp, ebp
	pop ebp
	ret
_sommalung2 endp


strlun proc
; stringa in ebx
; lunghezza in eax
; ESI e EDI devono essere ripristinati
push edi
push esi
	mov esi, 0
	mov edi, 0
	mov eax, 0
	Ciclo: 
			mov al, byte ptr[ebx+edi]
			cmp al, 0
			je FineCiclo
			inc edi
			jmp Ciclo
	FineCiclo:
			mov eax, edi

pop esi
pop edi
ret
strlun endp
end