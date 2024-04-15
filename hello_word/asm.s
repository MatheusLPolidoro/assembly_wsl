global _start

_start:
    CALL print_hello_world
    JMP exit

print_hello_world:
    MOV rax, 1              ; Número da chamada do sistema para escrever
    MOV rdi, 1              ; Código de saída com definição da instrução 0 strin, 1 stdout, 2 strerror
    LEA rsi, [hello_str]    ; LOAD EFECTIVE ADDRESS, passando um ponteiro para o registrador rsi
    MOV rdx, 14             ; movendo a quantidade de caracteres para o registrador rdx
    SYSCALL                 ; Invoca a chamada de sistema
    RET                     ; Retorna para quem chamou

exit:
    MOV rax, 60         ; Número da chamada de sistema para sair
    MOV rdi, 0          ; Código de saída (0 neste caso)
    SYSCALL             ; Invoca a chamada de sistema

section .data
    hello_str db 'hello, world!', 0x0A  ; String com quebra de linha
