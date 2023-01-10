.586
.model flat
.code

_AssiToA proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione			(numero, segno, stringa)
								
								mov eax, dword ptr[ebp + 8]			; numero
								mov ebx, dword ptr[ebp + 16]		; stringa

								mov esi, 10
								mov edi, 0
								mov edx, 0

								cmp eax, 0
								jl Negativo
								call StrLen
								mov byte ptr[ebx + edi], 0		
								dec edi
								jmp Ciclo

					Negativo:
								neg eax
								call Strlen
								inc edi
								mov byte ptr[ebx + edi], 0
								dec edi
								mov byte ptr[ebx], '-'
					Ciclo:
								cmp byte ptr[ebx + edi], '-'
								je Next
								cmp edi, -1
								je Next

								CDQ
								idiv esi
								mov cl, dl
								add cl, 48
								mov byte ptr[ebx + edi], cl
								mov edx, 0

								dec edi
								jmp Ciclo
								
				Next:
								cmp dword ptr[ebp + 8], 0
								jne Next2
								cmp dword ptr[ebp +12], 1
								jne Next2
								mov eax, -2
								jmp Fine

				Next2:
								cmp dword ptr[ebp + 12], 1
								jne Fine
								mov eax, 1
								cmp dword ptr[ebp + 8], 0
								jg Fine
								mov eax, -1
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
_AssiToA endp

StrLen proc
push eax
push edx
					mov eax, dword ptr[ebp + 8]

		Ciclo:
					cmp eax, 0
					je Fine
					CDQ
					idiv esi
					inc edi
					jmp Ciclo
	Fine:
pop edx
pop eax
ret
StrLen endp


end