org 100h
.model small
.stack 100h

.data
 m1 db "Enter your Name:$" ;ekhane jodi dollar sign nah dewa hoy
;tahole output asbe nah 
m2 db "Output value:$"
;new line
nl db 0Dh,0Ah,"$"

.code

main proc
 mov ax,@data
 mov ds,ax 
 ;Display shows msg
 mov ah,9
 lea dx,m1
 int 21h
 ;intput value
 mov ah,1
 mov bl,al
 int 21h
 
 mov ah,9
 lea dx,nl
 int 21h
 
 mov ah,9
 lea dx,m2
 int 21h
 
 mov ah,2
 mov dl,bl
 int 21h
    
    
main endp


end main