; This is 2 double digit divisible??
org 100h
.model small
.stack 100h
.data
dividend_ dw ?
divisor_ db ?
msg1 db "enter dividend: $"
msg2 db "enter divisor: $"
msg3 db "result: $"
msg4 db "remainder: $"
next db 013,010,"$"
result db 0
rem db 0
mlt10 db 10
.code
main proc
mov ax,@data
mov ds,ax

    mov ah, 9h
    lea dx, msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al, '0'
    
    mov bx, 10
    mul bx
    mov bl, al

    mov ah, 1
    int 21h
    sub al, '0'
    add bl, al

    mov ah, 9h
    lea dx, [next]
    int 21h  
    
    mov [dividend_], bx
    mov ah, 9h
    lea dx, msg2
    int 21h 
    
    mov ah, 1
    int 21h
    mov bh, al
    sub bh, '0'
    
    mov ax, [dividend_]
    div bh
    add ah, '0'
    add al, '0' 
    
    mov [rem], ah
    mov [result], al
    
    mov ah, 9h
    lea dx, [next]
    int 21h
    
    mov ah, 9h
    lea dx, msg3
    int 21h 
    
    mov ah, 2
    mov dl, [result]
    int 21h  
    
    mov ah, 9h
    lea dx, [next]
    int 21h
    
    mov ah, 9h
    lea dx, msg4
    int 21h 
    
    mov ah, 2
    mov dl, [rem]
    int 21h

main endp
end main