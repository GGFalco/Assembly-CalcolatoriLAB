.586
.model flat
.code

_somma_modulo proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push edx
	; Corpo Funzione			(vettore, lunghezza, destinazione, divisore)
									; in destinazione ci va il resto
									; dest[i] = vettore[i] % divisore

								mov esi, 0
								mov edx, 0
								mov eax, 0
								mov ebx, dword ptr[ebp + 8]		; vettore
				Ciclo:
								cmp esi, dword ptr[ebp + 12]	; scorro il vettore
								je SommoResto
								mov eax, dword ptr[ebx + esi*4]
								CDQ
						push esi
						mov esi, dword ptr[ebp + 20]
								idiv esi						; divido per il divisore
						pop esi
						push ebx
						mov ebx, dword ptr[ebp + 16]			; pusho ebx per metterci dest
								mov dword ptr[ebx + esi*4], edx	; metto in dest il resto	
						pop ebx
								inc esi
								jmp Ciclo
				SommoResto:
								call TuttiDivisibili			; controllo che tutti siano divisibili
								cmp eax, -1
								je Fine
								call TuttiNonDivisibili			; controllo che tutti non siano divisibili
								cmp eax, -2
								je Fine
								mov esi, 0
								mov eax, 0
								mov ebx, dword ptr[ebp + 16]
				CicloResto:
								cmp esi, dword ptr[ebp +12]
								je Fine
								add eax, dword ptr[ebx+esi*4]
								inc esi
								jmp CicloResto
				Fine:
	; Fine Funzione
pop edx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_somma_modulo endp

TuttiDivisibili proc		; il vettore dei resti deve essere tutti zero
push esi
push ebx
				mov esi, 0
				mov ebx, dword ptr[ebp + 16]
		Ciclo:
				cmp esi, dword ptr[ebp + 12]
				je Ritorno
				cmp dword ptr[ebx + esi*4], 0				; se diverso da 0 significa che non è divisibile
				jne Fine									; quindi niente, altrimenti se sono tutti divisibili
				inc esi										; ritorno -1
				jmp Ciclo
		Ritorno:
				mov eax, -1
		Fine:
pop ebx
pop esi
ret
TuttiDivisibili endp

TuttiNonDivisibili proc
push esi
push ebx
				mov esi, 0
				mov ebx, dword ptr[ebp + 16]
		Ciclo:
				cmp esi, dword ptr[ebp + 12]
				je Ritorno
				cmp dword ptr[ebx + esi*4], 0			; se uguale a 0 significa che è divisibile
				je Fine									; quindi niente, altrimenti se sono tutti non divisibili
				inc esi									; ritorno -2
				jmp Ciclo
		Ritorno:
				mov eax, -2
		Fine:
pop ebx
pop esi
ret
TuttiNonDivisibili endp

end