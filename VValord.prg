*  FILE NAME: VALORD.PRG
*  BY: MASSIMO BINDI
*** VALORD ***
SET TALK OFF
set safe oN 
DIT ='   '
@ 0,0 clea 
@ 1,0 say "�"+repl("�",78)+"�"
@ 2,0 say "� SERENO S.A.S.        DATA"
@ 2,58 say "VALORIZZAZIONE ORD.  �"
@ 3,0 say "�"+repl("�",78)+"�"
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