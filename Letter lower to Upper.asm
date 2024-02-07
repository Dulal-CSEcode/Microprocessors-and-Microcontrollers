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
    
    mov cx,10
    mov dl,48
    
    ;Print the 0 to 9 number
    L1:
    mov ah,2
    int 21h
    inc dl
    
    Loop L1
    
    mov ah,9
    mov dx,offset nl       ;a=97
                           ;A=65
                           ;  32
    int 21h
    
    mov cx,26
    mov dl,'A';Input Upper Case Letter
    add dl,32  ;Convert lower Case
    ;Print A to Z    
    L2:
    mov ah,2
    int 21h
    inc dl
    
    Loop L2
    
    ;Work for beep sound
    mov ah,2
    mov dl,07
    int 21h
    
    
  exit:
  mov ah,4ch
  int 21h
main endp
end main