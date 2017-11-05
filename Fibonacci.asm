.386
.model flat, stdcall
option casemap :none

include \masm32\include\kernel32.inc
include \masm32\include\masm32rt.inc
include \masm32\include\user32.inc

.data
fibN DWORD 9  ;; n -- Change this to what you want!
result byte 4 DUP(?)

.code
main PROC
	mov ecx, fibN  ; nth fibonacci number
	
	mov eax, 1  ; set the initial sum
	mov ebx, 0  ; initialize preceding num
	
	cmp ecx, 1  ; Special case if n=1
	je e
	
	cmp ecx, 2  ; Special case if n=2
	je e
	
	sub ecx, 2  ; Disregard these special cases in lp

	
	lp:
	mov edx, eax  ; Use temp register for subtracting
	sub edx, ebx  ; Subtract to get preceding num in sequence
	
	mov ebx, edx  ; Move result to the preceding num register
	add eax, ebx  ; Add cur and preceding num to get next in sequence
	
	dec ecx  ; Decrement n
	cmp ecx, 0  
	ja lp  ; Loop if not yet zero

	
	e:
	invoke dwtoa, eax, addr result  ;; Convert our sum to a string
	invoke StdOut, addr result ;; Print the string
	
	inkey
	ret

main ENDP
END main