.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\masm32rt.inc
include \masm32\include\user32.inc

.data
factN DWORD 9  ;; n -- Change this to what you want!
result byte 8 DUP(?)

.code
main PROC
	mov ecx, factN
	
	mov eax, ecx
	dec ecx
	
	lp:
	mul ecx  ; eax*ecx
	
	dec ecx 
	cmp ecx, 1
	ja lp
	
	e:
	invoke dwtoa, eax, addr result  ;; Convert our product to a string
	invoke StdOut, addr result ;; Print the string
	
	inkey
	ret

main ENDP
END main