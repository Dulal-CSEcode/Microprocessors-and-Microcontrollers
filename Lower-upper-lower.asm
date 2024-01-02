ORG 0100H

.DATA
PROMPT_1 DB 'Enter a character: $'
PROMPT_2 DB 0Dh, 0Ah, 'toLowerCase / toUpperCase of this character: $'

.CODE
MAIN PROC
    MOV AH, 9
    LEA DX, PROMPT_1 ; Display the first prompt
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL       ; Store the entered character in BL

    MOV AH, 9
    LEA DX, PROMPT_2 ; Display the second prompt
    INT 21H

    CMP BL, 97       ; Compare BL with ASCII 'a'
    JGE toUpperCase  ; If greater or equal, it's lowercase; convert to uppercase
    JL toLowerCase   ; If less, it's uppercase; convert to lowercase

toUpperCase:
    SUB BL, 32       ; Convert to uppercase by subtracting 32
    JMP Exit

toLowerCase:
    ADD BL, 32       ; Convert to lowercase by adding 32

Exit:
    MOV DL, BL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP

END MAIN
RET
