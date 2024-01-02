ORG 100h
.DATA
PROMPT_1 DB 'Enter 7 Integer Numbers: ', '$'
PROMPT_2 DB 0Dh, 0Ah, 'Smallest: ', '$'
PROMPT_3 DB 0Dh, 0Ah, 'Largest: ', '$'
PROMPT_4 DB 0Dh, 0Ah, 'Average: ', '$'
ARRAY DB 7 DUP(0)
Average DB ? ;define word
.code
main proc ;main procedure
mov ax,@data
mov ds,ax
MOV AH, 9
LEA DX, PROMPT_1 ; load and display the string PROMPT_1
INT 21H
mov cx,7
mov bx,offset ARRAY
mov ah,1
inputs:
int 21h
mov [bx],al
inc bx

loop inputs ;loop will continue for 7 times
main endp
small proc :
mov cx,7
dec cx
outerLoop:
mov bx,cx
mov si,0
compLoop: ;here we are comparing index values
mov al,ARRAY[si]
mov dl,ARRAY[si+1]
cmp al,dl
jc noSwap
mov ARRAY[si],dl
mov ARRAY[si+1],al
noSwap:
inc si
dec bx
jnz compLoop
loop outerLoop
;newline
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
MOV AH, 9
LEA DX, PROMPT_2 ; load and display the string PROMPT_2
INT 21H
mov cx,7

mov bx,offset ARRAY
;this loop to display elements on the screen
outputs:
mov dl,[bx]
mov ah,2
int 21h
mov dl,32
mov ah,2
int 21h
inc bx
;loop outputs
small endp
large proc :
mov cx,7
dec cx
Outer:
mov bx,cx
mov si,0
comp:
mov al,ARRAY[si]
mov dl,ARRAY[si+1]
cmp al,dl
jc swap
swap: ;this function will be work when find any large value then it will sawp
mov ARRAY[si],dl
mov ARRAY[si+1],al
inc si
dec bx
jnz comp
loop Outer

;newline
mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h
MOV AH, 9
LEA DX, PROMPT_3 ; load and display the string PROMPT_3
INT 21H
mov cx,7
mov bx,offset ARRAY
;this loop to display elements on the screen
display:
mov dl,[bx]
mov ah,2
int 21h
mov dl,32
mov ah,2
int 21h
inc bx
;loop display
large endp
0avg proc :
LEA SI,ARRAY
LEA DX,PROMPT_4 ; load and display the string PROMPT_4
MOV AH,9
INT 21H
MOV AX,00
MOV BL,7 ;moving BL to 7
MOV CX,7 ;loop will continue for 7 times

LOOP1:
ADD AL,ARRAY[SI]
INC SI
LOOP LOOP1
;div BL which means 7
DIV BL
ADD AL,30H
MOV Average,AL ;moving output from AL to Average
MOV AH,2
INT 21H
MOV AH,4CH
INT 21H
mov Average,AL ;moving average output to AL to Average avg ENDP
end main
ret
