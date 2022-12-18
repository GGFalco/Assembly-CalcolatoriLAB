.586
.model flat
.code

_substr proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione
							mov eax, dword ptr[ebp + 8]		; str
							mov ebx, dword ptr[ebp + 12]	; find
							mov esi, 0
				Ciclo:
							mov cl, byte ptr[eax + esi]
							cmp cl, 0
							je Miss
							cmp cl, byte ptr[ebx]
				ritorno:	je CercaOcc
							inc esi
							jmp Ciclo
				CercaOcc:
							call Cerca
							cmp eax, esi
							je Fine
							jmp ritorno
				Miss:
							mov eax, -1
							jmp Fine
				Fine:
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_substr endp

Cerca proc
				mov edx, esi			; se la parola è trovata in edx ho l'indice di partenza
push esi
push edx

				mov esi, 0
	Ciclo:		
				mov cl, byte ptr[eax + edx]
				cmp byte ptr[ebx + esi], 0
				je Find
				cmp cl, byte ptr[ebx + esi]
				jne Fine
				inc esi
				inc edx
				jmp Ciclo
	Find:
pop edx
				mov eax, edx
				;sub eax, esi
				jmp Fine
	Fine:
pop esi	
ret
Cerca endp

end