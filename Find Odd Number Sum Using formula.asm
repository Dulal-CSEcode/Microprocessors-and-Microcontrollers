.model SMALL
.stack 100h
.DATA
msg db "Enter First Num:$"
msg1 db "Enter Last Num:$"
firstNum dw ?
lastNum dw ?
i dw ?
n dw ?
sum dw ?
m dw ?   
d db ?
a dw ?
nl db 10,13,'$'
.Code 
main proc
MOV ax,@DATA
MOV ds,ax

    mov ah,9
    lea dx,msg
    int 21h

    ; sum=n/2*(2*a+(n-1)d) odd number sum 
    ; n=(last digit -first digit)/2
    ; d=2nd digit-first digit
    ; a=first digit

     mov bh,2
     mov d,bh;difference
     
     ;Using Formula
     mov ah,1
     int 21h
     sub ax,48
     mov ah,0
     mov firstNum,ax
     ;mov a,ax;

     ;newline
     mov ah,9
     lea dx,nl
     int 21h 

     ;last Number 
     mov ah,9
     lea dx,msg1
     int 21h
     
     mov ah,1
     int 21h
     sub ax,48
     mov ah,0
     mov bx,10
     mul bx
     mov m,ax
     
     mov ah,1
     int 21h
     sub ax,48
     mov ah,0
     add ax,m
     mov lastNum,ax;25
     
     ;find n
     mov ax,lastNum;(25-1)/2+1=13
     sub ax,firstNum
     mov bl,2
     div bl  
     add ax,1
     mov n,ax 
     
     ; check n is odd or even
     and (n,1)

     JZ even:
     
     mov ax,n;n 
     sub ax,1 ;n-1 
     mul d    ;d*(n-1) 
     add ax,2;2a+(n-1)*d
     div d
     mul n 
     mov sum,ax
     ret
     
     even:
     mov ax,n;n 
     sub ax,1 ;n-1 
     mul d    ;d*(n-1) 
     add ax,2;2a+(n-1)*d 
     mov i,ax;
     mov ax,n;
     div d
     mul i
     mov sum,ax
     ret
    exit:
    mov ah,4CH
    int 21H
    
main endp
end main

