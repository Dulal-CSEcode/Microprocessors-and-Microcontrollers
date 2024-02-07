org 100h
.model small
.data
num db 10 ; To store the user's input

msg db "Enter a number: $"
msg_odd db "Number is odd$"
msg_even db "Number is even$"
nl db 0dh,0ah,"$"

.code
main proc
 mov ax, @data
 mov ds, ax

 ; Display message for user input
 mov ah, 9
 lea dx, msg
 int 21h

 ; Input for the number
 mov ah, 1
 ;mov dx, 0 ; Clear DX to read a two-digit number
 int 21h
; sub al, '0' ; Convert ASCII digit to binary
 ;mov num, al ; Store the user's input in 'num'

 
 mul num
 mov bl,al
  
 mov ah,1
 int 21h 
 add bl,al 
 
 ; Check if the number is even or odd
 and bl, 1
 
 ;newline
 mov ah,9
 lea dx,nl
 int 21h

 jz even   ; Jump if the result is 0 (even)
 odd:
   mov ah, 9
   lea dx, msg_odd
   int 21h
   ;jmp done 
   ret

 even:
   mov ah, 9
   lea dx, msg_even
   int 21h
   ret

 done:
   ; Your program continues here

main endp
end main
