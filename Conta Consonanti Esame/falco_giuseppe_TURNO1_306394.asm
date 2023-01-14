.586
.model flat
.code

_contaconsonanti proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione			(stringa, aggiuntivo)
							mov ebx, dword ptr[ebp + 8]
							mov esi, 0
							mov edi, 0							; qui tengo conto della SOMMA delle CONSONANTI minuscole
							mov eax, 0
							mov ecx, 0
			Ciclo:
			
							
							cmp byte ptr[ebx + esi], 0
							je Fine

							cmp byte ptr[ebx + esi], 'A'
							jl Salta
							cmp byte ptr[ebx + esi], 'Z'
							jg Minuscolo
			
							call Vocale

			Salta:
							inc esi
							jmp Ciclo

			Minuscolo:
							cmp byte ptr[ebx + esi], 'a'
							jl Salta
							cmp byte ptr[ebx + esi], 'z'
							jg Salta

								
							call Vocale
			
							cmp edx, 0						; si tratta di una vocale minuscola
							je Salta
							mov cl, byte ptr[ebx + esi]
							add edi, ecx					; incremento la somma della consonante minuscola
							
							jmp Salta

			Fine:
							mov ebx, dword ptr[ebp + 12]
							mov dword ptr[ebx], edi
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_contaconsonanti endp

Vocale proc
	
	Ciclo:
			cmp byte ptr[ebx + esi], 'A'
			je Vocalee
			cmp byte ptr[ebx + esi], 'a'
			je Vocalee
			cmp byte ptr[ebx + esi], 'E'
			je Vocalee
			cmp byte ptr[ebx + esi], 'e'
			je Vocalee
			cmp byte ptr[ebx + esi], 'I'
			je Vocalee
			cmp byte ptr[ebx + esi], 'i'
			je Vocalee
			cmp byte ptr[ebx + esi], 'o'
			je Vocalee
			cmp byte ptr[ebx + esi], 'O'
			je Vocalee
			cmp byte ptr[ebx + esi], 'u'
			je Vocalee
			cmp byte ptr[ebx + esi], 'U'
			je Vocalee

			mov edx, 1						; edx = 1 significa che è oltre ad essere minuscola, è una consonante
			inc eax							; incremento le consonanti
			jmp Fine

	Vocalee:
			mov edx, 0						; vocale minuscola
	Fine:
ret
Vocale endp

end