;=======================================================================
; INT 80h - Devuelve número entre 0 y 9 (en AL) usando el reloj del DOS
;=======================================================================
.8086
.model tiny
.code
org 100h

start:
    jmp instalar

; --- ISR de INT 80h ---
rand_isr:
    push cx
    push dx
    mov ah, 2Ch        ; Obtener hora (DL = centésimas de segundo)
    int 21h
    xor ax, ax
    mov al, dl         ; Usamos centésimas
    mov cl, 10
    div cl             ; AL = 0–9
    xor ah, ah
    pop dx
    pop cx
    iret

; --- Variables y mensaje ---
oldOffset dw 0
oldSegment dw 0

msg db "INT 80h instalada correctamente!", 13, 10, "$"
end_res label byte

; --- Instalación de la INT 80h ---
instalar:
    mov ax, cs
    mov ds, ax
    mov es, ax

    ; Guardar INT 80h anterior (por buena práctica)
    mov ax, 3580h
    int 21h
    mov oldOffset, bx
    mov oldSegment, es

    ; Instalar nuestra rutina
    mov dx, offset rand_isr
    mov ax, 2580h
    int 21h

    ; Mostrar cartel
    mov dx, offset msg
    mov ah, 09h
    int 21h

    ; Dejar residente
    mov ax, offset end_res
    add ax, 15
    shr ax, 4
    mov dx, ax
    mov ax, 3100h
    int 21h

end start
