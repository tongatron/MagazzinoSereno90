use 
use ARKIVIO INDE ARTICOLO
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
@ 1,0 say "�"+repl("�",78)+"�"
@ 2,0 say "� SERENO S.A.S.        DATA"
@ 2,51 say "VISUALIZZAZIONE PER DITTA  �"
@ 3,0 say "�"+repl("�",78)+"�"
@ 2,28 say date()
@ 10,20 say "INSERISCI LA DITTA " get CHIAVE
read 
if CHIAVE="   "
    retu 
endi 
FIND &CHIAVE
brow WIDT 14 fiel CODICE,COD_PD,DESCRIZ ,PREZZO_1,;
GIACONT,PROGCAR,PROGSCA,GIADIN,COSTO,DST,SCMIN,ULTCAR,CATALOGO NOMO LOCK 5 NOME
set help on 
clea 
use 
clos all 
