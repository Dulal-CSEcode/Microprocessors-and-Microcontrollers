
;mul do not work two parameter add a time
; mul work before define to file suppose al=5h
; that time bl=60;
;here mul mul=al*bl and store in AX

mov al,5h
mov bl,60h
mul bl ; Multiply AL by BL, result in AX
mov cl,10h
add al,cl ; Add the result to CL 

; Work 16 bits  
;if work more than 8 bits use ax,bx and so on


mov ax,1234h

add ax,4h   


; Do not understand

.DATA
WORD1 DB 2
WORD2 DW 5
MSG DB "THIS IS A MESSAGE$"
MASK EQU 10010010B
   
; Do not understand
                     
