*  FILE NAME: A:MENUCOR.PRG
*  BY: MAX BINDI
*  DATE: January 22, 1990
*  DESC:
*  CALLED BY:
*  DATA FILES:
set talk on 
stor "N" to FINE
do whil FINE = "N"
   clos data 
   clea 
   stor "0" to SCE
   *** MENUCOR ***
   @ 0,0 clea 
   @ 2,22 say "É"+repl("Í",31)+"»"
   @ 3,22 say "ºCORREZZIONE GIACENZA SU ARCHIVIº"
   @ 4,22 say "È"+repl("Í",31)+"¼"
   @ 7,13 say "1)  INTRODUZIONE CORREZZIONI"
   @ 9,13 say "2)     REVISIONE CORREZZIONI"
   @ 11,13 say "3)        STAMPA CORREZZIONI"
   @ 13,13 say "4)  AGGIORNAMETO ARKIVI (SIA OLD CHE NEW)"
   @ 15,13 say "5)  STAMPA DATI SU AGGIORNAMENTO"
   @ 17,13 say "6)  INIZIA UN NUOVO ARKIVIO"
   @ 19,13 say "0)  FINE LAVORO"
   @ 22,27 say "SCELTA"
   @ 22,34 get SCE
   *** FINE MENUCOR ***
   read 
   do case 
   case SCE = "0"
      clea 
      retu 
   case SCE = "1"
      do CORREZZ
   case SCE = "2"
      use CORREZZ
      set dele off 
      brow 
      set dele on 
      use 
   case SCE = "3"
      set dele off 
      use CORREZZ
      list off to prin 
      set dele on 
      use 
   case SCE = "4"
      set dele on 
      do NAGCOR
   case SCE = "5"
      TYPE VARIAZ.TXT TO PRINT
   case SCE = "6"
      use CORREZZ
      pack 
      use 
   endc 
endd 
*Formatted by: dANALYST Ver. 5.7, on January 22, 1990.
