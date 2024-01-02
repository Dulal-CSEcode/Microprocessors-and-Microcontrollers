;(30 + 15) * (575 - 225) + 210

ORG 0100H

.DATA
    OUTPUT DW ?     ; Output variable

.CODE
MAIN PROC
    MOV AL, 30      ; Move the value 30 to AL register
    XOR AH, AH      ; Clear the AH register
    ADD AX, 15      ; Add 15 to AX (AH was cleared, so effectively AX = 30 + 15)

    MOV BX, 575     ; Move the value 575 to BX register
    SUB BX, 225     ; Subtract 225 from BX
    MUL BX          ; Multiply AX by BX (result in DX:AX)

    ADD AX, 210     ; Add 210 to AX

    MOV OUTPUT, AX  ; Move the result to the OUTPUT variable

MAIN ENDP

END MAIN
RET
