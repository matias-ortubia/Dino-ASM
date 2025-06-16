.8086
.model small
.stack 100h
.data
    salto_activo db 0
    ticks_salto  db 0
    
    dino_color db 3fh       ;(ROJO)
    dino_x db 30
    dino_y db 120
    dino_y_salto db 100
    dino_y_ori   db 120

    obstaculo_color db 02h  ;(VERDE)
    obstaculo_x db 250
    obstaculo_y db 120
    obstaculo_x_ori db 250

.code
    EXTRN limpiar_pantalla:PROC ; -> LOGIC.ASM
    EXTRN modo_negro:PROC       ; -> LOGIC.ASM

    EXTRN ESPERA:PROC           ; -> ESPERA.ASM

    EXTRN FONDOSP:PROC          ; -> SPRITE.ASM
    EXTRN DINOSP:PROC           ; -> SPRITE.ASM
    EXTRN OBSTACULOSP:PROC      ; -> SPRITE.ASM

    EXTRN GAME_OVER:PROC      ; -> MAIN.ASM

    PUBLIC JUEGO

juego proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    CALL LIMPIAR_PANTALLA

    ;----------------
    ; MODO GRAFICO 256 COL
    mov ah, 00h
    mov al, 13h
    int 10h

inicio:
    call MODO_NEGRO
    call FONDOSP
    mov bl, obstaculo_x_ori
    mov obstaculo_x, bl

game_loop:
    mov al, dino_color
    mov bl, dino_x
    mov cl, dino_y
    call DINOSP

    mov al, obstaculo_color
    mov bl, obstaculo_x
    mov cl, obstaculo_y
    call OBSTACULOSP

    call colision

    mov ah, 0
    call espera

    mov ah, 01h
    int 16h
    jz sin_tecla

    mov ah, 00h
    int 16h
    cmp al, 'w'
    je salto

sin_tecla:
    call manejar_salto
    call mover_obstaculo
    
    jmp game_loop

salto:
    mov salto_activo, 1
    jmp sin_tecla

finJuego:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
juego endp

manejar_salto proc
    PUSH AX
    PUSH BX
    PUSH CX

    mov ah, 0
    call borro_sprite

    cmp salto_activo, 0
    je sin_salto

    MOV bl, dino_y_salto
    MOV dino_y, bl

    mov al, ticks_salto
    cmp al, 10
    je fin_salto
    inc al
    mov ticks_salto, al
    jmp fin
fin_salto:
    call FONDOSP
    mov ticks_salto, 0    
    mov salto_activo, 0
sin_salto:
    MOV bl, dino_y_ori
    MOV dino_y, bl
fin:
    POP CX
    POP BX
    POP AX
    ret
manejar_salto endp

mover_obstaculo proc
    PUSH AX
    PUSH BX
    PUSH CX

    mov ah, 1
    call borro_sprite
    
    mov al, dino_x
    sub al, 20
    cmp obstaculo_x, al
    jbe resetObs

    mov bl, obstaculo_x
    sub bl, 5
    mov obstaculo_x, bl
    jmp finObs
resetObs:
    mov bl, obstaculo_x_ori
    mov obstaculo_x, bl
finObs:
    POP CX
    POP BX
    POP AX
    ret
mover_obstaculo endp

colision proc
    PUSH AX
    PUSH BX

    mov al, dino_x
    sub al, 5
    cmp al, obstaculo_x
    jbe comparaX
    jmp continua
comparaX:
    add al, 10
    cmp al, obstaculo_x
    jbe continua
comparaY:
    mov al, dino_y
    cmp al, obstaculo_y
    jne continua

    mov ah, 1
    call espera
    CALL GAME_OVER ; Si XY son iguales para ambas figuras PIERDE!
continua:
    POP BX
    POP AX
    RET
colision endp

borro_sprite PROC
    PUSH AX
    PUSH BX
    PUSH CX

    mov al, 00H             ;(NEGRO)
    cmp ah, 1
    je obs

    mov bl, dino_x
    mov cl, dino_y
    call DINOSP
    jmp finSp
obs:
    mov bl, obstaculo_x
    mov cl, obstaculo_y
    call OBSTACULOSP
finSp:
    POP CX
    POP BX
    POP AX
    ret
borro_sprite endp

end