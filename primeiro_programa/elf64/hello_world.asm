section .data
    msg db "hello world!", 10       ; 'msg' variavel/rótulo definida
                                    ; 'db' (define bytes) cadeia de bytes 
    len equ $ - msg                 ; 'len' variavel definida
                                    ; 'equ' (equal) definição de constante
                                    ; '$' endereço do ultimo byte escrito em memória
                                    ; 'msg' endereço do primeiro byte da variavel msg

section .text
    global _start       ; 'global' torna o rótulo '_start'
                        ; visível de qualquer parte do programa

_start:
    mov rax, 1          ; mov o valor do sistema 'sys_write' em rax
    mov rdi, 1          ; descritor de arquivos 1 (stdout)
    mov rsi, msg        ; ponteiro para a string na memória
    mov rdx, len        ; constante com o tamanho da string
    syscall             ; chamada do kernel do sistema

_end:
    mov rax, 60         ; chamada de sistema 'sys_exit'
    mov rdi, 0          ; retorno 0 (sucesso)
    syscall             