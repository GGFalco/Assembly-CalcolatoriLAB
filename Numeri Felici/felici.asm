.586
.model flat
.code

_Felice proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push edx
	; Corpo Funzione
							mov eax, dword ptr[ebp + 8]			; NUMERO
							cmp eax, 4
							je Infelice
							call Lunghezza						; mi calcolo quante cifre ha il numero
							mov esi, 10
							mov ebx, 0
			Ciclo:
							cmp edi, 0							; l'iterazione termina quando l'ho fatta per tutte le cifre del numero (EDI)
							je Next

							CDQ						
							idiv esi							; prendo l'ultima cifra: 123 / 10 = 12 RESTO 3 quindi l'ultima cifra ce l'ho in (EDX)
							push eax							; quoziente in 123 / 10 = 12 che si trova in (EAX)
							mov eax, edx						; metto il resto in eax per elevarlo al quadrato			
							mov edx, 0							; prima di elevarlo azzero edx
							imul eax							; elevo
							add ebx, eax						; in ebx mi salvo le somme dei quadrati delle cifre
							pop eax	

							dec edi								; decremento la lunghezza del numero che ora è 123 / 12 = (12) in EAX
							jmp Ciclo							; ripeto il procedimento

			Next:
							cmp ebx, 1
							je Felice
							mov eax, ebx
							mov ebx, 0
							call Lunghezza
							jmp Ciclo

			Felice:
							mov eax, 1
							jmp Fine
			Infelice:
							mov eax, 0
							jmp Fine
			Fine:
	; Fine Funzione
pop edx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_Felice endp


Lunghezza proc
push ebx
push edx
			mov ebx, eax				; mi salvo eax perche dopo viene sovrascritto
			mov esi, 10
			mov edi, 1
	Ciclo:
			CDQ
			idiv esi
			cmp eax, 0
			je Fine
			inc edi
			jmp Ciclo
	Fine:
			mov eax, ebx
pop edx
pop ebx
ret
Lunghezza endp

end