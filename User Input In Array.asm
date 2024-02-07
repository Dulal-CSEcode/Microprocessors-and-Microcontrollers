include 'emu8086.inc'
.stack 100h
.model small 
.data
arr db 5 dup(?)

nl db 10,13,'$'

.code
main proc
  mov ax,@data
  mov ds,ax
  
  mov cx,5
  mov si,offset arr
  
  print 'Enter 5 values in array :'
  
  L1:
  mov ah,1
  int 21h
  
  mov [si],al
  inc si
  Loop L1
  
  mov ah,9
  lea dx,nl
  int 21h
  
  print 'Your Values in Array: '
  
  mov si,offset arr 
  mov cx,5
  
 L2:
  mov ah,2
  mov dl,[si]
  int 21h
  
 
  ;space
  mov ah,2
  mov dl,32
  int 21h 
  
  inc si
  Loop L2
  
  
    
    
main endp
end main