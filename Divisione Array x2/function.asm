.586
.model flat
.code

_DivisioneArray proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo funzione			(vettore, divisore, lunghezza, resto)
								
								mov ebx, dword ptr[ebp + 8]			; vettore
								mov esi, dword ptr[ebp + 16]		; lunghezza
								dec esi
								mov edi, dword ptr[ebp + 12]		; divisore
				Ciclo:
								cmp esi, -1
								je Next
								mov eax, dword ptr[ebx + esi*4]		; prendo il numero
								CDQ
					push edx
					push ecx
								idiv edi							; lo divido per il divisore
								mov dword ptr[ebx + esi*4], eax	
								mov ecx, dword ptr[ebp + 20]
								mov dword ptr [ecx + esi*4], edx
					pop ecx
					pop edx
								dec esi
								jmp Ciclo
				Next:
								call Punto2
								call Punto3			
		Fine:
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_DivisioneArray endp

Punto2 proc
	push ebx
	push edi
					mov ebx, dword ptr[ebp + 20]
					mov edi, 0
			Ciclo:
					cmp edi, esi
					je Ritorna
					cmp dword ptr[ebx + edi*4], 0
					jne Fine
					inc edi
					jmp Ciclo
			Ritorna:
					mov eax, -1
			Fine:
	pop edi
	pop ebx
	ret
Punto2 endp


Punto3 proc
	push ebx
	push edi
					mov ebx, dword ptr[ebp + 20]
					mov edi, 0
			Ciclo:
					cmp edi, esi
					je Ritorna
					cmp dword ptr[ebx + edi*4], 0
					je Fine
					inc edi
					jmp Ciclo
			Ritorna:
					mov eax, 1
			Fine:
	pop edi
	pop ebx
	ret
Punto3 endp

end