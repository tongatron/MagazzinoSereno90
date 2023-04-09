*  FILE NAME: RICERCA.PRG
*  BY: MASSIMO BINDI
*  DATE: February 2, 1992
*  DESC:
*  CALLED BY:
*  DATA FILES:
use 
use RICERCA
set talk off 
set safe off 
set help off 
clea 
CHIAVE='     '
*** RICERCA ***
@ 0,0 clea 
@ 1,0 say "É"+repl("Í",78)+"»"
@ 2,0 say "º SERENO S.A.S.        DATA"
@ 2,51 say "RICERCA ARTICOLI CON CHIAVE º"
@ 3,0 say "È"+repl("Í",78)+"¼"
@ 2,28 say date()
@ 10,20 say "INSERISCI LA CHIAVE" get CHIAVE
read 
if CHIAVE="     "
    retu 
endi 
appe from ARKIVIO for trim(CHIAVE) $DESCRIZ
sort on CODISTR to RICSOR
zap 
use RICSOR
brow NOMO 
zap 
set safe on 
set help on 
clea 
use 
clos all 
