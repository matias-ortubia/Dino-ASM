.8086
.model small
.stack 100h
.data
    titulo1 db '   DINO   $'
    titulo2 db 'Esquiva los obstaculos$'
    menu1   db 'Jugar$'
    menu2   db 'Records$'
    menu3   db 'Opciones$'
    menu4   db 'Salir$'
.code
start:
    mov ax, @data
    mov ds, ax

    ; Poner modo texto 80x25
    mov ah, 0
    mov al, 3
    int 10h

    ; Limpiar pantalla
    mov ah, 06h
    mov al, 0
    mov bh, 07h
    mov cx, 0
    mov dx, 184Fh
    int 10h

    ; Mostrar "DINO"
    mov ah, 02h
    mov bh, 0
    mov dh, 3
    mov dl, 35
    int 10h

    mov ah, 09h
    lea dx, titulo1
    int 21h

    ; Mostrar "Esquiva los obstaculos"
    mov ah, 02h
    mov dh, 5
    mov dl, 28
    int 10h

    mov ah, 09h
    lea dx, titulo2
    int 21h

    ; Mostrar "Jugar"
    mov ah, 02h
    mov dh, 8
    mov dl, 37
    int 10h

    mov ah, 09h
    lea dx, menu1
    int 21h

    ; Mostrar "Records"
    mov ah, 02h
    mov dh, 10
    mov dl, 36
    int 10h

    mov ah, 09h
    lea dx, menu2
    int 21h

    ; Mostrar "Opciones"
    mov ah, 02h
    mov dh, 12
    mov dl, 35
    int 10h

    mov ah, 09h
    lea dx, menu3
    int 21h

    ; Mostrar "Salir"
    mov ah, 02h
    mov dh, 14
    mov dl, 37
    int 10h

    mov ah, 09h
    lea dx, menu4
    int 21h

    ; Esperar tecla para salir
    mov ah, 08h
    int 21h

    mov ah, 4Ch
    int 21h
end start