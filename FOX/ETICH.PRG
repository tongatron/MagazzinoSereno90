*  FILE NAME: ETICH.PRG
*  BY: MASSIMO BINDI
*  DATE: April 6, 1990
*  DESC:
*  CALLED BY:
*  DATA FILES:
set talk off 
sele 1
use Etich
sele 2
use Arkivio inde Prodo alia Ark
do whil .T.
   clea 
   sele 1
   xcodice= spac(4)
   XQUANT=0
   XPREZ=0
   @  1, 26  say "CREAZIONE   ETICHETTE"
   @  0, 23  to 2, 49
   @  4,  3  say "CODICE"
   @  4, 10  get XCODICE  pict "!999"
   read 
   if XCODICE =spac(4)
      exit 
   endi 
   sele 2
   seek XCODICE
   if foun()
STORE ARK->PREZZO_1 TO XPREZ
      sele 1
      appe blan 
      repl CODICE with XCODICE,CODISTR with ARK->CODISTR
   endi 
   @  6,  3  say "ARTIC."
   @  6, 10  say CODISTR
   @  8,  4  say ARK->DESCRIZ
   @  8, 30 SAY ARK->GIADIN
   @ 10, 26 SAY  "ULTCAR"
   @ 10, 34 SAY ARK->ULTCAR 
   @ 10, 56 say ARK->COSTO
  @ 10, 68 SAY ARK->DST
   @ 10,  4  say "PEZZI"
   @ 10, 10  get XQUANT pict "99"
   @ 12,  3  say "PREZZO"
  *@ 12, 10  get XPREZ  pict "99999.99"
   @ 12, 10 GET XPREZ PICT "99999.99"
   read 
   repl ETICH->PREZZO_1 with XPREZ,ETICH->QUANTITA with XQUANT
   repl ARK->PREZZO_1 with XPREZ
   repl etich->descriz with ark->descriz	
endd 
CLOSE ALL
retu 
*Formatted by: dANALYST Ver. 5.7, on April 6, 1990.
