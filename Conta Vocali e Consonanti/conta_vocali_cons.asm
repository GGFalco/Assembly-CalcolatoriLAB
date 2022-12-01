.586
.model flat
.code

_conta_vocali_consonanti proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione
									mov ebx, dword ptr[ebp + 8]		; vettore
									mov edx, dword ptr[ebp + 12]	; azzero vocali
									mov dword ptr[edx], 0			
									mov edx, dword ptr[ebp + 16]	; azzero consonanti
									mov dword ptr[edx], 0
									mov esi, 0
						Ciclo:
									mov cl, byte ptr[ebx + esi]
									cmp cl, 0
									je Men1
									call Minuscolo					; metto tutti i caratteri in minuscolo
									call Vocale						; verifico se è una vocale o una consonante
									inc esi
									jmp Ciclo
						Men1:
									mov esi, dword ptr[edx]
									mov edx, dword ptr[ebp + 16]
									add esi, dword ptr[edx]			; sommo le consonanti e le vocali se 0 la somma vuol dire che la stringa
									cmp esi, 0						; non contiene nè vocali nè consonanti
									je RitornoMen1
									call Men2
									jmp Fine
					RitornoMen1:
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
_conta_vocali_consonanti endp

Men2 proc
				mov esi, 0
		Ciclo:	mov cl , byte ptr[ebx + esi]
				cmp cl, 0
				je RitMen2
				call Minuscolo
				cmp cl, 'a'
				jl Fine
				cmp cl, 'z'
				jg Fine
				inc esi
				jmp Ciclo
		RitMen2:
				mov eax, -2
		Fine:
ret
Men2 endp

Minuscolo proc
					cmp cl, 'A'
					jl Fine
					cmp cl, 'Z'
					jg Fine
					add cl, 'a' - 'A'
		Fine:
ret
Minuscolo endp

Vocale proc
						cmp cl, 'a'
						je Conta
						cmp cl, 'e'
						je Conta
						cmp cl, 'i'
						je Conta
						cmp cl, 'o'
						je Conta
						cmp cl, 'u'
						je Conta
						jmp Consonante
		Conta:
				push esi								; incremento le vocali
				push edx
				mov edx, dword ptr[ebp + 12]
				mov esi, dword ptr[edx]
				inc esi
				mov dword ptr[edx], esi
				pop edx
				pop esi
						jmp Fine
		Consonante:
						cmp cl, 'a'
						jl Fine
						cmp cl, 'z'
						jg Fine
				push esi								; incremento le consonanti
				push edx
				mov edx, dword ptr[ebp + 16]
				mov esi, dword ptr[edx]
				inc esi
				mov dword ptr[edx], esi
				pop edx
				pop esi
						jmp Fine
		Fine:			
ret
Vocale endp
end