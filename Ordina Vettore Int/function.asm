.586
.model flat
.code

_OrdinaVettore proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push edx
	; Corpo Funzione		(vettore, lunghezza)
						mov ebx, dword ptr[ebp + 8]				; vettore
						mov esi, 0
						mov edi, 1
						mov ecx, dword ptr[ebp + 12]

			Ciclo:
						cmp edi, dword ptr[ebp + 12]
						je Check									; Ho ordinato il vettore
						mov edx, dword ptr[ebx + esi*4]
						cmp edx, dword ptr[ebx + edi*4]
						jg Scambia
						inc edi
						inc esi
						jmp Ciclo
			Scambia:
						push ecx
						mov ecx, dword ptr[ebx + edi*4]
						mov dword ptr[ebx + edi*4], edx
						mov dword ptr[ebx + esi*4], ecx
						pop ecx
						inc esi
						inc edi
						jmp Ciclo

			Check:											
						dec ecx										; passo sul vettore fino al n-1
						cmp ecx, 0
						je Next
						mov esi, 0
						mov edi, 1
						jmp Ciclo

			Next:
						mov esi, dword ptr[ebp + 12]
						dec esi
						mov eax, dword ptr[ebx + esi*4]
			Fine:
	; Fine Funzione
pop edx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_OrdinaVettore endp
end