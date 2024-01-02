org 100h

mov cx , 9

;add bx, 10
for:
   
    mov ax, 10
    sub ax, cx
    add ax, 48
    mov dl, al
    mov ah, 2
    int 21h
   
   
loop  for

ret




