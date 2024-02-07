.model small
.stack 100h
.data
msg db 0dh,0ah, "Enter your num:$"
msg_2 db 0dh,0ah, "Enter Divident:$"
msg_3 db 0dh,0ah, "Result:$" 
msg_4 db 0dh,0ah,"Reminder:$"
a db 0
b db 0
c db 0
d db 0

.code
main proc
    
  mov ax,@data
  mov ds,ax 
  mov dx,0
   
  mov ax,80
  mov bx,9
  div bx
  mov a,dl ;reminder 
  mov b,al ;result
  
  
  mov ah,9
  lea dx,msg_4
  int 21h
  
  mov ah,2 
  mov dl,a
  add dl,48
  int 21h
  
  mov ah,9
  lea dx,msg_3
  int 21h
  
  mov ah,2
  mov dl,b
  add dl,48
  int 21h
  
  
  
 
  
 
  
  mov ah,4ch
  int 21h

    main endp
end main