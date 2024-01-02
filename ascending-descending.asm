;MD Dulal Hossain 213902116

ORG 100h
.DATA  

PROMPT_1 DB 'Enter 7 Integer Numbers: ', '$'
PROMPT_2 DB 0Dh, 0Ah, 'Ascending: ', '$'
PROMPT_3 DB 0Dh, 0Ah, 'Descending: ', '$'
ARRAY DB 7 DUP(0)


 .code
 main proc
 mov ax,@data
 mov ds,ax

 MOV AH, 9
LEA DX, PROMPT_1
INT 21H
mov cx,7
mov bx,offset ARRAY
mov ah,1
inputs:
int 21h
mov [bx],al

inc bx
loop inputs
main endp


ascending proc :


mov cx,7
dec cx
outerLoop:
mov bx,cx
mov si,0
compLoop:
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
LEA DX, PROMPT_2
INT 21H
mov cx,7
mov bx,offset ARRAY
;this loop to display elements on the screen
;MD Dulal Hossain 213902116

outputs:
mov dl,[bx]
mov ah,2
int 21h
mov dl,32
mov ah,2
int 21h
inc bx
loop outputs
ascending endp
descending proc :

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
swap:
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
LEA DX, PROMPT_3
INT 21H
mov cx,7
mov bx,offset ARRAY
;this loop to display elements on the screen
;MD Dulal Hossain 213902116

display:
mov dl,[bx]
mov ah,2
int 21h
mov dl,32
mov ah,2
int 21h
inc bx
loop display
descending endp
end main
ret