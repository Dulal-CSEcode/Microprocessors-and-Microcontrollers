org 100h 
 
 .data
 p db 'MD Dulal Hossain$ ' 
 q db 'Student $ '
 r db 'Green$ ' 
 s db 'University of bangladesh$'
 t db 'Bangladesh$ '
  
  
 .code
 main proc 
    mov ax,@data
    mov ds,ax



lea dx,p
call print


lea dx,q
call print 
 
lea dx,r
call print
 
lea dx,s
call print
 
lea dx,t
call print

 main endp


print proc
mov ah,09h
int 21h 

mov dl,10
mov ah,02h 
int 21h

mov dl,13
mov ah,02h 
int 21h

ret
print endp 

end main 
ret