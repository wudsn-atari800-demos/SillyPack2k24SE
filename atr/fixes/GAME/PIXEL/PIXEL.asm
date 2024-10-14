 	icl "..\..\asm\Fixes.asm"
 
	zp = $ca	;Defined free ZP address space, 8 bytes required
	org $4000
	m_load_high zp "PIXEL-Merged.xex"
