.586
.model flat
.code

_Crescenti proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione
							mov eax, dword ptr[ebp + 8]			; N
							mov esi, 10
							mov edx, 0							; azzero edx
				Ciclo:
							cmp eax, 0
							je Crescente
							CDQ
							idiv esi
							mov ebx, edx						; in ebx ho l'ultima cifra
							call Check
							cmp ebx, 0
							je NonCrescente
							jmp Ciclo
				Crescente:
							mov eax, 1
							jmp Fine

				NonCrescente:
							mov eax, 0
							jmp Fine
				Fine:			
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_Crescenti endp

Check proc
push ecx
push edx
				mov ecx,eax
				CDQ
				idiv esi			
				cmp edx, ebx
				jle Crescente
				mov ebx, 0
				jmp Fine
	Crescente:
				mov ebx, 1
				jmp Fine
	Fine:
				mov eax, ecx
pop edx
pop ecx
ret
Check endp


end