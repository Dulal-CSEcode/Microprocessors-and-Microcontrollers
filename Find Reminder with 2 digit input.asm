.model small
.stack 100h
.data

num1 db ?
num2 db ?
num3 db ?
nm db ?
res db ?
msg_1 db 10,13,"Enter Your numbers: $"
msg_2 db 10,13,"Enter Your num2: $" 
msg_3 db 10,13,"After divided result is: $"
msg4 db 10,13,"Reminder: $" 
msg5 db 10,13,"divident: $"
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
    mov bl,10h
    mul bl
    aam
    mov num3,al
    ;mov ah,9
    ;lea dx,msg_2
    ;int 21h
    
    mov ah,1
    int 21h
    sub al,30h    
    add al,num3
    aaa
    mov num2,al
    
    mov ah,9
    lea dx,msg5
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov nm,al
    
    
    mov al,num2
    
    aam
    div nm
    mov res,al
    
    
    add al,30h ;result
    add ah,30h;reminder
    
    mov bx,ax
    
    mov ah,9
    lea dx,msg4
    int 21h
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,9
    lea dx,msg_3
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,4ch
    int 21h 
    
    
 main endp
end main