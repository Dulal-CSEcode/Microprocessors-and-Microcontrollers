.model small
.stack 100h
.data
msg db 0dh,0ah, "Enter your 1st num:$"
msg_2 db 0dh,0ah, "Enter your 2nd Num:$"
msg_3 db 0dh,0ah, "Output:$"
a db 0
b db 0

.code
main proc
  mov ax,@data
  mov ds,ax
  
  mov ah,9
  lea dx,msg
  int 21h
  
  mov ah,1
  int 21h
  mov a,al
  
  mov ah,9
  lea dx,msg_2
  int 21h
  
  mov ah,1
  int 21h
  mov b,al
  
  add al,a
  mov ah,0
  aaa
  
  add al,48
  add ah,48
  
  mov bx,ax
  
  mov ah,9
  lea dx,msg_3
  int 21h
  
  mov ah,2
  mov dl,bh
  int 21h
  
  mov ah,2
  mov dl,bl
  int 21h 
  
  mov ah,4ch
  int 21h

    main endp
end main