.586
.model flat
.code

_moltiplicasigned proc
	
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ebx
	push ecx
		; Corpo Funzione
			mov eax, 0
			mov ebx, 0
			mov ecx, 0
			mov ebx, dword ptr[ebp + 8]
			mov ecx, dword ptr[ebp + 12]
				
				; Controllo il segno dell'operazione
			cmp ebx, 0
			jl Aneg		
			cmp ecx, 0
			jl Discordi       ; a > 0 e b < 0
			jmp Concordi	  ; a > 0 e b > 0
		Aneg:				  ; a < 0 e b > 0
			cmp ecx, 0
			jl ConcordiDaNeg  ; a < 0 e b < 0
			neg ebx			  ; a < 0 e b > 0
			call moltiplico
			neg eax
			jmp Fine
		ConcordiDaNeg:		  ; a < 0 e b < 0
				neg ebx
				neg ecx
				call moltiplico
				jmp Fine
		Concordi:			  ; a > 0 e b > 0
				call moltiplico
				jmp Fine
		Discordi:			  ; a > 0 e b < 0
				neg ecx
				call moltiplico
				neg eax
				jmp Fine
		Fine:
		; Fine Funzione
	pop ecx
	pop ebx
	pop edi
	pop esi
	mov esp, ebp
	pop ebp
	ret
_moltiplicasigned endp

moltiplico proc
push esi
	mov esi, 0
	Ciclo:
			cmp esi, ecx
			je FineCiclo
			inc esi
			add eax, ebx
			jmp Ciclo
	FineCiclo:
pop esi
ret
moltiplico endp
end