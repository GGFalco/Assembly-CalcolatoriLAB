.586
.model flat
.code

_ordina proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione			(source, dest)
								mov ebx, dword ptr[ebp + 8]		; stringa
								mov esi, 0
								mov edi, 0

					Ciclo:
								mov cl, byte ptr[ebx + esi]						; prelevo un carattere
								cmp cl, 0
								je Next
								call Pulisci									; controlla non compaia, di nuovo
								inc esi											; se compare lo rimpiazzo con uno spazio
								jmp Ciclo
					Next:
								mov esi, 0										; dopo aver pulito la stringa
								mov edi, 0										; copio la stringa NON ordinata in dest
								mov eax, dword ptr[ebp + 12]					; NON COPIANDO gli spazi
					Ciclo2:
								mov cl, byte ptr[ebx + esi]
								cmp cl, 0
								je PreOrder
								cmp cl, ' '
								je Salta
								
								mov byte ptr[eax + edi], cl
								inc edi
								inc esi
								jmp Ciclo2

					Salta:
								inc esi
								jmp Ciclo2

					PreOrder:
								
								mov byte ptr[eax + edi], 0			; 0 - termino la stringa
								mov ecx, edi						; mi salvo la lunghezza della stringa

								mov esi, 0							; con esi scorro la stringa ( i )
								mov edi, 1							; i + 
								
					Ordina:
																		; cl (i)
								mov dl, byte ptr[eax + edi]				; i + 1
								cmp dl, 0								; edi è uguale alla lunghezza della stringa termino
								je Ripeti								; diminuisco la lunghezza e ripeto
								
								cmp byte ptr[eax + esi], dl				; confronto [i] con [i + 1], se [i] > [i + 1]
								jg Scambia								; scambio
																		; cosi porto il piu grande in ultima posizione
								inc esi
								inc edi
								jmp Ordina

								
					Scambia:											; scambio i con i + 1
								push ecx
								mov cl, byte ptr[eax + esi]
								mov byte ptr[eax + esi], dl
								mov byte ptr[eax + edi], cl
								pop ecx
								inc esi
								inc edi
								jmp Ordina
					Ripeti:
								dec ecx									; decremento la lunghezza della stringa
								cmp ecx, -1								; perchè ultima posizione è ordinata
								je Fine									; termino quando la lunghezza è negativa ( ho ordinato anche posizione 0)
								mov esi, 0								; ripristino
								mov edi, 1
								jmp Ordina

					Fine:
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_ordina endp

Pulisci proc
push edi		
				mov edi, esi
				inc edi
		Ciclo:
				cmp byte ptr[ebx + edi], 0
				je Fine
				cmp cl, byte ptr[ebx + edi]
				je Rimpiazza
				inc edi
				jmp Ciclo

		Rimpiazza:
				mov byte ptr[ebx + edi], ' '
				inc edi
				jmp Ciclo
	Fine:
pop edi
ret
Pulisci endp

end