*  FILE NAME: BROWGI.PRG
*  BY: MASSIMO BINDI
*  DATE: February 2, 1992
*  DESC:
*  CALLED BY:
*  DATA FILES:
set DATE ITAL
set safe off 
set talk off 
use SCTOT
zap 
appe from SCARICHI FOR CAT='MOD'
sort on CODICE to SCTOT1
use SCTOT1
tota on CODICE to SCTOT2 fiel QUANT
use SCTOT2
eras SCTOT1.DBF
sort on PRODUT to SCTOT3
use SCTOT3
eras SCTOT2.DBF
inde on CODICE to SCTCOD
sele 1
use ARKIVIO inde PRODO
sele 2
use SCTOT3 inde SCTCOD
set rela to CODICE into ARKIVIO
repl all GIADIN with ARKIVIO->GIADIN
use SCTOT3
sort on PRODUT,ARTICOLO to SCTOT4
use SCTOT4
eras SCTOT3.DBF
REPO FORM 
*brow fiel CODICE,PRODUT,ARTICOLO,DESCRIZ,QUANT,GIADIN WIDTH(20) NOMO
zap 
use 
set safe on 
clos all 
