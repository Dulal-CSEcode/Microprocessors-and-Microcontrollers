org 100h
.model small
.stack 100h
.data
c1 dw "Enter Your 1st char:$"
c2 dw "Enter Your 2nd char:$"
c3 dw "Sorted Order:$"
emsg dw "This is Even Number$"
omsg dw "This is Odd Number$"
next db 0dh,0ah,"$" ;New line and cret

.code
;String print
main proc
mov ax,@data
mov ds,ax

;Print First msg
mov ah,9
lea dx,c1
int 21h

mov ah,1
int 21h
mov bl,al

;new line
mov ah,9
lea dx,next
int 21h

;Print 2nd msg
mov ah,9
lea dx,c2
int 21h

mov ah,1
int 21h
mov bh,al

;new line
mov ah,9
lea dx,next
int 21h


;Print 3rd msg
mov ah,9
lea dx,c3
int 21h

;condition
cmp bl,bh

JB L1;JB means the value is blow here check bl<bh
; if this condition is true then go to L function
;otherwise print under this value
mov ah,2
mov dl,bh
int 21h

mov ah,2
mov dl,bl
int 21h
ret

L1:
mov ah,2
mov dl,bl
int 21h

mov ah,2
mov dl,bh
int 21h
ret



main endp
end main