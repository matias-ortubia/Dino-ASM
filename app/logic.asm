.8086
.model small
.stack 100h

.data
		
.code
    PUBLIC limpiar_pantalla
    PUBLIC delay

limpiar_pantalla proc
    push ax
    push bx
    push cx
    push dx

    ; Limpiar pantalla
    mov ax, 0600h
    mov bh, 07h
    mov cx, 0000h
    mov dx, 184Fh
    int 10h

    pop ax
    pop bx
    pop cx
    pop dx
    ret
limpiar_pantalla endp

delay proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    ; Esperar en base a CX ticks (CX * ~55ms)
    ; CX debe contener la cantidad de ticks antes de llamar
    mov ah, 00h
    int 1Ah
    mov bx, dx
    add bx, cx

.loop_delay:
    mov ah, 00h
    int 1Ah
    cmp dx, bx
    jb .loop_delay

    pop dx
    pop cx
    pop bx
    pop ax
    ret
delay endp

end