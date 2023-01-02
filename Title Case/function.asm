.586
.model flat
.code

_TitleCase proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione
							mov ebx, dword ptr[ebp + 8]		; stringa
							mov esi, 0
				Ciclo:
							cmp byte ptr[ebx + esi], ' '
							je Maiuscola
							cmp byte ptr[ebx + esi], 0
							je Controllo
							inc esi
							jmp Ciclo

				Controllo:
							dec esi
							mov cl, byte ptr[ebx + esi]
							cmp cl, 'a'
							jl Fine
							cmp cl, 'z'
							jg Fine
							add cl, 'A' - 'a'
							mov byte ptr[ebx + esi], cl
							jmp Fine

				Maiuscola:
							dec esi
							mov cl, byte ptr[ebx + esi]
							add cl, 'A' - 'a'
							mov byte ptr[ebx + esi], cl
							add esi, 2
							jmp Ciclo
				Fine:
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_TitleCase endp
end