.model small
.stack 100h

.data
msg db "Your Input:$"
msg1 db "Even Output:$" 
msg2 db "Odd Output:$"
msg3 db "Size of the Array: $"
OddSum db ?
EvenSum db ?
n db ?
nl db 10,13,'$'
m db ?

arr db 2,7,8,2,3,5,3,4,0 
;arr db 5 dup(3);input duplicate value which
              ;indicate in dup(here) indicate
              ;3 so 3 coming 5 times
              
;arr db 2,7,8,5,3,4,1,6,9,0 
size equ $-arr ;find the size of the array
.code
  mov ax,@data
  mov ds,ax 
            
  ;mov si,0
  mov cx,size 
  xor ax,ax
  xor bx,bx
  mov si,offset arr
  
  EO: 
  ;mov dl,arr[si] ;do not need offset
  ;mov m,dl 
  ;sub arr[si],48
  
  ;add bl,[si] ; bl=2
  mov dl,[si] ;dl=2
  mov n,dl ;n=2
  and [si],1;Check even odd 
  
  JZ Even:
  ;check which number even and odd
  ;mov ah,2
  ;mov dl,[si];print just 01
  ;int 21h               here 0 means even
                          ;1 means odd
  odd: 
  ;print the odd number only
  ;mov ah,2
  ;mov dl,n
  ;add dl,48
  ;int 21h
  add bl,dl
  jmp next
  
  Even:
  add al,dl
  jmp next
  
  
  next: 
 
  ;add bh,n ;
  ;mov ah,2
  ;mov dl,n
  ;add dl,48
  ;int 21h

  inc si 

  Loop EO
   mov OddSum,bl
   mov EvenSum,al 
  
  ;mov ah,9
  ;lea dx,msg1
  ;int 21h
             
  mov ah,9
  lea dx,nl
  int 21h           
             
  mov ah,9
  lea dx,msg3
  int 21h
  mov ah,2
  mov dl,size
  add dl,48
  int 21h