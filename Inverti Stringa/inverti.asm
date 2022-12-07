.586
.model flat
.code

_inverti proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione
						mov ebx, dword ptr[ebp + 8]			; stringa
						mov esi, 0
						mov edi, 0
						call lunghezza						; in edi ho l'indice ATTENZIONE incrementa per avere la lunghezza
						mov eax, edi						; preparo i registri per la divisione
						inc eax								; incremento per la lunghezza
						CDQ
				push esi
				mov esi, 2			
						idiv esi							; mi trovo la meta 
						mov edx, eax						; mi salvo la meta in edx
				pop esi
						
			Inverto:												; inverto il primo con l'ultimo / il secondo con il penultimo quindi incremento i e decremento la lunghezza di i
						cmp esi, edx								; quando arrivo a metà stringa mi fermo
						je Fine
				push edi
				call lunghezza
				sub edi, esi
						mov al, byte ptr[ebx + edi]					; prendo l'ultimo che sarebbe [ebx + lunghezza - i] con i che scorre la stringa
				pop edi
						mov cl, byte ptr[ebx + esi]					; prendo il primo
						mov byte ptr[ebx + esi], al					; scambio, metto l'ultimo al posto del primo
				push edi
				call lunghezza
				sub edi, esi
						mov byte ptr[ebx + edi], cl					; metto il primo al posto dell'ultimo (mi devo ricalcolare l'indice per forza)
				pop edi
						inc esi
						dec edi
						jmp Inverto
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
_inverti endp

lunghezza proc
push ebx
			
			mov ebx, dword ptr[ebp + 8]
	Ciclo:	mov al, byte ptr[ebx + edi]
			cmp al, 0
			je Fine
			inc edi
			jmp Ciclo
	Fine:
			dec edi
pop ebx
ret
lunghezza endp

end