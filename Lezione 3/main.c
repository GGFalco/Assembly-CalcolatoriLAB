#include <stdio.h>

//int somma(int a,int b);
int scambia(int *a, int *b);

int main(void) {
	
	int a = 5, b = 7;
	scambia(&a, &b);
	printf("a=%d,b=%d", a, b);
	
}

//__declspec(naked) somma(int a, int b) {   // Non deve fare nulla in questa funzione 
//										// La scriviamo in assembly
//	__asm {
//		push ebp
//		mov ebp, esp  // barriera
//		push edi	  // registri che devo salvare
//		push esi
//		push ebx
//						// per la convenzione il ritorno deve essere in eax
//		mov eax, dword ptr[ebp+8] // parametro a
//		add eax, dword ptr[ebp+12] // parametro b
//
//
//		pop ebx		// mov ebx, [esp]
//		pop esi
//		pop edi
//		mov esp,ebp // torno alla parriera
//		pop ebp     // mov ebp, [esp] & add esp,4
//		ret
//	}
//
//}


//__declspec(naked) scambia(int *a, int *b) {   // Non deve fare nulla in questa funzione 
//										// La scriviamo in assembly
//	__asm {
//		push ebp
//		mov ebp,esp
//		push ebx
//		push esi
//		push edi
//
//					// Leggo
//			mov ebx, dword ptr [ebp+8]
//		mov eax, dword ptr [ebx] // valore 5
//			mov ebx, dword ptr [ebp + 12] 
//		mov ecx, dword ptr [ebx] // valore 7
//
//				   // Scambio
//		mov ebx, dword ptr[ebp+8]
//			mov dword ptr [ebx],ecx
//		mov ebx, dword ptr [ebp+12]
//			mov dword ptr [ebx], eax
//
//		mov eax,0
//
//		pop edi
//		pop esi
//		pop ebx
//		mov esp, ebp
//		pop ebp
//		ret
//	}
//}