;°C = (°F - 32) x 5/9 + 1

ORG 0100h

.DATA
    FER DW 1000     ; Input temperature in Fahrenheit
    CEL DW ?        ; Output temperature in Celsius

.CODE
MAIN PROC
    MOV AX, FER     ; Move the Fahrenheit temperature to AX register
    SUB AX, 32      ; Subtract 32 from AX

    MOV BL, 5       ; Set BL register to 5
    XOR BH, BH      ; Clear BH register (BH is used as high part of BX register)
    MUL BX          ; Multiply AX by BX (AX = AX * BX)

    MOV BL, 9       ; Set BL register to 9
    XOR BH, BH      ; Clear BH register
    DIV BX          ; Divide AX by BX (AX = AX / BX, remainder in DX)

    ADD AX, 1       ; Add 1 to AX

    MOV CEL, AX     ; Move the result to the Celsius variable

MAIN ENDP

END MAIN
RET
