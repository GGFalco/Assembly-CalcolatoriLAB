.586
.model flat
.code

_BubbleSort proc
push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
	; Corpo Funzione		(vettore, lunghezza)
							mov ebx, dword ptr[ebp + 8]			; vettore
							mov edx, dword ptr[ebp + 12]		; lunghezza
							dec edx
							mov esi, 0
							mov edi, 1

				Ciclo:
							mov eax, dword ptr[ebx + esi*4]		; prelevo il primo numero [i]
																; [i + 1]
							cmp esi, edx						; se sono alla fine del vettore mi fermo e RIPETO
							je Ripeti
							

							cmp eax, dword ptr[ebx + edi*4]
							jg Scambia							; porto in fondo il piu grande

							inc esi
							inc edi
							jmp Ciclo
							
				Scambia:
							mov ecx, dword ptr[ebx + edi*4]		; prendo [i + 1]
							mov dword ptr[ebx + edi*4], eax		; metto in [i + 1] <- [i] poichè piu grande
							mov dword ptr[ebx + esi*4], ecx		; [i] <- [i + 1] che mi sono preso in ECX
							inc esi								; ripristino esi com'era prima
							inc edi
							jmp Ciclo							; torno al ciclo
				Ripeti:
							dec edx
							cmp edx, -1
							je Fine
							mov esi, 0
							mov edi, 1
							jmp Ciclo

					
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
_BubbleSort endp
end