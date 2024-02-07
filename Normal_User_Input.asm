org 100h
.model small
.data
n1 db 20
n2 db 20

msg_1 db "Enter 1st Num:$" 
msg_2 db "Enter 2nd Num:$"
ot db "Output:$"

nl db 0dh,0ah,"$"

.code
main proc 
 mov ax,@data
 mov ds,ax
 
 ;Print first msg
 mov ah,9
 lea dx,msg_1
 int 21h
 
 ;input 1st two digit
 mov ah,1 
 int 21h
 mov n1,al
 mov bl,n1
 
 ;new line
 mov ah,9
 lea dx,nl
 int 21h
 

 ;Print 2nd msg
 mov ah,9
 lea dx,msg_2
 int 21h 
 
 ;input 2nd two digit
 mov ah,1
 int 21h
 mov n2,al 
 mov bh,n2
 
 ;new line
 mov ah,9
 lea dx,nl
 int 21h
 
 ;Print the output
 
 mov ah,9
 lea dx,ot
 int 21h
 
 mov ah,2
 mov dl,n1
 int 21h
 mov dl,n2
 int 21h 
 
 add bh,bl
 sub bh,48
 mov ah,9
 lea dx,nl
 int 21h
 
 mov ah,2
 mov dl,bh
 int 21h
 
 
 
    
main endp
end main
