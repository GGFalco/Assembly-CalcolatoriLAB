.586
.model flat
.code

_numeri_nonprimi proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione		(src, dest, lunghezza)
							mov ebx, dword ptr[ebp + 8]
							mov esi, 0
							mov esi, 0
							mov eax, 0
							mov ecx, 0
							mov edx, 0

				Ciclo:
							cmp esi, dword ptr[ebp + 16]
							je Fine
							mov al, byte ptr[ebx + esi]
							
							mov edi, 2
							mov ecx, eax
				CicloPrimo:
							cmp edi, ecx
							jge Primo

							CDQ
					push edx
							div edi
							cmp edx, 0
							je NonPrimo
					pop edx

							mov eax, ecx
							inc edi
							jmp CicloPrimo
			Primo:
					push ebx
							mov ebx, dword ptr[ebp + 12]
							mov byte ptr[ebx + esi], 0
					pop ebx
			Continua:
							mov edx, 0
							mov ecx, 0
							mov eax, 0
							inc esi
							jmp Ciclo

				NonPrimo:
							push ebx
							mov ebx, dword ptr[ebp + 12]
							mov byte ptr[ebx + esi], 1
							pop ebx
							jmp Continua
								
				Fine:
							call Ritorni
							call Ritorno
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_numeri_nonprimi endp

Ritorno proc
					mov ebx, dword ptr[ebp + 12]
					mov esi, 0

		Ciclo:
					cmp esi, dword ptr[ebp + 16]
					je Ritorno2
					cmp byte ptr[ebx + esi], 0
					je Fine2
		Ritorno2:
					mov eax, -2
					jmp Fine2
		Fine2:
ret
Ritorno endp


Ritorni proc
					mov ebx, dword ptr[ebp + 12]
					mov esi, 0
		Ciclo:
					cmp esi, dword ptr[ebp + 16]
					je Ritorno1
					cmp byte ptr[ebx + esi], 0
					jne Fine
					inc esi
					jmp Ciclo
		Ritorno1:
					mov eax, -3
					jmp Fine
	Fine:
ret
Ritorni endp


end