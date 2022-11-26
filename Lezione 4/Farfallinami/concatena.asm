.586
.model flat
.code


_concatena proc

push ebp
mov ebp, esp
push esi
push edi
push ebx
push ecx
push edx
    ; Corpo Funzione
                mov ebx, dword ptr[ebp+20]
                cmp ebx, 0
                je Mode0
                cmp ebx, 1
                je Mode1
                cmp ebx, 3
                je Mode3

    Mode1:                                  ; Concateno s2 ad s1
                mov esi, 0
                mov edi, 0
                mov ebx, 0
                mov ebx, dword ptr[ebp+8]   ; s1
                mov edx, 0
                mov edx, dword ptr[ebp+12]  ; s2
                mov eax, 0
                mov eax, dword ptr[ebp+16]  ; s3
    Ciclo1S1:
                mov cl, byte ptr[ebx+esi]       ; carattere s1
                cmp cl, 0
                je Ciclo1S2
                mov byte ptr[eax+esi], cl       ; inserisco s3
                inc esi
                jmp Ciclo1S1
    Ciclo1S2:
                mov cl, byte ptr[edx+edi]       ; carattere s2
                cmp cl, 0
                je Fine
                mov byte ptr[eax + esi], cl     ; inserisco s3
                inc esi
                inc edi
                jmp Ciclo1S2   

    Mode0:                                      ; Concateno s1 ad s2
                mov esi, 0
                mov edi, 0
                mov ebx, 0
                mov ebx, dword ptr[ebp+8]   ; s1
                mov edx, 0
                mov edx, dword ptr[ebp+12]  ; s2
                mov eax, 0
                mov eax, dword ptr[ebp+16]  ; s3
    Ciclo0S2:
                mov cl, byte ptr[edx + esi]     ; carattere s2
                cmp cl, 0
                je Ciclo0S1
                mov byte ptr [eax + esi], cl
                inc esi
                jmp Ciclo0S2
    Ciclo0S1:
                mov cl, byte ptr[ebx + edi]     ; carattere s1
                cmp cl, 0
                je Fine
                mov byte ptr [eax + esi], cl    ; inserisco s3
                inc esi
                inc edi
                jmp Ciclo0S1
    Mode3:
                mov esi, 0
                mov edi, 0
                mov ebx, 0
                mov ebx, dword ptr[ebp+8]   ; s1
                mov edx, 0
                mov edx, dword ptr[ebp+12]  ; s2
                mov eax, 0
                mov eax, dword ptr[ebp+16]  ; s3
                call lunghezza      ; lunghezza in esi
                call trovameta      ; la metà ce l'ho in edi
                mov esi, 0
    Ciclo3S1:
                mov cl, byte ptr[ebx+esi]
                cmp esi, edi
                je Next3S2
                mov byte ptr[eax + esi], cl
                inc esi
                jmp Ciclo3S1
    
    Next3S2:    
                mov ebx, edx        ; metto in ebx s2
                mov edx, esi        ; mi salvo dove sono arrivato a scrivere in s3
                mov esi, 0
                call lunghezza      ; lunghezza in esi
                mov edi, 0          ; ripristino la metà
                call trovameta      ; metà in edi
                mov esi, 0          ; azzero la lunghezza che non  mi serve piu
    Ciclo3S2:
                mov cl, byte ptr[ebx+esi]
                cmp esi, edi
                je Fine3
                mov byte ptr[eax +edx], cl
                inc esi
                inc edx
                jmp Ciclo3S2
    Fine3:
                mov byte ptr[eax + edx], 0
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
_concatena endp


trovameta proc
    Ciclometa:
            cmp esi, 0
            jle FineMeta
            sub esi, 2
            inc edi         ; indice della metà
            jmp CicloMeta
    FineMeta:
            ret
trovameta endp

lunghezza proc

Ciclo:  mov cl, byte ptr[ebx+esi]
        cmp cl, 0
        je Fine
        inc esi
        jmp Ciclo
Fine:
ret

lunghezza endp




End