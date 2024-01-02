org 100h
.data
String db "Md Shajid",'$'
count db '' 
B db 00h

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov si,offset String 
    
    
    mov cx,0  
    
    Length:
    cmp [si],'$'
    je last
    inc cx
    inc si
    
    jmp Length    
    
    
    last: 
    mov dl,cl
    add dl,48
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main
P2

org 100h
.data
String db "shajid",'$'
String2 db "shajid",'$'
B db       "Two String are match $"  
C db "two string are not match $"

.code 

calculateCopare proc 
   
    comp:  
     mov al,[si]
     mov bl,[di]
     cmp al,bl 
    
    je mis
    inc si
    inc di
    
    loop comp
    
    mis:  
    
    mov ah,09h
    mov dx,offset B   
    int 21h 
    
    
    
     calculateCopare endp
    

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov si,offset String  
    mov di,offset String2
    
    
    mov cx,0  
    
    Length:
    cmp [si],'$'
    cmp [di],'$'
    je last
    inc si 
    inc di
    
    jmp Length    
    call  calculateCopare
     
    last: 
  
    
    
     mov ah,09h
     mov dx,offset C
     
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    
  
    
   

