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
@ 1,0 say "�"+repl("�",78)+"�"
@ 2,0 say "� SERENO S.A.S.        DATA"
@ 2,51 say "RICERCA ARTICOLI CON CHIAVE �"
@ 3,0 say "�"+repl("�",78)+"�"
@ 2,28 say date()
@ 10,20 say "INSERISCI LA CHIAVE" get CHIAVE
read 
if CHIAVE="     "
    retu 
endi 
appe from inv06ld for trim(CHIAVE) $DESCRIZ
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