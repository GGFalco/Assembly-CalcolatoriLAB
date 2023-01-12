.586
.model flat
.code


_ConcatenaStringa proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione		(dest, src)
								
								mov eax, dword ptr[ebp + 8]
								mov ebx, dword ptr[ebp + 12]
								mov esi, 0
								call Strlen
								
				Ciclo:
								mov cl, byte ptr[ebx + esi]
								cmp cl, 0
								je Fine
								mov byte ptr[eax + edi], cl
								inc esi
								inc edi
								jmp Ciclo
				Fine:
								mov byte ptr[eax + edi], 0
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_ConcatenaStringa endp

Strlen proc
				mov edi, 0
		Ciclo:
				cmp byte ptr[eax + edi], 0
				je Fine
				inc edi
				jmp Ciclo
	Fine:
ret
Strlen endp

end