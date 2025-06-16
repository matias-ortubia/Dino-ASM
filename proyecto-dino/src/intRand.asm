;=======================================================================
; INT 80h - Devuelve número entre 0 y 9 (en AL) usando el reloj del DOS
;=======================================================================
.8086
.model tiny
.code
org 100h

start:
    jmp instalar

; --- ISR que será llamada por INT 80h ---
rand_isr proc far
    push ax
    push cx
    push dx

    mov ah, 2Ch     ; DOS: obtener hora (CH=hora, CL=min, DH=seg, DL=centesimas)
    int 21h
    mov al, dl      ; tomamos los centésimos de segundo (0-99)
    xor ah, ah
    mov cl, 10
    div cl          ; AL / 10 → resto (AH) es entre 0 y 9
    mov al, ah      ; devolver ese en AL
    xor ah, ah

    pop dx
    pop cx
    pop ax
    iret
rand_isr endp

msg db "INT 80h instalada correctamente!", 13, 10, "$"
end_res label byte

instalar:
    mov ax, cs
    mov ds, ax
    mov es, ax

    ; Instalar nuestra ISR
    mov dx, offset rand_isr
    mov ax, 2580h
    int 21h

    ; Mostrar mensaje
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
