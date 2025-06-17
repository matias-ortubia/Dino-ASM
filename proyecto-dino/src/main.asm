.8086
.model small
.stack 100h

.code
    EXTRN menu:PROC                  ; -> MENU.ASM
    EXTRN dibujar_game_over:PROC     ; -> MENU.ASM
    EXTRN dibujar_ganaste:PROC     ; -> MENU.ASM
    EXTRN juego:PROC                 ; -> DINO.ASM
    ;EXTRN CREA_RECORDS:PROC          ; -> ARCHIVO.ASM
    EXTRN modo_texto:PROC            ; -> LOGIC.ASM

    PUBLIC GAME_OVER
    PUBLIC GAME_WIN

main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    CALL modo_texto ; SETEO PANTALLA EN MODO VIDEO - TEXTO y OCULTO CURSOR

    ;CALL CREA_RECORDS ; CREO ARCHIVO PARA GUARDAR RECORDS
    ;QEPD

menu_principal:
    call menu

    cmp bl, 2
    je  salir_programa
    cmp bl, 0
    je  dino

    jmp menu_principal
dino:
    call juego

salir_programa:
    CALL modo_texto ; RESETEO PANTALLA

    mov ax, 4C00h
    int 21h
main endp

game_over proc
        CALL modo_texto ; RESETEO PANTALLA

        call dibujar_game_over

        call main
        RET
game_over endp

game_win proc
        CALL modo_texto ; RESETEO PANTALLA

        call dibujar_ganaste

        call main
        RET
game_win endp

end