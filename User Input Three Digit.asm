;Input double digit:
org 100h
.model small
.stack 100h
.data 
msg db "Enter Your Three Digit Number:$"
msg_1 db "Output Triple Digit:$"
nl db 0dh,0ah,"$"
.code
;Double digit input
main proc
mov ax,@data
mov ds,ax 

mov ah,9
lea dx,msg
int 21h  

;1st digit
mov ah,1
int 21h
mov bl,al

;2nd digit
mov ah,1
int 21h
mov bh,al

;3rd digit
mov ah,1
int 21h
mov cl,al

;newline
mov ah,9
lea dx,nl
int 21h

;Print output msg
mov ah,9
lea dx,msg_1
int 21h

mov ah,2
mov dl,bl
int 21h

mov dl,bh
int 21h
mov dl,cl
int 21h

main endp
end main