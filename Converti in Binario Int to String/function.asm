.586
.model flat
.code

_Converti proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione	
									mov eax, dword ptr[ebp + 8]		; N
									mov ebx, dword ptr[ebp + 12]	; Stringa
									mov esi, 2
									mov edi, 0
									mov edx, 0
					Ciclo:
									cmp eax, 0
									je Next
									CDQ
									idiv esi						; divido per 2
									mov ecx, edx					; mi salvo il resto in CL
									add cl, 48						; converto in ASCII il numero aggiungendo 48
									mov byte ptr[ebx + edi], cl		; salvo nella stringa
									inc edi				
									mov edx, 0						; azzero edx
									jmp Ciclo						; REPEAT
					Next:
									mov byte ptr[ebx + edi], 0		; 0-termino la stringa
									dec edi
									mov esi, 0
					Inverto:
									mov al, byte ptr[ebx + esi]		; prendo il primo
									mov cl, byte ptr[ebx + edi]		; prendo l'ultimo
									mov byte ptr[ebx + esi], cl		; scambio
									mov byte ptr[ebx + edi], al
									inc esi
									cmp esi, edi
									jg Fine
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
_Converti endp
end