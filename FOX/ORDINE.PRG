*  FILE NAME: ORDINE.PRG
*  BY: MASSIMO BINDI
*  DESC:
*  CALLED BY:
*  DATA FILES:
*** ORDINE ***
set safe oN 
DIT ='   '
@ 0,0 clea 
@ 1,0 say "É"+repl("Í",78)+"»"
@ 2,0 say "º SERENO S.A.S.        DATA"
@ 2,58 say "FORMAZIONE ORDINE    º"
@ 3,0 say "È"+repl("Í",78)+"¼"
@ 4,74 say "ORDINE"
@ 2,28 say date()
@ 10,24 say "NOME DITTA"
@ 10,35 get DIT
read 
if DIT="   "
    retu 
endi 
use ORDINE
ZAP
appe from ARKIVIO for PRD=DIT
sort on COD_PD to ORDSOR
zap 
use ORDSOR
brow WIDT 16 fiel COD_PD,DESCRIZ ,COSTO,;
GIACONT,PROGCAR,PROGSCA,GIADIN,ORDINE FREE ORDINE
set safe on 
set help on 
clea 
use 
clos all 
