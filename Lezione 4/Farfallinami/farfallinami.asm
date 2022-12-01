.586
.model flat
.code

_farfallinami proc

push ebp
mov ebp, esp
push edi
push esi
push ebx
push ecx
push edx
	; Corpo Funzione
						mov edx, 0
						mov dl, byte ptr[ebp+16]
						cmp dl, 'a'
						je Next
						cmp dl, 'e'
						je Next
						cmp dl, 'i'
						je Next
						cmp dl, 'o'
						je Next
						cmp dl, 'u'
						jne NonVocale
			Next:
						mov esi, 0
						mov ebx, 0
						mov ebx, dword ptr[ebp+8]
						mov ecx, 0
						mov ecx, dword ptr[ebp+12]
			
			Ciclo:
						mov al, byte ptr[ebx+esi]
						cmp al, 0
						je Fine
						cmp al, 'a'
						je CopioInS2
						cmp al, 'e'
						je CopioInS2
						cmp al, 'i'
						je CopioInS2
						cmp al, 'o'
						je CopioInS2
						cmp al, 'u'
						je CopioInS2
						mov byte ptr[ecx + esi], al	; s2
						inc esi
						jmp Ciclo
			CopioInS2:
						mov byte ptr[ecx + esi], dl ; s2
						inc esi
						jmp Ciclo
			NonVocale:
						mov esi, 0
						mov ebx, 0
						mov ebx, dword ptr[ebp+8]	; s1
						mov ecx, 0
						mov ecx, dword ptr[ebp+12]	; s2
			CicloNonVocale:
						mov al, byte ptr[ebx+esi]
						cmp al, 0
						je Fine
						mov byte ptr[ecx+esi], al	; s2
						inc esi
						jmp CicloNonVocale
			Fine:
						mov byte ptr[ecx + esi], al
	; Fine Funzione
pop edx
pop ecx
pop ebx
pop esi
pop edi
mov esp, ebp
pop ebp
ret
_farfallinami endp
end
