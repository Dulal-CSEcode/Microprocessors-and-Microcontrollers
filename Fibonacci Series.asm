data segment
    num db ?
    fact db 1
    res db 10 dup ('$')
    msg1 db "Input value here: $"
    msg2 db 10,13,"Result of Factorial: $"
data ends

code segment
    assume ds:data,cs:code

start:
    mov ax, data
    mov ds, ax

    lea dx, msg1
    mov ah, 9
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov num, al

    ; Initialize fact to 1
    mov ah, 0
    mov al, fact
    mov ch, 0

    ; Calculate factorial
    label1:
    mul ch
    loop label1

    ; Convert the result to decimal
    lea si, res
    call hex2dec

    lea dx, msg2
    mov ah, 9
    int 21h

    lea dx, res
    mov ah, 9
    int 21h

    mov ah, 4ch
    int 21h

code ends

hex2dec proc near
    mov cx, 0
    mov bx, 10

    loop1:
    mov dx, 0
    div bx
    add dl, 30h
    push dx
    inc cx
    cmp ax, 0
    jg loop1

    loop2:
    pop ax
    inc si
    mov [si], al
    loop loop2

    ret
hex2dec endp

end start
