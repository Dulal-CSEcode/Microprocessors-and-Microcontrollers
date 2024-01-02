;FFFh * 10h + 1111b

ORG 0100h

.DATA
    OUTPUT DW ?     ; Output variable

.CODE
MAIN PROC
    XOR AX, AX      ; Clear the AX register
    MOV AX, 0FFFh   ; Move the value 0xFFF to AX
    MOV BX, 10h     ; Move the value 0x10 to BX
    MUL BX          ; Multiply AX by BX, result in DX:AX
    ADD AX, 1111b   ; Add the binary value 1111 to AX

    MOV OUTPUT, AX  ; Move the result to the OUTPUT variable

MAIN ENDP

END MAIN
RET
