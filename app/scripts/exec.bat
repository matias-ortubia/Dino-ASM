@echo off
COPY "..\src\main.asm" "C:\Tasm 1.4\Tasm\main.asm"
COPY "..\src\input.asm" "C:\Tasm 1.4\Tasm\input.asm"
COPY "..\src\logic.asm" "C:\Tasm 1.4\Tasm\logic.asm"
COPY "..\src\draw.asm" "C:\Tasm 1.4\Tasm\draw.asm"
COPY "..\src\score.asm" "C:\Tasm 1.4\Tasm\score.asm"
COPY "..\src\sprite.asm" "C:\Tasm 1.4\Tasm\sprite.asm"
COPY "..\src\menu.asm" "C:\Tasm 1.4\Tasm\menu.asm"
COPY "..\docs\dino.conf" "C:\Tasm 1.4\Techapple.net\dino.conf"
COPY "dino.bat" "C:\Tasm 1.4\Tasm\dino.bat"
COPY "dinotd.bat" "C:\Tasm 1.4\Tasm\dinotd.bat"

"C:\Tasm 1.4\Techapple.net\DOSBox.exe" -conf "C:\Tasm 1.4\Techapple.net\dino.conf"