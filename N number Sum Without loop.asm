.model SMALL
.stack 100h
.DATA
msg db "Enter your Num:$"
n db ?
sum db ?
nl db 10,13,'$'
.Code 
main proc
MOV ax,@DATA
MOV ds,ax

mov ah,9
lea dx,msg
int 21H

;sum=n*(n+1)/2
mov ah,1
int 21H 
mov ah,0
sub al,48
mov n,al
add al,1
mul n 

mov bl,2
div bl

mov sum,al

add al,48
add ah,48

mov bx,ax

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

