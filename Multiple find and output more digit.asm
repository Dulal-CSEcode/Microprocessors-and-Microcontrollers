.model small
.stack 100h
.data

num1 db ?
num2 db ?
res db ?
msg_1 db 10,13,"Enter Your num1: $"
msg_2 db 10,13,"Enter Your num2: $" 
msg_3 db 10,13,"After multiplication result is: $" 

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg_1
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov num1,al
    
    mov ah,9
    lea dx,msg_2
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov num2,al
    
    mul num1
    mov res,al
    aam
    
    add al,30h
    add ah,30h
    
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