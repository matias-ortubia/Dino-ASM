.8086
.model tiny

.code
    EXTRN menu:PROC                  ; -> MENU.ASM
    EXTRN dibujar_game_over:PROC     ; -> MENU.ASM
    EXTRN juego:PROC                 ; -> DINO.ASM
    EXTRN CREA_RECORDS:PROC          ; -> ARCHIVO.ASM

    PUBLIC GAME_OVER

main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    ; Configurar modo video (80x25 texto) 16 COL
    mov ax, 0003h
    int 10h

    ; Ocultar cursor
    mov ah, 01h
    mov cx, 2607h
    int 10h

    CALL CREA_RECORDS
    
menu_principal:
    call menu

    cmp bl, 2
    je  salir_programa
    cmp bl, 0
    je  dino

    jmp menu_principal
dino:
    call juego
    ;jmp menu_principal

salir_programa:

    mov ax, 4C00h
    int 21h
main endp

game_over proc
        ; Configurar modo video (80x25 texto) 16 COL
        mov ax, 0003h
        int 10h

        ; Ocultar cursor
        mov ah, 01h
        mov cx, 2607h
        int 10h

        call dibujar_game_over

        call main
game_over endp

end