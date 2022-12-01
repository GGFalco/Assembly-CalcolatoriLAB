.586
.model flat
.code

; numero

_primo proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push edx
	; Corpo Funzione
					mov eax, dword ptr[ebp + 8]				; Numero
					mov esi, 2

	Ciclo:			
					cmp esi, eax
					je Primo
					CDQ
					idiv esi
					cmp edx, 0
					je NonPrimo
					mov eax, dword ptr[ebp + 8]
					inc esi
					jmp Ciclo		

	NonPrimo:
					mov eax, 0
					jmp Fine
	Primo:
					mov eax, 1
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
_primo endp
end