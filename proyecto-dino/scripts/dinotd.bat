tasm int80Rand.asm
tlink /t int80Rand.obj

tasm /zi main.asm
tasm /zi espera.asm
tasm /zi logic.asm
tasm /zi dino.asm
tasm /zi score.asm
tasm /zi sprite.asm
tasm /zi libsp.asm
tasm /zi archivo.asm
tasm /zi menu.asm

tlink /v main.obj espera.obj logic.obj dino.obj score.obj sprite.obj libsp.obj archivo.obj menu.obj

intRand.com
td main