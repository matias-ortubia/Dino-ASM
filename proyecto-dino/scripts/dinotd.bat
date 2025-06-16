tasm /zi main.asm
tasm /zi espera.asm
tasm /zi logic.asm
tasm /zi dino.asm
tasm /zi score.asm
tasm /zi sprite.asm
tasm libsp.asm
tasm /zi menu.asm

tlink /v main.obj espera.obj logic.obj dino.obj score.obj sprite.obj libsp.obj menu.obj

td main