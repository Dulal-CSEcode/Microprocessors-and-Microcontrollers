display macro string 
    mov dx,offset string
    mov ah,09h
    int 21h
endm

org 100h 
.data 
msg1 db 'Microprocessors ',0dh,0ah ,'$'
msg2 db 'Microcontrollers lab $' 

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    display msg1
    display msg2
    mov ah,4ch
    int 21h
    main endp 

end main