.model small
.stack 100h
.data
    input db 0
    choice db 'N'
    msg db "Enter a number: $"
    odd_msg  db "Odd $"
    even_msg db "Even $"
    
   nl db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah, 09h
    lea dx, msg
    int 21h

    mov ah, 01
    int 21h
    mov input,al
    

    cmp al, 'N'
    je exit

    and al, 1   ; Check the least significant
               ; bit to determine odd or even
    cmp al, 0
    je even
    jmp odd

exit:
    int 20h

odd:
    mov ah, 09h
    lea dx, nl
    int 21h
    
    mov ah, 09h
    lea dx, odd_msg
    int 21h 
     
    mov ah, 09h
    lea dx, nl
    int 21h
    jmp main

even:
    mov ah, 09h
    lea dx, nl
    int 21h
    
    mov ah, 09h
    lea dx, even_msg
    int 21h
   
    mov ah, 09h
    lea dx, nl
    int 21h
    jmp main
main endp
end main