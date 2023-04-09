*  FILE NAME: VALORD.PRG
*  BY: MASSIMO BINDI
*** VALORD ***
SET TALK OFF
set safe oN 
DIT ='   '
@ 0,0 clea 
@ 1,0 say "É"+repl("Í",78)+"»"
@ 2,0 say "º SERENO S.A.S.        DATA"
@ 2,58 say "VALORIZZAZIONE ORD.  º"
@ 3,0 say "È"+repl("Í",78)+"¼"
@ 4,74 say "VALORD"
@ 2,28 say date()
use ORDSOR
*brow WIDT 16 fiel COD_PD,DESCRIZ ,COSTO,;
*GIACONT,PROGCAR,PROGSCA,GIADIN,ORDINE FREE ORDINE
SUM COSTO*ORDINE TO TORD
@ 15,24 SAY "IL TOTALE DELL'ORDINE E' DI L. "GET TORD
WAIT
set safe on 
set help on 
clea 
use 
clos all 
