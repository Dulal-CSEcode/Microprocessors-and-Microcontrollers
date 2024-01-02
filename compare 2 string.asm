org 100h

.data
String1 db "Dulal",'$'
String2 db "Dulal",'$'

msg1 db "String are Equal $"
msg2 db "String are Not Equal $"

.code
calculateCompare proc
    mov si, offset String1
    mov di, offset String2

compLoop:
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jne notMatch

    inc si
    inc di
    cmp al, '$'  ; Check if end of string is reached
    je stringsMatch
    jmp compLoop

stringsMatch:
    mov ah, 09h
    mov dx, offset msg1
    int 21h
    jmp endProgram

notMatch:
    mov ah, 09h
    mov dx, offset msg2
    int 21h

endProgram:
    ret
calculateCompare endp

main proc
    mov ax, @data
    mov ds, ax

    call calculateCompare

    mov ah, 4ch
    int 21h
main endp

end main
