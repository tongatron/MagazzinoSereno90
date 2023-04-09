CLEA
SET PATH TO E:\FOX\MAGA
USE ARKIVIO
SUM COSTO*GIACONT TO VINV
SUM CARVALOR TO VPRC
SUM COSTO*PROGSCA TO VPRS
SUM COSTO*GIADIN TO VGIA
VTOT = VINV + VPRC
VDIF = VPRC - VPRS
*STORE (V2 * 100)/V5 TO V7
*STORE (V3 * 100)/V5 TO V8
@ 0,0 CLEAR
@ 8,19 SAY  "ษอออออออออออออหอออออออออป"
@ 9,19 SAY  "บ INVENTARIO  บ         บ"
@ 10,19 SAY "ฬอออออออออออออฮอออออออออน"
@ 11,19 SAY "บ ACQUISTATO  บ         บ"
@ 12,19 SAY "ฬอออออออออออออฮอออออออออน"
@ 13,19 SAY "ฬอออออออออออออฮอออออออออน"
@ 14,19 SAY "บ     TOTALE  บ         บ"
@ 15,19 SAY "ฬอออออออออออออฮอออออออออฮออออออออออออออออป"
@ 16,19 SAY "บ    VENDUTO  บ         บPERC.VEND.     %บ"
@ 17,19 SAY "ฬอออออออออออออฮอออออออออฮออออออออออออออออน"
@ 18,19 SAY "บ   GIACENZA  บ         บPERC.GIAC.     %บ"
@ 19,19 SAY "ศอออออออออออออสอออออออออสออออออออออออออออผ"
@ 9,35 SAY LTRIM(STR(VINV))
@ 11,35 SAY LTRIM(STR(VPRC))
@ 14,35 SAY LTRIM(STR(VTOT))
@ 16,35 SAY LTRIM(STR(VPRS))
*@ 16,54 SAY LTRIM(STR(V7))
@ 18,35 SAY LTRIM(STR(VGIA))
*@ 18,54 SAY LTRIM(STR(V8))
*** FINE MAS ***
CLOSE ALL
WAIT



