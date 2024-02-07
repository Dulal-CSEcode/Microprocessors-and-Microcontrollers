ORG 100h
.MODEL SMALL
.data
msg db "Enter Your 1st num:$"
msg2 db 10,13, "Enter Your 1st num:$"

.CODE

 
mov ax,@data
mov ds,ax
mov ah,1
int 21h
sub ax,48
mov dx,ax

mov ah,1
int 21h
sub ax,48
mul dx

aam
  
;MOV AX, 7     ;Load 1st operand in AX  
;MOV DX,9     ;Load 2nd operand in DX
;MUL DX
;AAM 

;AAM er kaj holo multiplication korar por
; je value ta ase ota ke 2 vag kora
; jemon 7,9 multi=63 eta ke 10 dia vag kore
; ah=06 and al=03 convert kora AAM er kaj 

 add al,48
 add ah,48
 
 mov bx,ax
 
 mov ah,2
 mov dl,bh
 int 21h
 
 mov dl,bl
 mov ah,2
 int 21h

RET