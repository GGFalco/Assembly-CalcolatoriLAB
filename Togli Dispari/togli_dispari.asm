.586
.model flat
.code

_togli_dispari proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione				(vettore, lunghezza)
							
								mov ebx, dword ptr[ebp + 8]
								mov esi, 0
								mov edi, 0
								mov eax, 0
								mov edx, 0
								call CheckPari
								cmp eax, -2
								je Fine
								call CheckDispari
								cmp eax, -1
								je Fine
					Ciclo:	
								cmp esi, dword ptr[ebp + 12]		; scorro il vettore
								je CheckModificati
								mov al, byte ptr[ebx + esi]			; v[i]
								CBW									; estendo Al in AX con segno
						push ecx
						mov cl,2
								div cl								; al = al/2
						pop ecx 
								cmp ah, 0
								jne Dispari							; è dispari
					Continuo:	inc esi
								jmp Ciclo
					
					
					Dispari:	; il numero è dispari devo verificare se il precedente ed il successivo siano pari
								mov edi, esi
								sub edi, 1
								mov al, byte ptr[ebx + edi]			; verifico il precedente
								CBW
						push ecx
						mov cl,2
								div cl	
						pop ecx
								cmp ah, 0
								jne Continuo						; se dispari non sostituisco
								mov edi, esi
								add edi, 1							; verifico il successivo
								mov al, byte ptr[ebx + edi]
								CBW
						push ecx
						mov cl,2
								div cl	
						pop ecx
								cmp ah, 0
								jne Continuo						; se dispari non sostituisco
								call media							; DEVO SOSTITUIRE, calcolo la media e la metto in al e sostituisco
								inc dl								; conto quante volte ho MODIFICATO
								jmp Continuo
			CheckModificati:
								cmp dl, 0
								je Fine
								CBW
								mov al, dl						; verifico se il numero di elementi modificati è pari e diverso da 0
						push ecx
						mov cl, 2
								idiv cl	
						pop ecx
								cmp ah, 0
								jne DispariModificati
								mov al, dl
								jmp Fine

			DispariModificati:
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
_togli_dispari endp

CheckPari proc
push ebx
push esi
						mov esi, 0
						mov ebx, dword ptr[ebp + 8]
		CheckPariCiclo:
						cmp esi, dword ptr[ebp + 12]
						je FineConRitorno
						mov al, byte ptr[ebx + esi]
						CBW
				push ecx
				mov cl, 2
						div cl
				pop ecx
						cmp ah, 0
						jne FineCheckPari
						inc esi
						jmp CheckPariCiclo
		FineConRitorno:
						mov eax, -2
		FineCheckPari:					
pop esi
pop ebx
ret
CheckPari endp

CheckDispari proc
push ebx
push esi
						mov esi, 0
						mov ebx, dword ptr[ebp + 8]
	CheckDispariCiclo:
						cmp esi, dword ptr[ebp + 12]
						je FineConRitorno
						mov al, byte ptr[ebx + esi]
						CBW
				push ecx
				mov cl,2
						div cl
				pop ecx
						cmp ah, 0
						je FineCheckDispari
						inc esi
						jmp CheckDispariCiclo
		FineConRitorno:
						mov eax, -1
		FineCheckDispari:					
pop esi
pop ebx
ret
CheckDispari endp


media proc
push ecx
					; in edi ho il successivo
					; in esi ho il dispari
					; in ecx ho il precedente
					mov ecx, esi
					sub ecx, 1
					mov al, byte ptr[ebx + edi]
					add al, byte ptr[ebx + ecx]
					CBW
			push ecx
			mov cl,2
					div cl							; calcolo la media
			pop ecx
					mov cl, al						; mi salvo la media
					CBW
			push ecx
			mov cl,2
					div cl							; verifico se la media è pari
			pop ecx
					cmp ah, 0
					jne MediaDispari				; media dispari
					mov byte ptr[ebx + esi], cl		; se pari non cambia niente
					jmp FineMedia
	MediaDispari:
					add cl, 1						; se dispari aggiungo 1
					mov byte ptr[ebx + esi], cl
	FineMedia:
pop ecx
ret
media endp

end