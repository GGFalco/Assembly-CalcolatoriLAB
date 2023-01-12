.586
.model flat
.code

_StringToSigned proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione		(numero, destinazione)

							mov ebx, dword ptr[ebp + 12]		; stringa
							mov esi, 0
							mov eax, 0
							mov ecx, 0
							mov edx, 0
							mov edi, 10
							call LunghezzStringaNumero			; in esi la lunghezza della stringa
							cmp byte ptr[ebx], '-'
							je PreNegativo
				
				Ciclo:
							mov cl, byte ptr[ebx + edx]			; prendo l'ultimo carattere
							sub cl, 48
							add eax, ecx						; 3

							inc edx
							cmp edx, esi
							je Fine

					push edx
							imul edi							; 30
					pop edx
							
							jmp Ciclo

				PreNegativo:
							
							inc edx
				Negativo:
							mov cl, byte ptr[ebx + edx]
							sub cl, 48
							sub eax, ecx

							inc edx
							cmp edx, esi
							je Fine

					push edx
							imul edi
					pop edx

							jmp Negativo

				Fine:
						mov ebx, dword ptr[ebp + 8]
						mov dword ptr[ebx], eax

	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_StringToSigned endp

LunghezzStringaNumero proc
		Ciclo:
					cmp byte ptr[ebx + esi], 0
					je Fine
					inc esi
					jmp Ciclo
	Fine:
ret
LunghezzStringaNumero endp
end