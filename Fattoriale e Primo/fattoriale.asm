.586
.model flat
.code

_fattoriale proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
	; Corpo Funzione
						mov eax, dword ptr[ebp + 8]			; N
						mov ecx, eax						; mi salvo N
						mov ebx, eax						; Inizio a fare la moltiplicazione
						dec ebx
			Ciclo:
						cmp ebx, 1
						je Fine
						mul ebx
						dec ebx
						jmp Ciclo
			Fine:	
	; Fine Funzione
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_fattoriale endp
end
