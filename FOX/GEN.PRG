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
@ 8,19 SAY  "浜様様様様様様僕様様様様�"
@ 9,19 SAY  "� INVENTARIO  �         �"
@ 10,19 SAY "麺様様様様様様陵様様様様�"
@ 11,19 SAY "� ACQUISTATO  �         �"
@ 12,19 SAY "麺様様様様様様陵様様様様�"
@ 13,19 SAY "麺様様様様様様陵様様様様�"
@ 14,19 SAY "�     TOTALE  �         �"
@ 15,19 SAY "麺様様様様様様陵様様様様陵様様様様様様様融"
@ 16,19 SAY "�    VENDUTO  �         �PERC.VEND.     %�"
@ 17,19 SAY "麺様様様様様様陵様様様様陵様様様様様様様郵"
@ 18,19 SAY "�   GIACENZA  �         �PERC.GIAC.     %�"
@ 19,19 SAY "藩様様様様様様瞥様様様様瞥様様様様様様様夕"
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