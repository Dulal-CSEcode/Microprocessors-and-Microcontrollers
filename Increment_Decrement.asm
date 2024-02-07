;Basic Structure of Assembly

org 100h
.model small
   
.data 
   
 .code 
  
  main proc  
    
    ;Always input newa hoy AL er moddhe and output thake DL er modhe
    
  
  mov ah,1   ;scanf
  int 21h    ;coming from terminal
  mov bl,al  ;store kore rakhlam jeta input nilam
  mov cl,bl           
   
  
  mov ah,2
  mov dl,032 ;space           Alternative space is mov ah,2
  int 21h                                         ;mov dl,032
                                                  ;int 21h 
    
  
  
  mov ah,1
  int 21h  ;2nd input
  
  
  add bl,al
  sub cl,al
           
  ;decrement
  dec bl
  ;increment
  inc cl
  
    
  
  
  sub bl,48;orginal number dekhar jonno eta kora hoy
  add cl,48;orginal numuber dekhar jonno
  
  
  
  
  
  mov ah,2
  mov dl,0Ah ;new line
  int 21h 
  
  mov ah,2 ;cret er somoy eta nah dilo o kaj kore
  mov dl,0Dh ;cret kora hoy 0Dh diya karon holo
  int 21h    ;jokhon new line kora hoy tokhon ekta space pore jay 
             ;tar jonno cret kortei hobe every time
  
  
  
  
  ;addition operation result
  mov ah,2;printf
  mov dl,bl
  int 21h;display output terminal  
  
  
  ;sub result
  
  mov ah,2
  mov dl,032 ;space 
  int 21h
  
  mov ah,2
  mov dl,cl
  int 21h
  
  
   
  

  
  
  
    
    
  main endp
  
  end main