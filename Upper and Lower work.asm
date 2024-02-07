.model small
.stack 100h
.data
msg db 0dh,0ah, "UpperCase Char:$"
msg_2 db 0dh,0ah, "Enter your 2nd Num:$"
msg_3 db 0dh,0ah, "Output:$"
a db 0
b db 0 
char db ?,'$'

.code
main proc
  mov ax,@data
  mov ds,ax
  
  mov ah,9
  lea dx,msg
  int 21h
  
  mov ah,1
  int 21h
  
  add al,20h  ;add 20h upper convert to lower
  mov char,al
  
  mov ah,9
  lea dx,msg_3
  int 21h 
  
  mov ah,2
  mov dl,char
  int 21h
  
  ;char is now lower this convert to upper
  sub char,20h
  mov ah,2
  mov dl,char
  int 21h
  
  
 
  
  mov ah,4ch
  int 21h

    main endp
end main