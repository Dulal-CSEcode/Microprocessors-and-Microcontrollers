                          ; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
    
    MOV AH,01H 
    INT 21H
    SUB AL,48 
    MOV BL,AL 
           
    MOV AH,01H 
    INT 21H 
    SUB AL,48     
    ADD BL,AL
    
    MOV AH,01H 
    INT 21H 
    SUB AL,48      
    ADD BL,AL
    
    
    MOV AH,01H 
    INT 21H 
    SUB AL,48      
    ADD BL,AL
    
    
    
    MOV AH,01H 
    INT 21H 
    SUB AL,48      
    ADD BL,AL
    
    
    
    MOV AH,01H 
    INT 21H 
    SUB AL,48      
    ADD BL,AL
    ADD BL,48
    
    MOV DL ,10
    MOV AH,02H
    INT 21H
    
    MOV DL ,13
    MOV AH,02H
    INT 21H
    
    MOV DL,BL
    
    MOV AH,02H
    INT 21H
    
    
ret




