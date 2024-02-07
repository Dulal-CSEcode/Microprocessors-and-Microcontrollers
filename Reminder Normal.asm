              include 'emu8086.inc'
.stack 100h
.model small
.data

nl db 10,13,'$'
n db ?
m db ?
k db ?
r db ?
res db ?
divident dw ?
divisor db ?

.code

main proc
  mov ax,@data
  mov ds,ax
  
  print 'Enter your num:'
  mov ah,1
  int 21h  
  sub al,'0'
  mov n,al
  mov bx,10 
  mul bx
  mov bl,al 
  
  mov ah,1
  int 21h
  sub al,'0'
  add bl,al
  mov k,bl
  mov [divident],bx 
  
  
  ;new line
  mov ah,9
  lea dx,nl
  int 21h
  
  print 'Enter divisor:'
  mov ah,1
  int 21h
  sub al,'0'
  mov bh,al
  
  mov ax,[divident]
  div bh
  
  add ah,'0'
  add al,'0'
  
  mov bx,ax
  mov [res],al
  mov [r],ah
  
    ;new line
  mov ah,9
  lea dx,nl
  int 21h
  
  print 'Result:'
   mov ah,2
   mov dl,[res]
   int 21h
 
 
  
     ;new line
  mov ah,9
  lea dx,nl
  int 21h
  
  print 'Reminder:'
  mov dl,[r] 
  mov ah,2
  int 21h
 
  mov ah,04ch
  int 21h
 main endp
end main