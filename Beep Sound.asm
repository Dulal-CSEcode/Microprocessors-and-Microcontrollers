.model small/big/medium
.stack 100h
.data
n db 4
m db ?

nl db 10,13,'$'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov n,al
    
    mov ah,1
    int 21h
    mov m,al
    
   
      
    mov ah,9
    mov dx,offset nl
    int 21h
    
    mov ah,2
    mov dl,n
    int 21h
    
    mov ah,2
    mov dl,m
    int 21h
    
    ;Work for beep sound
    mov ah,2
    mov dl,07
    int 21h
    
    
  exit:
  mov ah,4ch
  int 21h
main endp
end main