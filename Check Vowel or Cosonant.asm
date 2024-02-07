org 100h
.model small
.stack 100h
.data
input db 0 ; To store the user's input

msg db "Enter a character: $"
msg_vowel db "The input is a vowel$"
msg_not_vowel db "The input is not a vowel$"
msg_s db "The input is semevowel$"
nl db 0dh,0ah,"$"

.code
main proc
 mov ax, @data
 mov ds, ax

 ; Display message for user input
 mov ah, 9
 lea dx, msg
 int 21h

 ; Input for the character
 mov ah, 1
 int 21h
 mov input, al ; Store the user's input in 'input'
 
 ;newline
 mov ah,9
 lea dx,nl
 int 21h

 ; Check if the input is a vowel
 cmp input, 'a'
 je is_vowel
 cmp input, 'e'
 je is_vowel
 cmp input, 'i'
 je is_vowel
 cmp input, 'o'
 je is_vowel
 cmp input, 'u'
 je is_vowel
 cmp input,'y'
 je is_seme
 
 
 not_vowel:
   mov ah, 9
   lea dx, msg_not_vowel
   int 21h
   jmp done
   
 is_seme:
  mov ah,9
  lea dx,msg_s
  int 21h
  jmp done

 is_vowel:
   mov ah, 9
   lea dx, msg_vowel
   int 21h

 done:
   ; Your program continues here

main endp
end main
