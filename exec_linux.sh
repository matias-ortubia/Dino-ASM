#!/bin/bash
# Script para copiar archivos del proyecto dino en Ubuntu
# Cambiar las rutas si no funciona

cp proyecto-dino/src/intRand.asm ~/Documents/tasm/intRand.asm
cp proyecto-dino/src/main.asm ~/Documents/tasm/main.asm
cp proyecto-dino/src/espera.asm ~/Documents/tasm/espera.asm
cp proyecto-dino/src/logic.asm ~/Documents/tasm/logic.asm
cp proyecto-dino/src/dino.asm ~/Documents/tasm/dino.asm
cp proyecto-dino/src/score.asm ~/Documents/tasm/score.asm
cp proyecto-dino/src/sprite.asm ~/Documents/tasm/sprite.asm
cp proyecto-dino/src/libsp.asm ~/Documents/tasm/libsp.asm
cp proyecto-dino/src/archivo.asm ~/Documents/tasm/archivo.asm
cp proyecto-dino/src/menu.asm ~/Documents/tasm/menu.asm
cp proyecto-dino/docs/dino.conf ~/Documents/tasm/dino.conf
cp proyecto-dino/scripts/dino.bat ~/Documents/tasm/dino.bat
cp proyecto-dino/scripts/dinotd.bat ~/Documents/tasm/dinotd.bat

# Ejecutar DOSBox con el archivo de configuración
dosbox -conf ~/Documents/tasm/dino.conf
