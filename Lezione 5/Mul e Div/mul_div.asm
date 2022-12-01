.586
.model flat
.code

; v, lunghezza, media, varianza

_gaus proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione
					mov ebx, dword ptr[ebp + 8]		; vettore
					mov ecx, dword ptr[ebp + 12]	; lunghezza
					mov esi, 0
					mov eax, 0
					mov edi, dword ptr[ebp + 12]
		Ciclo:	
					cmp esi, edi
					je Media
					add eax, dword ptr [ebx + esi*4]
					inc esi
					jmp Ciclo
		Media:
					CDQ
					div ecx				; eax/ecx ovvero somma/lunghezza
					mov ebx, dword ptr[ebp + 16]
					mov dword ptr[ebx], eax
		
		; Calcoliamo ora la varianza {valore - media}^2 poi alla fine diviso la lunghezza
				;   eax = media
					mov ecx, eax					;  media in ecx
					mov eax, 0
					mov esi, 0
					mov ebx, dword ptr[ebp + 8]		; vettore

		CicloVar:	
					cmp esi, edi
					je Varianza
					mov edx, dword ptr[ebx + esi*4]
					sub edx, ecx			; sottrazione
					call potenza			; elevo al quadrato edx ed ho il quadrato in eax
					inc esi
					jmp CicloVar

		Varianza:
					CDQ
					mov ecx, dword ptr[ebp + 12]	; lunghezza vettore
					div ecx							; in eax la varianza
					mov ebx, dword ptr[ebp+20]		; deferenzio
					mov dword ptr[ebx], eax			; aggiorno  la varianza
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
_gaus endp

potenza proc
push ebx
push edx
			mov ebx, eax		; mi salvo il valore precedente di eax
			mov eax, edx		; mi prendo il nuovo numero da elevare a potenza
			imul eax			; elevo a potenza
			add ebx, eax		; aggiungo la potenza al valore precedente
			mov eax, ebx
pop edx
pop ebx
ret
potenza endp

end