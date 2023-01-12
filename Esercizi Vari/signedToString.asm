.586
.model flat
.code

_signedToString proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione			(stringa, numero)
							mov eax, dword ptr[ebp + 12]				; numero
							mov ebx, dword ptr[ebp + 8]					; stringa
							mov edx, 0
							mov esi, 10
							cmp eax, 0
							jl Negativo
							mov edi, 0
							call LunghezzaNumero
							mov byte ptr[ebx + edi], 0
							dec edi
							jmp Ciclo
			Negativo:
							neg eax
							mov byte ptr[ebx], '-'
							mov edi, 1
							call LunghezzaNumero
							mov byte ptr[ebx + edi], 0
							dec edi
			Ciclo:
							cmp eax, 0
							je Fine

							CDQ
					push edx
							idiv esi
							mov cl, dl
					pop edx
							add cl, 48
							mov byte ptr[ebx + edi], cl

							dec edi
							jmp Ciclo
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
_signedToString endp

LunghezzaNumero proc
push ecx
push edx
					mov ecx, eax
		Ciclo:
					cmp eax, 0
					je Fine
					CDQ
					idiv esi
					inc edi
					jmp Ciclo
		Fine:
					mov eax, ecx
pop edx
pop ecx
ret
LunghezzaNumero endp

end