.586
.model flat
.code

_SommaModuli proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione		(src, lunghezza, dest, divisore)
							mov ebx, dword ptr[ebp + 8]			; vettore
							mov edi, dword ptr[ebp + 20]		; divisore
							mov esi, 0
							mov edx, 0
							mov ecx, 0

				Ciclo:
							cmp esi, dword ptr[ebp + 12]
							je Next

							mov eax, dword ptr[ebx + esi*4]		; prelevo il numero
							CDQ
							
							idiv edi							; lo divido per il divisore
							add ecx, edx						; sommo i resti
							mov eax, dword ptr[ebp + 16]		
							mov dword ptr[eax + esi*4], edx		; salvo il dest i resti
							mov edx, 0
									
							inc esi
							jmp Ciclo
				Next:
				Fine:
							mov eax, ecx
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_SommaModuli endp
end