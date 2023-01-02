.586
.model flat
.code

_ToUpper proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione
							mov ebx, dword ptr[ebp + 8]
							mov esi, 0

			Ciclo:
							cmp byte ptr [ebx + esi], 0
							je Fine
							cmp byte ptr[ebx + esi], 'a'
							jl Continua
							cmp byte ptr[ebx + esi], 'z'
							jg Continua
							mov cl, byte ptr[ebx + esi]
							add cl, 'A' - 'a'
							mov byte ptr[ebx + esi], cl
							inc esi
							jmp Ciclo
			Continua:
							inc esi
							jmp Ciclo
			Fine:
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_ToUpper endp
end