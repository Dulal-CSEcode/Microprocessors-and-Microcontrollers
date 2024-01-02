; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h

.DATA 
MSG_1 DW 'EVEN$'
MSG_2 DW 'ODD$' 

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX

MOV AX,8  ;WORK WITH AX SO REMINDER DL
MOV BX,2   ;(WORK WITH AL SO REMINDER AH)

DIV  BX
MOV BL,DL
CMP BL,0

;CMP DX,5
 
 JE EVEN 
 ODD:
 LEA DX, MSG_2
    MOV AH,09H
    INT 21H
 JMP BLANK 
 EVEN: 
 
 LEA DX, MSG_1
    MOV AH,09H
    INT 21H
 BLANK:

ret