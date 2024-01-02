.MODEL SMALL
.STACK 100H
.DATA
    INPUT DB ?
    MSG1 DB ‘INPUT: $’
    MSG2 DB 10,13,’OUTPUT:$’
    WHITESAPCE DB ‘ $’
.CODE   

    MAIN PROC           
        MOV AX, @DATA
        MOV DS, AX  
        MOV AH, 9
        LEA DX, MSG1
        INT 21H 
        
        MOV AH, 1
        INT 21H
        SUB AL, 48
        MOV AH, 0
        MOV BL, 10
        MUL BL
        MOV CL, AL
        MOV AH, 1
        INT 21H 
        
        SUB AL, 48      
        ADD CL, AL
        MOV AL, CL
        MOV CH, 0
        MOV INPUT, CL 
        MOV AH, 0 
        MOV AH, 9
        LEA DX, MSG2
        INT 21H 
          
        DULAL: 
        
        LOOP_MD:
        MOV AH, 0
        MOV AL, INPUT
        DIV CL
        CMP AH, 0
        JE HOSSAIN          
        LOOP LOOP_MD 
                
        HOSSAIN:
        CMP CL, 10
        JL SINGLE_PRINT
        JGE DOUBLE_PRINT
            
        SINGLE_PRINT:
        MOV AH, 9
        LEA DX, WHITESAPCE
        INT 21H
        MOV AH, 2 
        MOV DL, CL
        ADD DL, 48
        INT 21H
        SUB CL, 1
        CMP CL, 0
        JE EXIT
        JMP DULAL 
         
        DOUBLE_PRINT:
        MOV AH, 9
        LEA DX, WHITESAPCE
        INT 21H
        MOV AH, 0
        MOV AL, CL
        MOV BL, 10
        DIV BL
        MOV BX, AX 
        MOV AH, 2
        MOV DL, BL
        ADD DL, 48
        INT 21H 
        MOV DL, BH
        ADD DL, 48
        INT 21H   
        SUB CL, 1
        CMP CL, 0
        JE EXIT
        JMP DULAL
         
        EXIT:
        MOV AH, 4CH
        INT 21H 
        
    MAIN ENDP
END MAIN