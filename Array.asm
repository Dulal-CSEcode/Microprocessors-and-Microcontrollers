.model small
.stack 100h
.data

msg db "Enter your num: $"
ot db "Ouput:$"

a db 3,2,4,5,6
sum dw ?

nl db 10,13,"$"

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,ot
    int 21h
    
    ;mov ah,9
    ;lea dx,nl
    ;int 21h
    
    xor cx,cx
    ;mov si,offset a  ;offset a dile a array base address chole ase
                    ; si te jar fole a[si] dite hoy nah
                    ;just address dilei hoy [si]
    mov cx,5
    xor bx,bx
    
    Arr:
    add bl,[si]

    mov ah,2
   ; mov dl,[si] 
    mov dl,a[si]
    add dl,48
    int 21h

    ;space
    mov ah,2
    mov dl,32
    int 21h
    inc si 
    
    Loop Arr
    
    
    ;mov bh,0 
    mov sum,bx 
    mov bh,0
    aaa
    
    add bh,48
    add bl,48   
    
    mov ah,2
    mov dl,bh
    ;add dl,48
    int 21h
    
    mov ah,2
    mov dl,bl
    ;add dl,48
    int 21h
    

    
     

   mov ah,4ch
   int 21h
 main endp
end main