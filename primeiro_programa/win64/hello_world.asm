section .data
    msg db "hello world!", 10       ; 'msg' variavel/rótulo definida
                                    ; 'db' (define bytes) cadeia de bytes 
    len equ $ - msg                 ; 'len' variavel definida
                                    ; 'equ' (equal) definição de constante
                                    ; '$' endereço do ultimo byte escrito em memória
                                    ; 'msg' endereço do primeiro byte da variavel msg
section .text
    global _start   ; 'global' torna o rótulo '_start'
    extern ExitProcess, GetStdHandle, WriteConsoleA ; funções do sistema

_start:
    mov     ecx, -11        ; 'STD_OUTPUT_HANDLE' saída padrão win
    call    GetStdHandle    ; função que armazena um handle em rax
    sub     rsp, 20h    ; remove 32 bytes na pilha
    lea     r9, [rsp]   ; Carrega o endereço efetivo do topo da pilha
    lea     r8, [len]   ; Carrega o endereço efetivo da variável len
    lea     rdx, [msg]  ; Carrega o endereço efetivo da variável msg
    mov     rcx, rax    ; Move o valor em rax (o handle para a saída) para rcx.
    call    WriteConsoleA ; função WriteConsoleA com os argumentos prontos

    xor     ecx, ecx    ; Zera o registrador ecx.
    call    ExitProcess ; função ExitProcess com o valor em ecx como argumento, retorno 0 (sucesso)