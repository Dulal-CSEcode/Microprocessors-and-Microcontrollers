include 'emu8086.inc'
.stack 100h
.model small 
.data
arr db 7,4,5,3,6,2

nl db 10,13,'$'
;n db ?
m equ $ -arr ;size of the array

.code
main proc
  mov ax,@data
  mov ds,ax
  
  mov cx,m ;maximum value find korar somoy size
           ;define kore dite hobe
  mov si,offset arr
  mov bl,[si]
  
 L:
 cmp [si],bl
 jle update ;find smallest value
 ;ja update; find the largest value
 
 resume:
 inc si
  Loop L 
  
  print 'Smallest value:'
  add bl,48
  mov ah,2
  mov dl,bl
  int 21h
  
  update:
  mov bl,[si]
  jmp resume

  mov ah,4ch
  int 21h 

main endp
end main