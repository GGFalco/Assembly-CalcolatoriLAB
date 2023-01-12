.586
.model flat
.code

_ConfrontaStringa proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione			(prima, seconda)
							mov eax, dword ptr[ebp + 8]
							mov ebx, dword ptr[ebp + 12]
							mov esi, 0
							mov edi, 0
			Ciclo:
							mov cl, byte ptr[eax + esi]
							mov dl, byte ptr[ebx + esi]
							cmp cl, 0
							je Controllo
							cmp dl, 0
							je Seconda
							cmp cl, dl
							jb Prima
							cmp cl, dl
							ja Seconda

							inc esi
							jmp Ciclo
			Controllo:
							cmp dl, 0
							je Pari
							jmp Prima
			Pari:
							mov eax, 0
							jmp Fine
			Prima:
							mov eax, -1
							jmp Fine
			Seconda:
							mov eax, 1
							jmp Fine

							
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
_ConfrontaStringa endp
end