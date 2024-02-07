org 100h
.model small
.stack 100h
.data
num1 db 21
num2 db 20
msg_1 db "Number 1 is greater than Number 2$"
msg_2 db "Number 1 is less than Number 2$"
msg_3 db "Both number is Equal$"



.code
;String print
main proc
mov ax,@data
mov ds,ax

;if conditon
mov al,num1
mov bl,num2
cmp al,bl


JA L1
JB L2
JE L3

L1:
mov ah,9
lea dx,msg_1
int 21h
ret

L2:
mov ah,9
lea dx,msg_2
int 21h
ret

L3:
mov ah,9
lea dx,msg_3
int 21h
ret

main endp
end main
