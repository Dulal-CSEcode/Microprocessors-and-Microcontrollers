org 100h 
 
 .data
 p db 'MD Dulal Hossain$ ' 
 q db 'ID : 213902116$ '
 r db 'Batch : 213 DA ' 
 s db 'Dept of CSE$'
 t db 'Green University of Bangladesh$ '
  
  
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

mov ah,4ch
;mov al,ooh
int 21h

 main endp


print proc
mov ah,09h
int 21h 

mov dl,32
mov ah,02h 
int 21h

;mov dl,13
;mov ah,02h 
;int 21h

ret
print endp 

end main 
ret