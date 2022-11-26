.586
.model flat
.code

; vettore, lunghezza

_contapari proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push edx
push ecx
	; Corpo Funzione
						mov ebx, dword ptr[ebp + 8]			; vettore
						mov esi, 0
						mov edi, 0
						mov eax, 0
			Ciclo:		
						cmp esi, dword ptr[ebp + 12]
						je Fine
						mov al, byte ptr[ebx + esi]
						CDQ
						mov ecx, 2
						div ecx
						cmp edx, 0
						jne Dispari
						inc edi
						inc esi
						jmp Ciclo
			Dispari:
						inc esi
						jmp Ciclo
			Fine:
						mov eax, edi		; il ritorno in eax
	; Fine Funzione
pop ecx
pop edx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_contapari endp
end