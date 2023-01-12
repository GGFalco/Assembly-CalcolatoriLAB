.586
.model flat
.code

_ConcatenaStringaLimitata proc
push ebp 
mov ebp,esp
push esi
push edi
push ebx
push ecx
	; Corpo Funzione		(dest, source, limite)
						
							mov eax, dword ptr[ebp + 8]
							mov ebx, dword ptr[ebp + 12]
							mov esi, 0
							mov edi, 0
							call StrLen
				Ciclo:
							cmp esi, edi
							je Fine
							cmp esi, dword ptr[ebp + 16]
							je Fine
							mov cl, byte ptr[ebx + esi]
							mov byte ptr[eax + edi], cl
							inc esi
							inc edi
							jmp Ciclo
							
				Fine:
							mov byte ptr[eax + edi], 0
							
	; Fine Funzione
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_ConcatenaStringaLimitata endp

StrLen proc
				Ciclo:
						cmp byte ptr[eax + edi], 0
						je Fine
						inc edi
						jmp Ciclo
		Fine:
ret
StrLen endp

end