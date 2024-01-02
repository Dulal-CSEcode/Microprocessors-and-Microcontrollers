;MD Dulal Hossain 213902116
ORG 100h
.DATA
PROMPT_1 DB 'Enter 6 Integer Numbers: ', '$'
PROMPT_2 DB 0Dh, 0Ah, 'ODD Digits: ', '$'
PROMPT_3 DB 0Dh, 0Ah, 'EVEN Digits: ', '$'
ARRAY DB 10 DUP(0)
odd_sum DB ?
even_sum DB ?

.CODE
MAIN PROC ;main procedure
MOV AX, @DATA
MOV DS, AX
MOV AH, 9
LEA DX, PROMPT_1
INT 21H 

MOV CX, 6 ; because we will input 6 integers
LEA SI, ARRAY

INPUTS:
MOV AH, 1
INT 21h
MOV [SI], AL ; Load the inputs in array one by one
INC SI

MOV AH, 2
MOV DX, ' ' ;print space
INT 21h  

LOOP INPUTS 

CALL Odd_Numbers ;call odd_number section
CALL Even_Numbers ;call even_number section 
;MD Dulal Hossain 213902116

MAIN ENDP  

Odd_Numbers PROC
MOV AH, 9
LEA DX, PROMPT_2
INT 21H
MOV CX, 6
LEA SI, ARRAY
XOR BH,BH 

Loop_1:

XOR AX, AX
MOV AL, [SI] ;move array value to AL register
SUB AL, 48 ;sub 48 for replace charecter to digit
MOV BL, 2 ; compare the integer with all elements of the one by one
DIV BL     

CMP AH, 1 ;comparing if the remainder 1 or not
JE Print1 ;if the remainder is 1 then jump to print1 section
JL noPrint1 ;if the remainder is less than 1 then jump to noprint1 section

Print1:
MOV AH, 2
MOV DX, [SI]
INT 21h
MOV DX, ' '

INT 21h
add bh, [SI] ;sum every odd number input value
sub bh,48 ;sub 48 to get digit

noPrint1:
INC SI ;increment index

LOOP Loop_1

mov odd_sum,bh ;moving all odd sum number from bh to odd_sum
Odd_Numbers ENDP ;end procedure for Odd_Numbers

Even_Numbers PROC
MOV AH, 9
LEA DX, PROMPT_3
INT 21H
MOV CX, 6 ;this array will continue for 6 times
LEA SI, ARRAY
XOR BH,BH
Loop_2:

XOR AX, AX
MOV AL, [SI] ;move array value to AL register
SUB AL, 48 ;sub 48 for replace charecter to digit
MOV BL, 2 ; compare the integer with all elements of the one by one
DIV BL
CMP AH, 0 ;comparing if the remainder 0 or not
JE Print2 ;if the remainder is 0 then jump to print2 section
JG noPrint2 ;if the remainder is greater than 0 then jump to noprint2 section
;MD Dulal Hossain 213902116

Print2:
MOV AH, 2
MOV DX, [SI]
INT 21h

MOV DX, ' '
INT 21h
add bh, [SI] ;sum every even number input value
sub bh,48 ;sub 48 to get digit

noPrint2:
INC SI ;increment index

LOOP Loop_2
mov even_sum,bh ;moving all even sum number from bh to even_sum
Even_Numbers ENDP ;end procedure for Even_Numbers

END MAIN   

RET






;MD Dulal Hossain 213902116