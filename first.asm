
section .data
    msg db "Hello, World!", 0xA  ; The message to print, with a newline character
    len equ $ - msg              ; Calculate the length of the message

section .text
    global _start                ; Entry point for the program

_start:
    ; Write the message to stdout
    mov eax, 4                   ; syscall: sys_write
    mov ebx, 1                   ; file descriptor: stdout
    mov ecx, msg                 ; pointer to the message
    mov edx, len                 ; length of the message
    int 0x80                     ; make the system call

    ; Exit the program
    mov eax, 1                   ; syscall: sys_exit
    xor ebx, ebx                 ; exit code: 0
    int 0x80                     ; make the system call
