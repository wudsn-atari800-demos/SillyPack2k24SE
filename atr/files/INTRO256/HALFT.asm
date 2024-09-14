	org $4000
start

;copy font
	ldy #0
	sty $ED
tmc lda fontd,y
	sta $2C00,y
	iny
;	cpy #32
	bne tmc
	lda #$2C
	sta 756

;build map
;	mwa #$2000 $EB
;	lda #0
;	sta $ED ; Y counter
	lda 88
	sta $EB
	lda 89
	sta $EC

bmay
	ldy #0
	lda $ED
	and #7
	asl @
	asl @
	asl @
	sta $EE
bmax
	tya
	and #7
	ora $EE
	
	tax
	lda pat,x
	sta ($EB),y
	iny
	cpy #40
	bne bmax
	tya
	jsr ebecplusa
	inc $ED
	lda $ED
	cmp #24
	bne bmay
;


huj
	jsr wait_frame
	jsr wait_frame
;	mwa #$2000 $EB
	lda 88
	sta $EB
	lda 89
	sta $EC
	lda #24
	sta $ED
huy
	ldy #0
hux
	lda ($EB),y
	tax
	lda incv,x
	sta ($EB),y
	iny
	cpy #40
	bne hux
	tya
	jsr ebecplusa
	dec $ed
	bne huy
	jmp huj
incv dta 1,2,3,0
pat
 dta 3,2,1,0,0,0,0,0
 dta 3,2,1,0,1,1,1,1
 dta 3,2,1,0,2,2,2,2
 dta 3,2,1,0,3,3,3,3
 dta 0,0,0,0,3,2,1,0
 dta 1,1,1,1,3,2,1,0
 dta 2,2,2,2,3,2,1,0
 dta 3,3,3,3,3,2,1,0

wait_frame
RTCLOK      equ $0012
      lda RTCLOK+2
waits
      cmp RTCLOK+2
       beq waits
 rts
ebecplusa
	clc
	adc $EB
	sta $EB
	bcc noplushec
	inc $EC
noplushec
	rts

fontd
	dta %00000000
	dta %00000000
	dta %00000000
	dta %00011000
	dta %00011000
	dta %00000000
	dta %00000000
	dta %00000000

	dta %00000000
	dta %00000000
	dta %00011000
	dta %00111100
	dta %00111100
	dta %00011000
	dta %00000000
	dta %00000000

	dta %00000000
	dta %00011000
	dta %00111100
	dta %01111110
	dta %01111110
	dta %00111100
	dta %00011000
	dta %00000000

	dta %00000000
	dta %00111100
	dta %01111110
	dta %01111110
	dta %01111110
	dta %01111110
	dta %00111100
	dta %00000000


; icl "utils.inc"
	run start
