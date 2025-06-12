.8086
.model small
.stack 100h
.data

.code
    EXTRN menu:PROC  ; -> MENU.ASM

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

    call menu

    mov ax, 4C00h
    int 21h
main endp

end