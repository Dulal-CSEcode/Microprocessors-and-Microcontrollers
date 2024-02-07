org 100h
 
jmp printplayer
 
printplayer:
call delay
jmp checkcollisions
printplayer2:
call clear_screen
call printmap 
mov dl, 10
mov dh, 16
mov bh, 0
mov ah, 02h
int 10h
mov ax, score
call printax
mov dl, playery    
mov dh, playerx    
mov bh, 0                  
mov ah, 02h
int 10h
mov dx, offset player
mov ah, 09h
int 21h
jmp printenemies
printplayer3:
call hidecursor
jmp update_enemies
 
 
update_enemies:
mov al, enemy1y
dec al
mov BYTE PTR[enemy1y], al
mov al, enemy2y
dec al
mov BYTE PTR[enemy2y], al
mov al, enemy3y
dec al
mov BYTE PTR[enemy3y], al
mov al, enemy4y
dec al
mov BYTE PTR[enemy4y], al
 
jmp input
 
printenemies:
mov dl, enemy1y
mov dh, enemy1x
mov bh, 0
mov ah, 02h
int 10h
mov dx, offset enemy1
mov ah, 9
int 21h 
mov dl, enemy2y
mov dh, enemy2x
mov bh, 0
mov ah, 02h
int 10h
mov dx, offset enemy2
mov ah, 9
int 21h 
mov dl, enemy3y
mov dh, enemy3x
mov bh, 0
mov ah, 02h
int 10h
mov dx, offset enemy3
mov ah, 9
int 21h
mov dl, enemy4y
mov dh, enemy4x
mov bh, 0
mov ah, 02h
int 10h
mov dx, offset enemy4
mov ah, 9
int 21h
jmp printplayer3 
 
input:
mov ah, 1
int 16h
cmp ah, 4dh
je leftarrow
cmp ah, 4bh
je rightarrow
cmp ah, 50h
je uparrow
cmp ah, 48h
je downarrow
 
jmp printplayer
 
leftarrow:  
mov al, playery
inc al
mov [playery], al
call clearkeyboardbuffer
jmp printplayer
 
rightarrow:
mov al, playery
dec al                             
mov BYTE PTR[playery], al
call clearkeyboardbuffer
jmp printplayer
 
downarrow: 
mov al, playerx
dec al
mov BYTE PTR[playerx], al
call clearkeyboardbuffer
jmp printplayer
 
uparrow: 
mov al, playerx
inc al
mov [playerx], al
call clearkeyboardbuffer
jmp printplayer
 
checkcollisions:
jmp checkenemy1xcollision
checkcollisions2:
jmp checkenemy2xcollision
checkcollisions3:
jmp checkenemy3xcollision
checkcollisions4:
jmp checkenemy4xcollision
checkcollisions5:
mov ah, playery
cmp ah, 33h
jg exit
cmp ah, 02h                                
jl exit
mov ah, playerx
cmp ah, 0dh
jg exit
cmp ah, 02h
jl exit
mov ah, enemy1y
cmp ah, 03h
jl updateenemy1
mov ah, enemy2y
cmp ah, 03h
jl updateenemy2
mov ah, enemy3y
cmp ah, 03h
jl updateenemy3
mov ah, enemy4y
cmp ah, 03h
jl updateenemy4
checkcollisions6:   
jmp printplayer2
 
updateenemy1:
mov BYTE PTR[enemy1y], 50
add BYTE PTR[score], 5
jmp checkcollisions6
updateenemy2:
mov BYTE PTR[enemy2y], 50
add BYTE PTR[score], 5
jmp checkcollisions6
updateenemy3:
mov BYTE PTR[enemy3y], 50
add BYTE PTR[score], 5
jmp checkcollisions6
updateenemy4:
mov BYTE PTR[enemy4y], 50
add BYTE PTR[score], 5
jmp checkcollisions6
 
checkenemy1xcollision: 
mov al, playerx
mov ah, enemy1x
cmp ah, al
je checkenemy1ycollision
jmp checkcollisions2
 
checkenemy1ycollision:  ;end
mov al, playery
mov ah, enemy1y
cmp ah, al
je exit
jmp checkcollisions2
 
checkenemy2xcollision:
mov al, playerx
mov ah, enemy2x
cmp ah, al
je checkenemy2ycollision
jmp checkcollisions3
 
checkenemy2ycollision:
mov al, playery
mov ah, enemy2y
cmp ah, al
je exit
jmp checkcollisions3
 
checkenemy3xcollision:
mov al, playerx
mov ah, enemy3x
cmp ah, al
je checkenemy3ycollision
jmp checkcollisions4
 
checkenemy3ycollision:
mov al, playery
mov ah, enemy3y
cmp ah, al
je exit
jmp checkcollisions4
 
checkenemy4xcollision:
mov al, playerx
mov ah, enemy4x
cmp ah, al
je checkenemy4ycollision
jmp checkcollisions5
 
checkenemy4ycollision:
mov al, playery
mov ah, enemy4y
cmp ah, al
je exit
jmp checkcollisions5
 
exit:
call clear_screen
call resetcursor
mov dx, gameovermsg
mov ah, 9
int 21h
mov ah, 00
int 16h
exit2:
call clear_screen
mov ah, 4ch
mov al, 0
int 21h 
 
printax proc
    mov cx, 0
    mov bx, 10
@@loophere:
    mov dx, 0
    div bx                         
    push ax
    add dl, '0'                    
    pop ax                         
    push dx                        
    inc cx                         
    cmp ax, 0                      
jnz @@loophere
    mov ah, 2                     
@@loophere2:
    pop dx                         
    int 21h                        
    loop @@loophere2
    ret
printax endp
 
printmap proc
mov dx, offset map
mov ah, 9
int 21h
ret
printmap endp
 
clear_screen proc near
mov ah,0
mov al,3
int 10h        
ret
clear_screen endp
 
hidecursor proc near
mov ah, 0fh
int 10h
mov activepagenumber, bh
mov ah, 2
mov bh, activepagenumber
mov dh, 1ah
mov dl, 51h
int 10h
ret    
hidecursor endp  
 
resetcursor proc near
mov dl, 0    
mov dh, 0    
mov bh, 0                  
mov ah, 02h
int 10h
ret    
resetcursor endp                                   
 
clearkeyboardbuffer		proc	near
mov ah,0ch
mov al,0
int 21h
ret
clearkeyboardbuffer		endp
 
delay proc near
mov     cx, 01h
mov     dx, 4240h
mov     ah, 86h
int     15h
ret    
delay endp
 
player:  db 1, 0ah, 0dh, 24h
playerx db 12
playery db 20
enemy1 db '&', 0ah, 0dh, 24h
enemy1x db 5
enemy1y db 40
enemy2 db '&', 0ah, 0dh, 24h
enemy2x db 7
enemy2y db 50
enemy3 db '&', 0ah, 0dh, 24h
enemy3x db 3
enemy3y db 50
enemy4 db '&', 0ah, 0dh, 24h
enemy4x db 5
enemy4y db 50
 
 
activepagenumber db ?
 
 
gameovermsg: db 'GAME OVER', 0ah, 0dh
db 'Press any key to continue...', 0ah, 0dh, 24h
 
score dw 0
 
map dw ' ', 0ah, 0dh
dw '####################################################', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '#                                                  #', 0ah, 0dh
dw '####################################################', 0ah, 0dh
dw 24h, 0ah, 0dh