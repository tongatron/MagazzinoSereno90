*  FILE NAME: CNTORD.PRG
*  BY: MASSIMO BINDI
*** CNTORD ***
set safe oN 
DIT ='   '
@ 0,0 clea 
@ 1,0 say "É"+repl("Í",78)+"»"
@ 2,0 say "º SERENO S.A.S.        DATA"
@ 2,58 say "CONTROLLO  ORDINE    º"
@ 3,0 say "È"+repl("Í",78)+"¼"
@ 4,74 say "CNTORD"
@ 2,28 say date()
use ORDSOR
brow WIDT 16 fiel COD_PD,DESCRIZ ,COSTO,;
GIACONT,PROGCAR,PROGSCA,GIADIN,ORDINE FREE ORDINE
*GIACONT,PROGCAR,PROGSCA,GIADIN,ORDINE
set safe on 
set help on 
clea 
use 
clos all 
