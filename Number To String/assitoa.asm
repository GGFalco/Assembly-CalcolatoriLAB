.586
.model flat
.code
							; funzione per la lunghezza del numero, trovata quella controllare se è negativo ed aggiungere 1 alla lunghezza (usa edi)
_assitoa proc
push ebp
mov ebp, esp
push esi
push edi
push ebx			
	; Corpo funzione			(numero, segno, stringa)
								
								mov eax, dword ptr[ebp + 8]			; numero
								call lunghezza						; in esi metto la lunghezza del numero
								mov eax, dword ptr[ebp + 8]
								mov ebx, dword ptr[ebp + 16]
								cmp eax, 0
								jg PreCiclo
								add edi, 1
								mov byte ptr[ebx + edi], 0			; 0 termino la stringa
								mov edi, 0
								mov byte ptr[ebx + edi], '-'
								mov edi, 1
								neg eax
								jmp Ciclo
					PreCiclo:
								mov byte ptr[ebx + edi], 0			; 0 termino la stringa
								sub esi, 1
								mov edi, 0
					Ciclo:
								cmp esi, edi
								jl CheckRitorni
								CDQ
								push esi
								mov esi, 10
								idiv esi
								pop esi
								add dl, 48
								mov byte ptr[ebx + esi], dl
								sub esi, 1
								jmp Ciclo
					
					CheckRitorni:
								mov eax, dword ptr[ebp + 8]			; numero
								mov ebx, dword ptr[ebp+ 12]			; segno
								cmp ebx, 1
								jne Rit0
								cmp eax, 0
								je RitMen2
								cmp eax, 0
								jg Rit1
								jmp RitMen1			
					Rit0:											; quando sgn = 0, ritorno 0 perche eax nel corso delle divisioni diventa 0
								mov eax, 0
								jmp Fine
					RitMen2:										; se il numero = 0
								mov eax, -2
								jmp Fine
					Rit1:											; numero positivo
								mov eax, 1
								jmp Fine
					RitMen1:										; numero negativo
								mov eax, -1
								jmp Fine
					Fine:
								
	; Fine funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_assitoa endp

lunghezza proc
				mov edi, 0
		Ciclo:
				cmp eax, 0
				je Fine
				push esi
				mov esi, 10
				CDQ
				idiv esi
				pop esi
				inc edi
				jmp Ciclo
		Fine:
				mov esi, edi
ret
lunghezza endp

end