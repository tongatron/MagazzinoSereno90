*  FILE NAME: CNTORD.PRG
*  BY: MASSIMO BINDI
*** CNTORD ***
set safe oN 
DIT ='   '
@ 0,0 clea 
@ 1,0 say "�"+repl("�",78)+"�"
@ 2,0 say "� SERENO S.A.S.        DATA"
@ 2,58 say "CONTROLLO  ORDINE    �"
@ 3,0 say "�"+repl("�",78)+"�"
@ 4,74 say "CNTORD"
@ 2,28 say date()
use VORDSOR
brow WIDT 12 fiel SCMIN,COD_PD,DESCRIZ ,COSTO,;
GIACONT,PROGCAR,PROGSCA,GIADIN,ORDINE FREE ORDINE
*GIACONT,PROGCAR,PROGSCA,GIADIN,ORDINE
set safe on 
set help on 
clea 
use 
clos all 
