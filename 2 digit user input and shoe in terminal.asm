; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AH,01H
INT 21H 
MOV BL,AL 
MOV AH,01H
INT 21H 
MOV BH,AL
 
CMP BL,BH
JL L

 M: 
 MOV DL,BH
 MOV AH,02H
 INT 21H 
 MOV DL,BL
 MOV AH,02H
 INT 21H 
 JMP BLANK 
 L: 
 MOV DL,BL
 MOV AH,02H
 INT 21H 
 MOV DL,BH
 MOV AH,02H
 INT 21H 
 BLANK: 
 
ret