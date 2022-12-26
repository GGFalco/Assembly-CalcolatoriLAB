.586
.model flat
.code

_StringSuffix proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione			(str, suffix)

							mov ebx, dword ptr[ebp + 8]			
							call StrLen
							mov edx, edi
							dec edx
							mov eax, dword ptr[ebp + 8]			; STR
							mov ebx, dword ptr[ebp + 12]		; SUFFIX
							call Strlen
							; in EDI lunghezza del suffisso in EDX lunghezza str
							mov esi, 0
				Ciclo:
				push ebx
				mov ebx, edx
				add ebx, edi
							mov cl , byte ptr[eax + edx]
							mov byte ptr[eax + ebx], cl			; prendo l'ultimo carattere e lo sposto
				pop ebx
							cmp edx, 0
							jl Next
							inc esi
							dec edx
							jmp Ciclo
				Next:
							mov esi, 0
				Copia:
							cmp esi, edi
							je Fine
							mov cl, byte ptr[ebx + esi]
							mov byte ptr[eax + esi], cl
							inc esi
							jmp Copia
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
_StringSuffix endp

StrLen proc
				mov edi, 0

		Ciclo:
				cmp byte ptr[ebx + edi], 0
				je Fine
				inc edi
				jmp Ciclo
		Fine:
ret
StrLen endp


end

