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
	; Corpo Funzione		(stringa, vocali, consonanti)
					
							mov ebx, dword ptr[ebp + 8]			; stringa
							mov edi, 0		; vocali
							mov edx, 0		; consonanti
							call toLower
							mov esi, 0
							mov eax, -3
				Ciclo:
							mov cl, byte ptr[ebx + esi]
							cmp cl, 0
							je Next

							cmp cl, 'a'
							jl Avanza
							cmp cl, 'z'
							jg Avanza
							call VocaleOConsonante
				Avanza2:				
							inc esi
							jmp Ciclo
				Avanza:
							cmp cl, ' '
							je Avanza2
							mov eax, 0
							jmp Avanza2

		Punto1:
							cmp edx, 0
							jne Next2
							mov eax, -1
							jmp Fine
		Next:	
							cmp edi, 0
							je Punto1
		Next2:
							cmp eax, 0							; se uguale a 0 contiene un simbolo
							je Fine
							mov eax, -2
							jmp Fine
							
		Fine:
							mov ebx, dword ptr[ebp + 12]
							mov dword ptr[ebx], edi

							mov ebx, dword ptr[ebp + 16]
							mov dword ptr[ebx], edx
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

VocaleOConsonante proc

			cmp cl, 'a'
			je Vocale
			cmp cl, 'e'
			je Vocale
			cmp cl, 'i'
			je Vocale
			cmp cl, 'o'
			je Vocale
			cmp cl, 'u'
			je Vocale
			
			inc edx
			jmp Fine
			
	Vocale:
			
			inc edi
	Fine:
ret
VocaleOConsonante endp


toLower proc
push esi
push ecx
					mov esi, 0
		Ciclo:
					mov cl , byte ptr[ebx + esi]
					cmp cl, 0
					je Fine
					cmp cl, 'A'
					jge Check
					mov eax, 10
		Ritorno:
					inc esi
					jmp Ciclo
		Check:
					cmp cl, 'Z'
					jg Ritorno
					add cl, 'a' - 'A'
					mov byte ptr[ebx + esi], cl
					jmp Ritorno
		Fine:
pop ecx
pop esi
ret
toLower endp

end