.8086
.MODEL SMALL
.STACK 100h

.DATA
    nombreArchivo DB "falopa.txt", 00H
    mensaje       DB "WASAAAA", 0dh, 0ah,24h
    handle        DW ?

.CODE
EXTRN leeTxt:PROC
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --------------------------------------
    ; Crear archivo (modo escritura)
    ; --------------------------------------
    MOV AH, 3Ch            ; Función DOS: Crear archivo
    MOV CX, 0              ; Atributos del archivo (normal)
    LEA DX, nombreArchivo  ; Nombre del archivo
    INT 21h
    JC ERROR               ; Si falla, ir a ERROR
    MOV handle, AX         ; Guardar handle del archivo

    ; --------------------------------------
    ; Escribir en el archivo
    ; --------------------------------------
    mov di, 10
sarasa:

    cmp di, 0
    je aca
    MOV AH, 40h            ; Función DOS: Escribir archivo
    MOV BX, handle         ; Handle del archivo
    LEA DX, mensaje        ; Dirección del mensaje
    MOV CX, 9            ; Cantidad de bytes a escribir (ajustar según el mensaje real)
    INT 21h
    JC ERROR
    dec di
jmp sarasa

aca:
    ; --------------------------------------
    ; Cerrar archivo
    ; --------------------------------------
    MOV AH, 3Eh
    MOV BX, handle
    INT 21h

    LEA DX, nombreArchivo
    call leeTxt

    ; --------------------------------------
    ; Salir al DOS
    ; --------------------------------------
    MOV AX, 4C00h
    INT 21h

ERROR:
    ; Manejo de error simple: terminar
    MOV AX, 4C01h
    INT 21h
MAIN ENDP

END