.model small
.stack 100h

.data
msg db "Your Input:$"
msg1 db "Even Output:$" 
msg2 db "Odd Output:$"

OddSum db ?
EvenSum db ?
n db ?
nl db 10,13,'$'
m db ?

;arr db 2,7,8,2,3,5,3,4,1,6 
arr db "Hello pank$"
;arr db 5 dup(3);input duplicate value which
              ;indicate in dup(here) indicate
              ;3 so 3 coming 5 times
              
;arr db 2,7,8,5,3,4,1,6,9,0
.code 

main proc
  mov ax,@data
  mov ds,ax 
            
  ;mov si,0 ;this is the base add
  mov cx,10 
  xor ax,ax
  xor bx,bx
  mov si,9
  
  EO: 

  mov ah,2
  mov dl,arr[si] ;reverse order print
  ;add dl,48 ;when string as a input
  int 21h

  dec si 

  Loop EO
  
  
 
 
 mov ah,4ch
 int 21h
 main endp
 end main