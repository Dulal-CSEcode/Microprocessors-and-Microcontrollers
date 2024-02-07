include 'emu8086.inc'
.stack 100h
.model small 
.data
arr db 10 dup(?)

nl db 10,13,'$'
n db ?
m db ?

.code
main proc
  mov ax,@data
  mov ds,ax
  
  mov cx,10
  mov si,offset arr
  
  print 'Enter 5 values in array :'
  
  L1:
  mov ah,1
  int 21h
  mov [si],al; value store in si jate value haray nah jay
  ;space
  mov ah,2
  mov dl,32
  int 21h
  
  inc si
  Loop L1
  
  mov ah,9
  lea dx,nl
  int 21h
  
  print 'Your Values in Array: '
  
  mov si,offset arr 
  mov cx,10
  
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
  
  ;newline
  mov ah,9
  lea dx,nl
  int 21h 
  
  ;Even number print
   print 'Even number in Array: '
  
  mov si,offset arr 
  mov cx,10
  
 L3:
  mov dl,[si]
  mov n,dl
  and dl,1
  
  JZ even:
  
   odd:
   jmp next
  
   even:
   mov ah,2
   mov dl,n
   int 21h
   
   ;space
   mov ah,2
   mov dl,32
   int 21h
   
   jmp next
  
  next:

  inc si
  Loop L3 
  
  ;newline
  mov ah,9
  lea dx,nl
  int 21h 
  
  ;Odd number print
   print 'Odd number in Array: '
  
  mov si,offset arr 
  mov cx,10
  
 L4:
  mov dl,[si]
  mov n,dl
  and dl,1
  
  JNZ od:
  
   ev:
   jmp nex
  
   od:
   mov ah,2
   mov dl,n
   int 21h
   
   ;space
   mov ah,2
   mov dl,32
   int 21h
   
   jmp nex
  
  nex:

  inc si
  Loop L4
  
  mov ah,4ch
  int 21h 
    
    
main endp
end main