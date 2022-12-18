.586
.model flat
.code

_strtoint proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione
								mov ebx, dword ptr[ebp + 8]				; Numero
								mov eax, 0
								mov edx, 0
								mov esi, 0
								call lunghezza							; mi calcolo la lunghezza per la base
								dec edi
					Ciclo:		
					push ecx
								mov cl, byte ptr[ebx + esi]
								cmp cl, 0
								je Fine
								sub cl, 48
								mov eax, ecx				; Metto in EAX il numero
					pop ecx
								call prodotto				; Mi calcolo la base (123 base = 100)		
					push edx
								imul ecx					
					pop edx
								add edx, eax				; in edx tengo il numero da salvare in eax alla fine
								dec edi						; decremento il moltiplicatore della base 100/10/1
								inc esi						; avanzo nella stringa
								jmp Ciclo
					Fine:
								mov eax, edx
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_strtoint endp

prodotto proc
push esi
push eax
push edx
				cmp edi, 0
				je Next
				mov esi, 0
				mov ecx, 10
				mov eax, 1
	Ciclo:
				cmp esi, edi		; quante volte devo fare per 10 ? edi volte
				je Fine
				imul ecx			; moltiplico 1 * 10 = 10 poi 10 * 10 = 100
				inc esi
				jmp Ciclo
	Next:
				mov eax, 1			; quando ha lunghezza 0 il vettore
				jmp Fine
	Fine:
				mov ecx, eax
pop edx
pop eax
pop esi
ret

prodotto endp

lunghezza proc
push esi
			mov esi, 0
			mov esi, 0
	Ciclo:
			mov cl, byte ptr[ebx + esi]
			cmp cl, 0
			je Fine
			inc esi
			jmp Ciclo
	Fine:
			mov edi, esi
pop esi
ret
lunghezza endp

end