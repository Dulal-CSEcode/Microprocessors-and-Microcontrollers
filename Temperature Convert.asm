org 100h
.model small
.stack 100h
.data
F dw ?
C dw ?
;msg_c db "Enter Your Celsius:$"
;msg_f db "Enter Your Fahrenheit:$" 
;ot1 db "C to F temperature:$"
;ot2 db "F to C temperature:$"

  nl db 0Dh,0Ah,"$" 
.code
main proc 
 mov ax,@data 
 mov ds,ax 
 ;F=c*9/5+32-1
 ;C=(F-32)*5/9+1

 ;display name msg
 ;mov ah,9
 ;lea dx,msg_c
 ;int 21h 
 
 ;Read user from name
 
 ;Read user from Celcius
 mov ax,260
 mov bx,9
 mul bx
 mov bx,5
 div bx
 add ax,32
 sub ax,1
 mov F,ax
 
; Read user From Fahrenheit
mov ax,1000
sub ax,32
mov bx,5
mul bx
mov bx,9
div bx
add ax,1
mov C,ax

 
 
  
 
 
    
    
main endp
end main

