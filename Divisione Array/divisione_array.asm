.586
.model flat
.code

_divisione_array proc
push ebp
mov ebp, esp
push edi
push esi
push ebx
push edx
push ecx
	; Corpo Funzione		; (vettore, divisore, lunghezza, resto)
				
						mov ebx, dword ptr[ebp + 8]			; vettore
						mov ecx, dword ptr[ebp + 20]		; resto 

						mov esi, 0
						mov eax, 0
						mov edx, 0
		Ciclo:
						cmp esi, dword ptr[ebp + 16]		; mi fermo quando ho passato tutti gli elementi
						je CheckResto
						mov eax, dword ptr[ebx + esi*4]		; v[i]
						CDQ									; estendo EAX in EDX:EAX con segno
						idiv dword ptr[ebp + 12]			; eax = eax / dword ptr[ebp + 12](divisore)
						mov dword ptr[ebx + esi*4], eax		; v[i] = risultato della divisione
						mov dword ptr[ecx + esi*4], edx		; resto
						inc esi
						jmp Ciclo
		CheckResto:
						mov esi, 0
		CicloResto:
						cmp esi, dword ptr[ebp + 16]		; scorro tutto il vettore del resto, se sono tutti 0 ritorno -1
						je RitornoMen1
						mov ebx, dword ptr[ecx + esi*4]		; scorro il vettore del resto
						cmp ebx, 0							; se != 0 almeno un elemento ritorno 1				
						jne Ritorno1
						inc esi
						jmp CicloResto
		Ritorno1:
						mov eax, 1
						jmp Fine
		RitornoMen1:
						mov eax, -1
		Fine:
	; Fine Funzione
pop ecx
pop edx
pop ebx
pop esi
pop edi
mov esp, ebp
pop ebp
ret
_divisione_array endp
end