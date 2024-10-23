
 	icl "..\..\asm\Fixes.asm"
 
 	org $9e
  	sei		;Prevent crash when key is pressed

	ins "ROLLTYRE-Original.xex",+8+4
	
	opt h+
	run $9e
