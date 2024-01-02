org 100h          ; Set the origin of the program to 100h

.data
array db 6,9,4,7,8,2,1  ; Define an array of bytes with initial values

count dw 7        ; Define a word-sized variable 'count' and initialize it with 7

.code
    mov cx, count  ; Initialize the CX register with the value of 'count'
    dec cx         ; Decrement CX (outer loop iteration count)

nextscan:         ; Start of the outer loop
    mov bx, cx    ; Copy the value of CX to BX (used in the inner loop)
    mov si, 0      ; Initialize SI (source index) to 0

nextcomp:         ; Start of the inner loop
    mov al, array[si]     ; Load the value at array[si] into AL
    mov dl, array[si+1]   ; Load the value at array[si+1] into DL
    cmp al, dl            ; Compare AL and DL
    jnc noswap            ; Jump to noswap if no carry (jump if not less)

    ; Swap the elements if AL is greater than DL
    mov array[si], dl
    mov array[si+1], al

noswap:
    inc si       ; Increment SI (move to the next element in the array)
    dec bx       ; Decrement BX (inner loop iteration count)
    jnz nextcomp ; Jump to nextcomp if BX is not zero (continue inner loop)

    loop nextscan ; Decrement CX and jump to nextscan if CX is not zero (continue outer loop)

;;; this loop to display elements on the screen
    mov cx, 7     ; Initialize CX with 7 (number of elements in the array)
    mov si, 0     ; Initialize SI to 0

print:
    mov al, array[si]  ; Load the value at array[si] into AL
    add al, 30h        ; Convert the value to ASCII by adding 30h
    mov ah, 0eh        ; Set AH to 0eh (Teletype output)
    int 10h            ; Call interrupt 10h to print the character

    mov ah, 2          ; Set AH to 2 (DOS function for character output)
    mov dl, ' '        ; Load a space character into DL
    int 21h            ; Call interrupt 21h to print the space character

    inc si             ; Increment SI (move to the next element in the array)
    loop print         ; Decrement CX and jump to print if CX is not zero (continue printing)

    ret                ; Return from the program
