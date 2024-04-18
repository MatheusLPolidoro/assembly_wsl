# Primeiro Programa Assembly 📜
Estudo feito embasado na playlist: **Fundamentos de assembly x86-64**<br>

✍️ Autor [Blau Araujo](https://codeberg.org/blau_araujo)<br>
🗒️ Repositório: [codeberg](https://codeberg.org/blau_araujo/assembly-nasm-x86_64/src/branch/main/01-salve/README.md)<br>
📽️ Playlist videos: [Youtube](https://www.youtube.com/watch?v=Ej6U-qk0bdE&list=PLXoSGejyuQGohd0arC7jRBqVdQqf5GqKJ) 

## Objetivos 🎯
- Apresentar os conceitos mais fundamentais da programação em assembly.
- Exemplificar a estrutura elementar de um código em assembly.
- Apresentar o conceito de chamadas de sistema.
- Ilustrar os atributos básicos dos tipos de dados.
- Demonstrar os procedimentos de montagem (nasm) e linkedição (ld).

## Seções e segmentos do código (section/segment)
- Seções (section) é a maneira de **organização** do código, utilizada pelo linker (ligador) no momento da criação do arquivo binário.
- Os segmentos descrevem os dados, para serem vistos **durante a execução** pelo sistema operacional.
- Não existe limite para quantidade de seções criadas, elas podem possuir qualquer nome e qualquer ordem.
- Existem seções padrão, que tem seus atributos configurados pelo **assemblador** (estou usando o 'nasm', ferramenta que monta o código objeto antes do linker).

## Código
```asm
section .data
    msg: db "hello world!", 10      ; 'msg' variavel/rótulo definida
                                    ; ':' é opcional
                                    ; 'db' (define bytes) cadeia de bytes 
    len: equ $ - msg                ; 'len' variavel definida
                                    ; 'equ' (equal) definição de constante
                                    ; '$' endereço do ultimo byte escrito em memória
                                    ; 'msg' endereço do primeiro byte da variavel msg

section .text
    global _start       ; 'global' torna o rótulo '_start'
                        ; visível de qualquer parte do programa

_start:
    mov rax, 1          ; chamada de sistema 'sys_write'
    mov rdi, 1          ; descritor de arquivos 1 (stdout)
    mov rsi, msg        ; ponteiro para a string na memória
    mov rdx, len        ; constante com o tamanho da string
    syscall             

_end:
    mov rax, 60         ; chamada de sistema 'sys_exit'
    mov rdi, 0          ; retorno 0 (sucesso)
    syscall             
```