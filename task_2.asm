org 100h

section .bss
    num1 resb 1  ; Allocate space for the first input
    num2 resb 1  ; Allocate space for the second input
    result resb 1  ; Allocate space for the result

section .text
    global _start

_start:
    ; Display a prompt to enter the first number
    mov ah, 9
    mov dx, prompt1
    int 21h

    ; Read the first digit from the user
    mov ah, 1
    int 21h
    sub al, '0'  ; Convert ASCII to integer
    mov [num1], al

    ; Display a prompt to enter the second number
    mov ah, 9
    mov dx, prompt2
    int 21h

    ; Read the second digit from the user
    mov ah, 1
    int 21h
    sub al, '0'  ; Convert ASCII to integer
    mov [num2], al

    ; Perform addition
    mov al, [num1]
    add al, [num2]
    mov [result], al

    ; Display the addition result
    mov ah, 9
    mov dx, result_prompt
    int 21h

    ; Display the result character
    mov dl, [result]
    add dl, '0'
    mov ah, 2
    int 21h

    ; Perform subtraction
    mov al, [num1]
    sub al, [num2]
    mov [result], al

    ; Display the subtraction result
    mov ah, 9
    mov dx, result_prompt
    int 21h

    ; Display the result character
    mov dl, [result]
    add dl, '0'
    mov ah, 2
    int 21h

    ; Perform multiplication
    mov al, [num1]
    mul byte [num2]
    mov [result], al

    ; Display the multiplication result
    mov ah, 9
    mov dx, result_prompt
    int 21h

    ; Display the result character
    mov dl, [result]
    add dl, '0'
    mov ah, 2
    int 21h

    ; Perform division
    mov al, [num1]
    xor ah, ah
    div byte [num2]
    mov [result], al

    ; Display the division result
    mov ah, 9
    mov dx, result_prompt
    int 21h

    ; Display the result character
    mov dl, [result]
    add dl, '0'
    mov ah, 2
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

section .data
    prompt1 db "Enter the first single-digit number: $"
    prompt2 db "Enter the second single-digit number: $"
    result_prompt db "Result: $"
