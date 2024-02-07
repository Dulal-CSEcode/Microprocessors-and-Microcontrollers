;Arithmetic Operation
org 100h
mov ax,[1100h]   
mov bx,[1102h]

div bx ;
mov [1200h],ax
mov [1202],dx
hlt