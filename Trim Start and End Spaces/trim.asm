.586
.model flat
.code

_TrimSpaces proc
push ebp 
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione			(stringa, dest)
								mov ebx, dword ptr[ebp + 8]
								mov eax, dword ptr[ebp + 12]
								mov esi, 0
								call Lunghezza
								dec edi
			Ciclo:			
								cmp byte ptr[ebx + esi], ' '
								jne Next
								mov byte ptr[ebx + esi], 1
								inc esi
								jmp Ciclo
			Next:
								mov esi, edi
			Ciclo2:
								cmp byte ptr[ebx + esi], ' '
								jne Next2
								mov byte ptr[ebx + esi], 1
								dec esi
								jmp Ciclo2
			Next2:
								mov esi, 0
								mov edi, 0
			Ciclo3:
								cmp byte ptr[ebx + esi], 0
								je Fine
								mov cl, byte ptr[ebx + esi]
								cmp cl, 1
								je Salta
								mov byte ptr[eax + edi], cl
								inc esi
								inc edi
								jmp Ciclo3
			Salta:
								inc esi
								jmp Ciclo3
			Fine:
								mov byte ptr[eax + edi], 0
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_TrimSpaces endp

Lunghezza proc
				mov edi, 0
		Ciclo:
				cmp byte ptr[ebx + edi], 0
				je Fine
				inc edi
				jmp Ciclo
		Fine:
ret
Lunghezza endp
end