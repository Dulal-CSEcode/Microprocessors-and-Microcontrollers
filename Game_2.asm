org 100h    
jmp start
 
start:
call init
jmp maingameloop  
 
maingameloop:
call printplayer
call printbullet 
call printenemies 
call printscore
call hidecursor  
call delay
call clearmovingobjects
call checkinput    
call updategame
mov al, gameover
cmp al, true
je endgame    
jmp maingameloop    
 
exit: 
call clearscreen
mov dl, 0
mov dh, 0
mov bh, 0
mov ah, 02h
int 10h
xor ax, ax
xor bx, bx
xor cx, cx
xor dx, dx
xor di, di
xor si, si
mov bp, sp
mov ah, 4Ch
mov al, 00h
int 21h    
 
endgame:
call clearscreen
mov dl, 0
mov dh, 0
mov bh, 0
mov ah, 02h
int 10h
mov dx, gameovermsg
mov ah, 09h
int 21h
call gameoverdelay
jmp exit
 
init proc near      
call srandsystime
call clearscreen 
call printmap
mov al, 14
mov ah, 11
mov byte ptr[playerx], al
mov byte ptr[playery], ah   
mov al, 60
mov ah, 12
mov byte ptr[bulletx], al
mov byte ptr[bullety], ah
mov cx, 6
mov bl, 2
mov di, 0   
mov al, 7
mov ah, 0
initenemies:
mov byte ptr[enemiesx[di]], al
mov byte ptr[enemiesy[di]], ah
add al, bl
inc di
loop initenemies 
ret     
init endp                 
 
printplayer proc near
mov dl, playerx   
mov dh, playery   
mov bh, 0     
mov ah, 02h   
int 10h 
mov dx, player
mov ah, 09h
int 21h
ret
printplayer endp 
 
printbullet proc near
mov al, isbulletfiring
cmp al, true
je finalizeprintbullet
jmp endprintbullet
finalizeprintbullet:
mov dl, bulletx
mov dh, bullety
mov bh, 0
mov ah, 02h
int 10h
mov dx, bullet
mov ah, 09h
int 21h
jmp endprintbullet
endprintbullet:
ret    
printbullet endp  
 
printscore proc near
mov dl, 3
mov dh, 15
mov bh, 0
mov ah, 02h
int 10h
mov dx, scoremsg
mov ah, 09h
int 21h
mov ax, score
call printax
ret     
printscore endp
 
printenemies proc near
mov cx, 6
mov di, 0
PELP1:
mov dl, enemiesx[di]
mov dh, enemiesy[di]
mov bh, 0
mov ah, 02h
int 10h
mov dx, enemy
mov ah, 09h
int 21h
inc di
loop PELP1
ret
printenemies endp
 
clearmovingobjects proc near
mov dl, playerx
mov dh, playery
mov bh, 0
mov ah, 02h
int 10h                                              
mov dx, emptyspace
mov ah, 09h
int 21h   
mov dl, bulletx
mov dh, bullety
mov bh, 0
mov ah, 02h
int 10h
mov dx, emptyspace
mov ah, 09h
int 21h
mov cx, 6
mov di, 0 
CELP1:   
mov dl, enemiesx[di]
mov dh, enemiesy[di]
mov bh, 0
mov ah, 02h
int 10h
mov dx, emptyspace 
mov ah, 09h
int 21h          
inc di
loop CELP1
mov dl, 11
mov dh, 15
mov bh, 0
mov ah, 02h
int 10h
mov dx, emptyscore
mov ah, 09h
int 21h 
ret    
clearmovingobjects endp     
 
printmap proc near
mov dl, 0
mov dh, 0
mov bh, 0
mov ah, 02h                                            
int 10h
mov dx, map
mov ah, 09h
int 21h
ret 
printmap endp
 
checkinput proc near
mov ah, 01h
int 16h
cmp ax, uparrow
je up
cmp ax, downarrow
je down
cmp ax, leftarrow
je left
cmp ax, rightarrow
je right          
cmp ax, spacebar
je fire
cmp ax, f4
je exit       
jmp still
up:  
call flushkeyboardbuffer  
mov al, directionup
mov byte ptr [input], al
jmp endcheckinput    
down: 
call flushkeyboardbuffer                
mov al, directiondown
mov byte ptr [input], al
jmp endcheckinput  
left:                     
call flushkeyboardbuffer
mov al, directionleft
mov byte ptr [input], al 
jmp endcheckinput
right: 
call flushkeyboardbuffer
mov al, directionright
mov byte ptr [input], al
jmp endcheckinput
still:               
mov al, directionstill
mov byte ptr[input], al
jmp endcheckinput     
fire:                       
mov al, isbulletfiring
cmp al, true
jne finalizefire
jmp endcheckinput
finalizefire:
call flushkeyboardbuffer   
mov al, playerx
mov byte ptr[bulletx], al
mov ah, playery
dec ah
mov byte ptr[bullety], ah
mov al, true
mov byte ptr[isbulletfiring], al
jmp endcheckinput
flush:
call flushkeyboardbuffer
jmp endcheckinput
endcheckinput:
ret 
checkinput endp
 
updategame proc near
mov al, input
cmp al, directionup
je moveup
cmp al, directiondown
je movedown
cmp al, directionleft
je moveleft
cmp al, directionright
je moveright 
jmp endplayerupdate
moveup:
mov al, playery    
cmp al, 12
jg finalizeup
jmp endplayerupdate
finalizeup:
dec al
mov byte ptr[playery], al
jmp endplayerupdate
movedown:
mov al, playery  
cmp al, 11
jl finalizedown
jmp endplayerupdate 
finalizedown:
inc al
mov byte ptr[playery], al
jmp endplayerupdate
moveleft:          
mov al, playerx 
cmp al, 1
jg finalizeleft
jmp endplayerupdate
finalizeleft:
dec al
mov byte ptr[playerx], al
jmp endplayerupdate
moveright:
mov al, playerx   
cmp al, 25         
jl finalizeright   
jmp endplayerupdate 
finalizeright:
inc al
mov byte ptr[playerx], al
jmp endplayerupdate
endplayerupdate:
mov al, isbulletfiring
cmp al, true
je fireabullet
jmp endbulletupdate 
fireabullet:
mov al, bullety  
cmp al, 0
jg finalizefireabullet
jmp stopfiring
finalizefireabullet:  
dec al
mov byte ptr[bullety], al
jmp endbulletupdate
stopfiring:
mov al, false
mov byte ptr[isbulletfiring], al
jmp endbulletupdate
endbulletupdate:
jmp updateenemies
updateenemies:         
mov cx, 6
mov di, 0
UECPLP1:   
jmp CEP
newepos:          
call rand
call rand2num1to20
add al, 4
mov byte ptr[enemiesx[di]], al  
call rand
call rand2num1to6 
sub al, 10
mov byte ptr[enemiesy[di]], al
mov al, updatestate
cmp al, enemystatemoving
je EUECPLP1           
cmp al, enemystatebhit
je ECECB
CEP:
mov al, enemystatemoving
mov byte ptr[updatestate], al
mov al, enemiesy[di]
cmp al, 11
jle UELP1 
cmp al, 12   
jge newepos        
UELP1:                                              
mov al, enemiesy[di]
inc al
mov byte ptr[enemiesy[di]], al 
EUECPLP1:
inc di
loop UECPLP1
jmp endenemiesupdate
endenemiesupdate:
jmp checkplayercollidingenemy
checkplayercollidingenemy:
mov cx, 6
mov di, 0
CPCELP1:
mov al, enemiesx[di]
cmp al, playerx
je phase2
jmp ECPCELP1
phase2:
mov ah, enemiesy[di]
cmp ah, playery
je setgameover
jmp ECPCELP1  
ECPCELP1:     
inc di
loop CPCELP1
jmp endcheckplayercollidingenemy
setgameover:
mov al, true
mov byte ptr[gameover], al
jmp endupdate
endcheckplayercollidingenemy:
jmp checkenemycollidingbullet
checkenemycollidingbullet:
mov cx, 6
mov di, 0
CECB:
mov al, enemiesy[di]
cmp al, bullety
je bphase2
jmp ECECB 
enemyhit:
mov ax, 5
add word ptr[score], ax
jmp newepos
bphase2:                     
mov al, updatestate
mov byte ptr[updatestate], al
mov al, enemiesx[di]
cmp al, bulletx            
je enemyhit                  
mov al, enemystatenone
mov byte ptr[updatestate], al
jmp ECECB
ECECB:
inc di
loop CECB
endupdate:
ret
updategame endp   
 
delay proc near
mov cx, 01h
mov dx, 4240h
mov ah, 86h
int 15h
ret
delay endp
 
gameoverdelay proc near
mov cx, 32h
mov dx, 4240h
mov ah, 86h
int 15h
ret
gameoverdelay endp
 
clearscreen proc near
mov ah,0
mov al,3
int 10h        
ret
clearscreen endp  
 
hidecursor proc near
mov dl, 128
mov dh, 128
mov bh, 00h
mov ah, 02h
int 10h
ret
hidecursor endp 
 
flushkeyboardbuffer proc
mov ah,0ch
mov al,0
int 21h
ret
flushkeyboardbuffer endp 
 
srandsystime proc near
push cx
push dx
xor ax, ax           
int 1ah
mov word ptr [seed], dx     
pop dx
pop cx
ret           
srandsystime endp  
 
rand proc
push dx
mov ax, 25173       
mul word ptr [seed] 
add ax, 13849       
mov word ptr [seed], ax      
pop dx
ret    
rand endp
 
rand2num1to20 proc
push dx
push bx
xor dx,dx          
mov bx,20         
div bx
inc dx              
mov ax,dx
pop bx
pop dx
ret   
rand2num1to20 endp  
 
rand2num1to6 proc
push dx
push bx
xor dx,dx          
mov bx,6         
div bx
inc dx              
mov ax,dx
pop bx
pop dx
ret   
rand2num1to6 endp      
 
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
 
 
true             equ 1
false            equ 0
uparrow          equ 4800h
downarrow        equ 5000h
leftarrow        equ 4B00h
rightarrow       equ 4D00h        
spacebar         equ 3920h
f4               equ 3E00h
directionup      equ 0EAh
directiondown    equ 0EBh
directionleft    equ 0ECh
directionright   equ 0EDh 
directionstill   equ 0EEh
firebullet       equ 0EFh      
enemystatemoving equ 0DCh
enemystatebhit   equ 0DDh     
enemystatenone   equ 0ADh  
 
 
player:        db 0EAh, 24h
playerx        db 0ACh
playery        db 0ACh
playerhealth   db 100
playerscore    db 0
gameover       db false
input          db 0ACh
bullet:        db '|', 24h
isbulletfiring db 0Ach 
bulletx        db 0ACh
bullety        db 0ACh     
enemy:         db 'O', 24h
enemiesx       db 0ACh, 0ACh, 0ACh, 0ACh, 0ACh, 0ACh
enemiesy       db 0ACh, 0ACh, 0ACh, 0ACh, 0ACh, 0ACh  
gameovermsg:   db 'GAME OVER', 24h
scoremsg:      db 'Score: ', 24h
emptyspace:    db 20h, 24h   
emptyscore:    db 20h, 20h, 20h, 20h, 20h, 24h
updatestate    db 0ACh
seed           dw 0ADh      
score          dw 0
 
map: db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh
     db 0C7h,"                         ",0C7h, 0ah, 0dh   
     db 0C7h,"                         ",0C7h, 0ah, 0dh           
     db 24h