*  FILE NAME: BRWOLD.PRG
*  BY: MASSIMO BINDI
*  DATE: 07/05/94
*  DESC:
*  CALLED BY:
*  DATA FILES:
*** BROWDI ***
*set safe off 
*DIT ='   '
*@ 0,0 clea 
*@ 1,0 say "É"+repl("Í",78)+"»"
*@ 2,0 say "º SERENO S.A.S.        DATA"
*@ 2,58 say "VISUALIZZA PER DITTA º"
*@ 3,0 say "È"+repl("Í",78)+"¼"*
*@ 4,74 say "BROWDI"
*@ 2,28 say date()
*@ 10,24 say "NOME DITTA"
*@ 10,35 get DIT
*read 
*if DIT="   "
*    retu 
*endi 

use 
use ARKIVOLD INDE NDXOLD
GO TOP
set talk off 
set help off 
SET SCORE OFF
SET STATUS OFF
SET MENU OFF
clea 
CHIAVE='   '
*** RICERCA ***
@ 0,0 clea 
@ 1,0 say "É"+repl("Í",78)+"»"
@ 2,0 say "º SERENO S.A.S.        DATA"
@ 2,51 say "VISUALIZZAZIONE PER DITTA  º"
@ 3,0 say "È"+repl("Í",78)+"¼"
@ 2,28 say date()
@ 10,20 say "INSERISCI LA DITTA " get CHIAVE
read 
if CHIAVE="   "
    retu 
endi 
FIND &CHIAVE
brow WIDT 16 fiel CODICE,COD_PD,DESCRIZ ,COSTO,;
GIACONT,PROGCAR,PROGSCA,GIADIN,PREZZO_1,DST NOMO LOCK 5 NOME
set help on 
clea 
use 
clos all 
*Use RICERCA
*appe from ARKIVOLD for PRD=DIT
*sort on COD_PD to RICSOR
*zap 
*use RICSOR
*brow WIDT 16 fiel CODICE,COD_PD,DESCRIZ ,COSTO,;
*GIACONT,PROGCAR,PROGSCA,GIADIN NOMO 
*zap 
*set safe on 
*set help on 
*clea 
*use 
*clos all 
