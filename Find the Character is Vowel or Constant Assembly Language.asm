.model small

.data
  msg1 db 10,13,"Enter Character : $"
  vowel db 10,13,"You Enter Vowel Character $"
  const db 10,13,"You Enter Constant Character $"

.code
main proc
  mov ax,@data
  mov ds,ax

  mov dx,offset msg1
  mov ah,9h
  int 21h

  mov ah,1h
  int 21h

  cmp al,'A'
  je vwl
  cmp al,'a'
  je vwl 
  cmp al,'E'
  je vwl
  cmp al,'e'
  je vwl 
  cmp al,'I'
  je vwl
  cmp al,'i'
  je vwl  
  cmp al,'O'
  je vwl
  cmp al,'o'
  je vwl 
  cmp al,'U'
  je vwl
  cmp al,'u'
  je vwl 

  mov dx,offset const
  mov ah,9
  int 21h
  jmp Quit

  vwl:
    mov dx,offset vowel
    mov ah,9
    int 21h

  Quit:
    mov ah,4ch
    int 21h

main endp
