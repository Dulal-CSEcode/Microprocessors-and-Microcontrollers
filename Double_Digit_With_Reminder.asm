org 100h
.model small
.stack 100h
.data
msg db "Enter your Number:$" 
ot db "Output here:$" 
divident db "Enter Divident:$"
a1 db ?
b1 db ?
c1 db ?
n db ?
m db ?
k db ?
j db ?
i db ?
final db ?

nl db 0Dh,0Ah,"$"

.code
main proc
    mov ax,@data
    mov ds,ax  
    mov ax,0
    
    ;msg print
    mov ah,9
    lea dx,msg
    int 21h
    mov dx,0
    
    ;input 1st digit
    mov ah,1
    int 21h 
    sub al,'0'
    mov a1,al
    
    mov bl,10
    mul bl
    mov b1,al 
    
    ;input 2nd digit
    mov ah,1
    int 21h
    sub al,'0'
    mov c1,al
    
    ;add 
    add al,c1
    mov n,al
    
    mov ah,9
    lea dx,nl
    int 21h
    
  
    
    ;divident
    mov ah,9
    lea dx,divident
    int 21h
    ; input divident
    mov ah,1
    int 21h
    sub al,'0'
    mov m,al
   
              
    ;Before division
    
    mov al,n 
    div m 
    mov final,al 
    
    ;newline
    mov ah,9
    lea dx,nl
    int 21h
   
    
    ;output
    mov ah,9
    lea dx,ot
    int 21h
           
   
   
    ;add ax,'0'
    sub final,48
    mov ah,2
    mov dl,final
    int 21h 
  
  main endp

end main