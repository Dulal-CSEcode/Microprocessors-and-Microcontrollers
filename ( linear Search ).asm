;; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
 org 100h
.model small
.data   

num db 1,2,3,4,5

  msg1 db "found $"
  msg2 db "not found $"  
  key db 3
  print macro msg
    mov ah,09h
    lea dx,msg
    int 21h
    endm
.code  

main  proc 
 
    mov ax,@data
    mov ds,ax 
    lea si,num
    mov cx,05
    mov al,key 
    
 here:
    mov bl ,[si]
     cmp al,bl
     jz found 
     inc si
     loop here
         print msg2   
         
     found:
     print msg1
     .exit  
 
   end main
