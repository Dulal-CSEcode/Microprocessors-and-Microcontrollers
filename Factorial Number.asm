.model small
.stack 100h
.data

ans dw ?
n dw ?
m dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    
    ;take user input
    mov ah,1
    int 21h
    sub ax,48
    mov ah,0
    mov n,ax
    ;mov bx,10
    ;mul bx
    ;mov n,ax
    
    ;2nd digit take input
    ;mov ah,1
    ;int 21h
    ;sub ax,48
    ;add ax,n
   ; mov m,ax       
             
      
    xor ax,ax
    mov ax,n
    
    ;factorial count 
    ;mov ax,7 
    mov cx,ax
    dec cx
    fact:
    mul cx  
    loop fact
    mov ans,ax 
    
    mov ax,ans
    ;mov ah,0
    add ah,48
    add al,48
    aaa
    
    mov bx,ax
    
    mov ah,2
    int 21h
    mov dl,bh
  
   
    
main endp
end main
