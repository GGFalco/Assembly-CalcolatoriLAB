.586
.model flat
.code

_SubStr proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
	; Corpo Funzione
						mov ebx, dword ptr[ebp + 8]			; stringa
						mov eax, dword ptr[ebp + 12]		; substringa
						mov esi, 0
						mov edi, 0
						mov cl, byte ptr[eax]			
			Ciclo:
						cmp byte ptr[ebx + esi], 0
						je NonTrovata

						cmp byte ptr[ebx + esi], cl
						je Controlla
			Ritorna:
						inc esi
						jmp Ciclo

			Controlla:
						mov cl, byte ptr[eax + edi]
						cmp cl, 0
						je Trovata
						cmp byte ptr[ebx + esi], cl
						jne Ritorna
						inc esi
						inc edi
						jmp Controlla
			Trovata:
						sub esi, edi
						mov eax, esi
						jmp Fine
			NonTrovata:
						mov eax, -1
			Fine:
	; Fine Funzione
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_SubStr endp
end