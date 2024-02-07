.model SMALL
.stack 100h
.DATA
msg db "Enter your Num:$"
i db 1
n db ?
sum dw ?
m db ?
nl db 10,13,'$'
.Code 
main proc
MOV ax,@DATA
MOV ds,ax

mov ah,9
lea dx,msg
int 21H

mov ah,1
int 21h
sub al,48

mov cx,0
mov cl,al

mov bx,0

mov ax,0

su:
 mov al,i
 mul al
 add bx,ax
 inc i
 Loop su
 
 mov sum,bx
 

;new line
mov ah,9
lea dx,nl
int 21H

mov ah,2
mov dl,bh
int 21H  

mov ah,2
mov dl,bl
int 21h

mov ah,4CH
int 21H
main endp
end main

