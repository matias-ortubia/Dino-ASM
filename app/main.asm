.8086
.model small
.stack 100h
.data

.code
    EXTRN menu:PROC             ; -> MENU.ASM
    EXTRN dibujar_dino:PROC     ; -> DRAW.ASM

main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Configurar modo video (80x25 texto)
    mov ax, 0003h
    int 10h

    ; Ocultar cursor
    mov ah, 01h
    mov cx, 2607h
    int 10h
menu_principal:
    call menu

    cmp bl, 2
    je  salir_programa
    cmp bl, 0
    je  dino

    jmp menu_principal
dino:
    call juego
    jmp menu_principal

salir_programa:
    mov ax, 4C00h
    int 21h
main endp

juego proc
    push ax
    push bx
    push cx
    push dx
    push si
    push bp
    push di

    mov di,0
    call dibujar_dino

    pop di
    pop bp
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
juego endp

end