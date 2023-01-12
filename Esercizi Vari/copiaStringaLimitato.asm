.586
.model flat
.code

_copiaStringaLimitato proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
	; Corpo funzione		(dest, source, limite)

							mov eax, dword ptr[ebp + 8]
							mov ebx, dword ptr[ebp + 12]
							mov esi, 0
				Ciclo:
							cmp esi, dword ptr[ebp + 16]
							je Fine
							mov cl, byte ptr[ebx + esi]
							mov byte ptr[eax + esi], cl
							inc esi
							jmp Ciclo
				Fine:
							mov dword ptr[eax + esi], 0

	; Fine Funzione
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_copiaStringaLimitato endp
end