.586
.model flat
.code

_Collatz proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione
							mov eax, dword ptr[ebp + 8]
							mov ebx, dword ptr[ebp + 12]
							mov ecx, eax
							mov esi, 2
							mov edi, 0
							
							cmp eax, 1
							je FineSubito
							
				Ripeti:
							cmp eax, 1
							je Fine
							mov ecx, eax
							CDQ
							idiv esi
							cmp edx, 0
							jne Dispari
					push ecx
							mov cl, al
							call Lunghezza						; in edx ho la lunghezza
							cmp edx, 1
							jge ProcessoDiCopia
							add cl, 48
							mov byte ptr[ebx + edi], cl
							inc edi
							mov byte ptr[ebx + edi], ','
							inc edi
							mov byte ptr[ebx + edi], ' '
					pop ecx
							inc edi
							mov edx, 0
							jmp Ripeti
				Dispari:
					push esi
							mov esi, 3
							mov eax, ecx
							imul esi
							add eax, 1
					pop esi
					push ecx
							mov cl, al
							call Lunghezza						; in edx ho la lunghezza
							cmp edx, 1
							jge ProcessoDiCopia
							add cl, 48
							mov byte ptr[ebx + edi], cl
							inc edi
							mov byte ptr[ebx + edi], ','
							inc edi
							mov byte ptr[ebx + edi], ' '
					pop ecx
							inc edi
							mov edx, 0
							jmp Ripeti
				
				FineSubito:
							mov edi, 0
							mov ebx, dword ptr[ebp + 12]
							add al, 48
							mov byte ptr[ebx + edi], al
							inc edi
							mov byte ptr[ebx + edi], 0
							jmp Fine
				
				ProcessoDiCopia:
							call CopiaStringa
							mov edx, 0
							jmp Ripeti
				Fine:	
							call PulisciStringa
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_Collatz endp

PulisciStringa proc
push esi
push ecx
				mov esi, edi
				dec esi
		Ciclo:
				mov cl, byte ptr[ebx + esi]
				cmp cl, ','
				jne Controllo2
				mov byte ptr[ebx + esi], 0
				dec esi
				jmp Ciclo

	Controllo2:
				cmp cl, ' '
				je Cancella
				inc esi
				mov byte ptr[ebx + esi], 0
				jmp Fine
	Cancella:
				mov byte ptr[ebx + esi], 0
				dec esi
				jmp Ciclo
	Fine:
pop ecx
pop esi
ret
PulisciStringa endp


CopiaStringa proc
push eax
push esi
						; in edx ho la lunghezza
						; in edi ho l'indice
						mov eax, ecx
						mov esi, 10
						add edi, edx		; 34, 0
						mov edx, edi
				Ciclo:
						cmp eax, 0 
						je Fine
				push ecx
				push edx
						CDQ
						idiv esi
						add dl, 48
						mov cl, dl
				pop edx
						mov byte ptr[ebx + edx], cl
				pop ecx
				
						dec edx
						jmp Ciclo
			Fine:
						inc edi
						mov byte ptr[ebx + edi], ','
						inc edi
						mov byte ptr[ebx + edi], ' '
						inc edi
						mov byte ptr[ebx + edi], 0
						
pop esi
pop eax
ret
CopiaStringa endp

Lunghezza proc
		
push eax
push esi
				mov eax, ecx
				mov esi, 10
				mov edx, 0
		Ciclo:
		push edx
				CDQ
				idiv esi
		pop edx
				cmp eax, 0
				je Fine
				inc edx
				jmp Ciclo
	Fine:
pop esi
pop eax
ret
Lunghezza endp

end