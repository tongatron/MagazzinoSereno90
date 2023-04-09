*  FILE NAME: ORDINE.PRG
*  BY: MASSIMO BINDI
*  DESC:
*  CALLED BY:
*  DATA FILES:
*** ORDINE ***
set safe OFF
DIT ='   '
@ 0,0 clea 
@ 1,0 say "É"+repl("Í",78)+"»"
@ 2,0 say "º SERENO S.A.S.        DATA"
@ 2,58 say "FORMAZIONE ORDINE    º"
@ 3,0 say "È"+repl("Í",78)+"¼"
@ 4,74 say "ORDINE"
@ 2,28 say date()
use VORDINE
ZAP
appe from ARKIVIO FOR SCMIN>0
sort on SCMIN  to VORDSOR
zap 
use VORDSOR
brow WIDT 12 fiel SCMIN,COD_PD,DESCRIZ ,COSTO,;
GIACONT,PROGCAR,PROGSCA,GIADIN,ORDINE,PRD,CODICE,SCMIN FREE ORDINE
set safe on 
set help on 
SET SAFE ON
clea 
use 
clos all 
