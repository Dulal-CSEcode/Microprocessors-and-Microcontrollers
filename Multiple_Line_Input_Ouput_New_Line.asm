org 100h

.model small
.data
pan db 0Ah,0Dh,"Enter Your Name,Id,Phone,Email:$"
msg db 60 dup(?)
outt db 0Ah,0Dh,"Your Information is:$"



.code
main proc 
 mov ax,@data
 mov ds,ax 
 
 lea dx,pan
 mov Ah,09
 int 21h   
    
 mov si,offset msg
 
 input: mov ah,1 
 int 21h
 cmp al,13
 je display
 mov [si],al
 inc si
 jmp input
 
 display:
    lea dx,outt
    mov ah,09
    int 21h
    
    mov [si],'$'
    mov di,offset msg 
    
    mov dl,13
    mov ah,2
    int 21h 
    
    mov dl,10
    mov ah,2
    int 21h 
    
    again: cmp [di],'$'
    je last  
    cmp [di],32
    je next
    mov dl,[di]
    mov ah,2
    int 21h
    
    inc di
    jmp again
    
    
  next: mov dl,13
     mov ah,2
     int 21h
     mov dl,10
     mov ah,2
     int 21h
     inc di
     jmp again 
    
   last: mov ah,4ch
   int 21h
    
    
  main endp


end main