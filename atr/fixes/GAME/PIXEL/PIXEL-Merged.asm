
	opt h-
	ins "PIXEL"

	opt h+
	org $806
	.proc loader
	ldy #>[.len percussi+$ff]
	ldx #0
loop
from	lda percussi,x
to	sta $1760,x
	inx
	bne loop
	inc from+2
	inc to+2
	dey
	bne loop

	jmp ($02e0)
	.endp

;	FF FF 60 17 CC 1F
	org $2000
	.local percussi
	ins "PERCUSSI.dat",+6
	.endl
	
	.proc init2
	mva #0 712
	rts
	.endp

	ini init2