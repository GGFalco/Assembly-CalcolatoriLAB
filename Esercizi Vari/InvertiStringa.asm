.586
.model flat
.code

_InvertiStringa proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
	; Corpo Funzione		(stringa)
								
								mov ebx, dword ptr[ebp + 8]
								mov esi, 0
								mov edi, 0
								call StrLenInvert
								dec edi
				Ciclo:
								cmp esi, edi
								jg Fine
								mov al, byte ptr[ebx + esi]
								mov cl, byte ptr[ebx + edi]
								
								mov byte ptr[ebx + esi], cl
								mov byte ptr[ebx + edi], al

								inc esi
								dec edi
								jmp Ciclo
				Fine:
	; Fine Funzione
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_InvertiStringa endp

StrLenInvert proc
	Ciclo:
			cmp byte ptr[ebx + edi], 0
			je Fine
			inc edi
			jmp Ciclo
	Fine:
ret
StrLenInvert endp

end