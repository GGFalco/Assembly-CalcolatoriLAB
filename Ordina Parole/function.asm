.586
.model flat
.code

_OrdinaParole proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione			(stringa, dest)
		
							mov ebx, dword ptr[ebp + 8]
							mov esi, 0
							push eax
							mov eax, dword ptr[ebp + 12]
							mov byte ptr[eax + esi], 0								; 0 termino la stringa destinazione
							pop eax
							call NumeroDiParole										; salvo in edx il numero di parole
				Ciclo:																; pulisco la stringa da caratteri speciali o numeri
							cmp byte ptr[ebx + esi], 0
							je Next
							cmp byte ptr[ebx + esi], 'A'
							jl Pulisci
							cmp byte ptr[ebx + esi], 'z'
							jg Pulisci
							cmp byte ptr[ebx + esi], 'a'
							jl PrePulisci
							inc esi
							jmp Ciclo
				PrePulisci:
							cmp byte ptr[ebx + esi], 'Z'						; ho inserito questo PrePulisci per i caratteri tra "Z" ed "a"
							jl Pulisci
							inc esi
							jmp Ciclo
				Pulisci:
							mov byte ptr[ebx + esi], ' '
							inc esi
							jmp Ciclo



				Next:
							mov esi, 0
							mov ecx, 0
							mov eax, 0
							mov edi, 0
							mov cl, byte ptr[ebx + esi]							; iniziamo con l'ordinamento delle parole
				Ciclo2:															; guardo con che lettera iniziano le parole e mi salvo la più piccola (ordine crescente)
							cmp byte ptr[ebx + esi], 0							; dopo che ho controllato tutta la stringa, copio la parola che inizia con la lettera piu piccola
							je Copia											; la copia la faccio salvandomi l'indice della lettera più piccola e a partire dalla lunghezza della stringa destinazione
							cmp byte ptr[ebx + esi], ' '						; tutte le volte che trovo una lettera più piccola controllo che non sia gia stata inserita nella stringa destinazione
							je Confronto
							inc esi
							jmp Ciclo2

				Confronto:
							inc esi
							mov al, byte ptr[ebx + esi]
							cmp al, ' '
							je NonConfrontare
							cmp cl, al
							jg Scambia

				NonConfrontare:
							inc esi
							jmp Ciclo2
				Scambia:
							push edx
							call GiaPresente
							cmp edx, 1
							je NonScambiare
							pop edx
							mov edi, esi						; mi salvo l'indice del più piccolo
							mov cl, byte ptr[ebx + edi]
							inc esi
							jmp Ciclo2

				NonScambiare:
							pop edx
							inc esi
							jmp Ciclo2
				Copia:
							cmp edx, 0
							je Fine
							dec edx

							push edx
							call LunghezzaStringa			; in edx lunghezza stringa
							mov esi, edx
							pop edx

        ContinuoAggiungi:	push edx
							push ecx
							push eax
							mov edx, edi
							mov eax, dword ptr[ebp + 12]
				CicloCopia:
							cmp byte ptr[ebx + edx], ' '
							je Ritorniamo
							cmp byte ptr[ebx + edx], 0
							je Ritorniamo
							mov cl, byte ptr[ebx + edx]
							mov byte ptr[eax + esi], cl
							inc esi
							inc edx
							jmp CicloCopia

				
				Ritorniamo:
							mov byte ptr[eax + esi], ' '
							inc esi
							mov byte ptr[eax + esi], 0
							pop eax
							pop ecx
							pop edx
							mov edi, 0
							mov esi, 0
							mov ecx, 0
							mov eax, 0
							mov cl, byte ptr[ebx + esi]
							jmp Ciclo2
				Fine:		
							call LunghezzaStringa
							mov eax, dword ptr[ebp + 12]
							dec edx
							mov byte ptr[eax + edx], 0
							; ricordati di 0 terminare
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_OrdinaParole endp

LunghezzaStringa proc
push esi
push eax
			mov edx, 0
			mov esi, 0
			mov eax, dword ptr[ebp + 12]
	Ciclo:
			cmp byte ptr[eax + esi], 0
			je Fine
			inc esi
			inc edx
			jmp Ciclo
	Fine:
pop eax
pop esi
ret
LunghezzaStringa endp


GiaPresente proc			; verifico se quella lettera è gia presente nel dest
push esi
push eax
push ecx

				mov esi, 0
				mov edx, 0
				mov cl, al
				mov eax, dword ptr[ebp + 12]
				mov dl, byte ptr[eax + esi]
				cmp cl, dl
				je Presente
		Ciclo:
				mov dl, byte ptr[eax + esi]
				cmp dl, 0
				je NonPresente
				cmp dl, ' '
				je Controlliamo
				inc esi
				jmp Ciclo

		Controlliamo:
				inc esi
				mov dl, byte ptr[eax + esi]
				cmp cl, dl
				je Presente
				inc esi
				jmp Ciclo
		NonPresente:
				mov edx, 0
				jmp Fine
		Presente:
				mov edx, 1
				jmp Fine
		Fine:
pop ecx
pop eax
pop esi
ret
GiaPresente endp

NumeroDiParole proc
push esi
				mov esi, 0
				mov edx, 1

		Ciclo:
				cmp byte ptr[ebx + esi], 0
				je Fine
				cmp byte ptr[ebx + esi], ' '
				je Controllo
				inc esi
				jmp Ciclo
		Controllo:
				inc esi
				cmp byte ptr[ebx + esi], ' '
				je NonContare
				inc edx
				inc esi
				jmp Ciclo

		NonContare:
				inc esi
				jmp Ciclo

		Fine:
pop esi
ret
NumeroDiParole endp

end