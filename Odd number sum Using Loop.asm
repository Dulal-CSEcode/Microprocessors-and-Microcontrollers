.model SMALL
.stack 100h
.DATA
msg db "Enter your Num:$"
i db 1
n dw ?
sum dw ?
m dw ?
nl db 10,13,'$'
.Code 
main proc
MOV ax,@DATA
MOV ds,ax

mov ah,9
lea dx,msg
int 21h

 ;Using Loop
 mov ah,1
 int 21h
 sub ax,48
 mov ah,0
 mov m,ax 

 xor ax,ax          
 mov bx,m
 mov cx,50
 mov n,cx
 
 SumOfOdd:
  add ax,bx
  inc bx
  inc bx
  Loop SumOfOdd  
  mov sum,ax

mov ah,4CH
int 21H
main endp
end main

