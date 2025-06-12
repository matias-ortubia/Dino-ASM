.8086
.model small
.stack 100h

.data
		
.code
    PUBLIC imprimir_cadena

imprimir_cadena proc
        push ax
        push bx
        push cx
        push dx
        push si
        push bp
        push di
        
        mov di, si              ; DI para contar longitud
        mov bp, si              ; BP = offset cadena (ES:BP para int 10h)
        mov ax, ds
        mov es, ax              ; ES = segmento de datos
        
        ; Contar longitud de cadena
        xor cx, cx              ; CX = contador de longitud
    contar:
        mov al, [di]
        inc di
        cmp al, 0
        je  imprimir
        inc cx
        jmp contar

    imprimir:
        jcxz salir              ; Si cadena vacía, saltar
        mov bh, 0               ; Página 0
        mov ax, 1301h           ; AH=13h (escribir cadena), AL=01h (modo atributo)
        int 10h

    salir:

        pop di
        pop bp
        pop si
        pop dx
        pop cx
        pop bx
        pop ax
        ret
imprimir_cadena endp

end