.586
.model flat
.code

_TogliDispari proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push edx
	; Corpo Funzione			(vettore, lunghezza)
							mov ebx, dword ptr[ebp + 8]		; vettore
							mov esi, 1
							mov dl, 2
				Ciclo:
							cmp esi, dword ptr[ebp + 12]
							je Fine
							mov al, byte ptr[ebx + esi]		
							CBW
				
							div dl
					
							cmp ah, 0
							jne Dispari
		NonSostituire:		
							inc esi
							jmp Ciclo


				Dispari:
							mov edi, esi
							dec edi
					push eax
							mov al, byte ptr[ebx + edi]
							CBW

							div dl
					

							cmp ah, 0
							jne NonSostituire				; il numero successivo è dispari
							mov cl, byte ptr[ebx + edi]
					pop eax
							mov edi, esi
							inc edi
					push eax
							mov al, byte ptr[ebx + edi]
							CBW

							div dl
					
							cmp ah, 0
							jne NonSostituire				; il numero successivo è dispari
							add cl, byte ptr[ebx + edi]		; mi preparo per fare la media
								
							mov al, cl
							CBW
					
							div dl
							
							call CheckMedia

							mov byte ptr[ebx + esi], al
							inc esi
							jmp Ciclo
				Fine:
							mov eax, 0
	; Fine Funzione
pop edx
pop ebx
pop edi
pop esi
mov esp, ebp
pop ebp
ret
_TogliDispari endp

CheckMedia proc
push ecx
				mov cl, al				; mi salvo la media

				CBW
				div dl

				cmp ah, 0
				jne Dispari
				mov al, cl
				jmp Fine
		Dispari:
				add cl, 1
				mov al, cl
		Fine:
pop ecx
ret
CheckMedia endp

end