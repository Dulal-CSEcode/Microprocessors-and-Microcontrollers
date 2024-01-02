;F: °F = °C x 9/5 + 32 - 1

ORG 0100h

.DATA
    CEL DW 260       ; Input temperature in Celsius
    FER DW ?        ; Output temperature in Fahrenheit

.CODE
MAIN PROC
    MOV AX, CEL     ; Move the Celsius temperature to AX register
    MOV BL, 9       ; Set BL register to 9
    XOR BH, BH      ; Clear BH register (BH is used as high part of BX register)
    MUL BX          ; Multiply AX by BX (AX = AX * BX)

    MOV BL, 5       ; Set BL register to 5
    XOR BH, BH      ; Clear BH register
    DIV BX          ; Divide AX by BX (AX = AX / BX, remainder in DX)

    ADD AX, 32      ; Add 32 to AX
    SUB AX, 1       ; Subtract 1 from AX

    MOV FER, AX     ; Move the result to the Fahrenheit variable

MAIN ENDP

END MAIN
RET
