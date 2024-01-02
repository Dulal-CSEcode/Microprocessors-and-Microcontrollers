org 100h

.data
    msg1 db "Optian Grade ", 0
    a db 0
    b db 0
    c db 0

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input digit 1
    mov ah, 01h
    int 21h
    sub al, 48
    mov c, al

    ; Multiply the existing value of 'b' by 10
    mov al, 10
    mul c
    add b, al

    ; Input digit 2
    mov ah, 01h
    int 21h
    sub al, 48
    mov c, al

    ; Add the new digit to 'b'
    mov al, 1
    mul c
    add b, al

    ; New line print
    mov ah, 02h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; Compare 'b' with grade thresholds
    cmp b, 80
    jge g1
    cmp b, 75
    jge g2
    cmp b, 70
    jge g3
    cmp b, 65
    jge g4
    cmp b, 60
    jge g5
    cmp b, 55
    jge g6
    cmp b, 50
    jge g7
    cmp b, 45
    jge g8
    cmp b, 40
    jge g9
    jmp g10

g1:
    mov dl, 65
    int 21h
    mov dl, 43
    int 21h
    jmp blank

g2:
    mov dl, 65
    int 21h
    jmp blank

g3:
    mov dl, 65
    int 21h
    mov dl, 45
    int 21h
    jmp blank

g4:
    mov dl, 66
    int 21h
    mov dl, 43
    int 21h
    jmp blank

g5:
    mov dl, 66
    int 21h
    jmp blank

g6:
    mov dl, 66
    int 21h
    mov dl, 45
    int 21h
    jmp blank

g7:
    mov dl, 67
    int 21h
    mov dl, 43
    int 21h
    jmp blank

g8:
    mov dl, 67
    int 21h
    jmp blank

g9:
    mov dl, 68
    int 21h
    jmp blank

g10:
    mov dl, 70
    int 21h

blank:
    main endp

end main
ret
