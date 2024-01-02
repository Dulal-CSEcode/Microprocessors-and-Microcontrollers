
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
       .data
    a dw 6
    b dw 4
    sum dw ? 
    def  dw ?
    mult dw ?
    divi dw ?
    rem dw ?
       .code
  main proc
    mov ax,@data
    mov ds,ax   
    
          ;adddation
      
    mov ax,a
    add ax,b
    
    mov sum,ax  
    
           ;subtactor
         
    mov ax,a 
    sub ax,b
    
    mov def ,ax
  
            ;multipacation    
            
    mov ax,a
    mul b
        
    mov mult,ax
        
          ; devetion
        
    mov ax,a
    div b 
    
    mov divi ,ax
        
    mov rem,dx 
        
        main endp
  end main 

ret




