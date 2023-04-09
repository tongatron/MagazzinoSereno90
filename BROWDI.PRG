*  FILE NAME: BROWDI.PRG
*  BY: MASSIMO BINDI
*  DATE: February 3, 1992
*  DESC:
*  CALLED BY:
*  DATA FILES:
*** BROWDI ***
set safe off 
DIT ='   '
@ 0,0 clea 
@ 1,0 say "É"+repl("Í",78)+"»"
@ 2,0 say "º SERENO S.A.S.        DATA"
@ 2,58 say "VISUALIZZA PER DITTA º"
@ 3,0 say "È"+repl("Í",78)+"¼"
@ 4,74 say "BROWDI"
@ 2,28 say date()
@ 10,24 say "NOME DITTA"
@ 10,35 get DIT
read 
if DIT="   "
    retu 
endi 
use RICERCA
appe from ARKIVIO for PRD=DIT
sort on COD_PD to RICSOR
zap 
use RICSOR
brow WIDT 16 fiel CODICE,COD_PD,DESCRIZ ,COSTO,;
GIACONT,PROGCAR,PROGSCA,GIADIN NOMO 
zap 
set safe on 
set help on 
clea 
use 
clos all 
