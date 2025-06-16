.8086
.model small
.stack 100h

.data
	dino_grafic db '  0 ',0
                db ' /|\',0
                db ' / \',0

    salto_activo db 0
    dino_y       db 20
    dino_y_salto db 15

    fila_inicio  equ 10
    col_inicio   equ 10
    normal_attr  db 07h            ; Gris sobre negro
    selec_attr   db 70h            ; Negro sobre gris

.code
    EXTRN limpiar_pantalla:PROC ; -> LOGIC.ASM
    EXTRN delay:PROC            ; -> LOGIC.ASM
    EXTRN modo_negro:PROC       ; -> LOGIC.ASM
    EXTRN sprite:PROC           ; -> SPRITE.ASM

    PUBLIC imprimir_cadena
    PUBLIC dibujar_dino



;-------------------------------------------------------------------------------------------------
;Función dibujar_dino 
;		Realiza: 		
;		Recibe: 		
;		Devuelve: 	
;-------------------------------------------------------------------------------------------------

dibujar_dino proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    call limpiar_pantalla

proceso_dino:
	mov si, offset dino_grafic
	mov cx,0
	mov ax, di
dibujar_dino_s:
    mov dh, fila_inicio
    add dh, cl
    mov dl, col_inicio
	add dl, al
    mov bl, [normal_attr]

    call imprimir_cadena
    ; Avanzar al siguiente item
    inc cx
avanzar_dino:
    mov al, [si]
    inc si
    test al, al
    jnz avanzar_dino
	mov ax, di
    cmp cx, 3
    jb dibujar_dino_s
	inc di
	cmp di,0
	je fin
	call delay
	jmp proceso_dino
fin:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
dibujar_dino endp


end