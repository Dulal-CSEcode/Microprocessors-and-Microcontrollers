org 100h
.model small
.stack 100h
.data
n1 db "Enter num1 :$"
n2 db "Enter num2 :$"
msg_1 db "Number num1 is greater than Number num2$"
msg_2 db "Number num2 is greater than Number num1$"
nl db 0dh,0ah,"$"

.code
;String print
main proc
mov ax,@data
mov ds,ax 

mov ah,9
lea dx,n1
int 21h

;input
mov ah,1
int 21h
mov bl,al

;newline
mov ah,9
lea dx,nl
int 21h

mov ah,9
lea dx,n2
int 21h

mov ah,1
int 21h
mov bh,al

 

;newline
mov ah,9
lea dx,nl
int 21h

;if conditon
cmp bl,bh


JA L1

mov ah,9
lea dx,msg_2
int 21h
ret

L1:
mov ah,9
lea dx,msg_1
int 21h
ret


main endp
end main
