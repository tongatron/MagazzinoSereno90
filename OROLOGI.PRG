*  FILE NAME: OROLOGI.PRG
*  BY: MASSIMO BINDI
*  DATE: SETTEMBRE 12, 1990
*  DESC:
*  CALLED BY:
*  DATA FILES:
set SCOREBOARD off 
set talk off 
stor "N" to FINE
do whil FINE="N"
   clea 
   stor "0" to SCE
   @  3, 34  say "ETICHETTE"
   @  6, 22  say "1)  CREAZIONE ETICHETTE"
   @  8, 22  say "2)  CONTROLLO (BROWSE)"
   @ 10, 22  say "3)  STAMPA"
   @ 12, 22  SAY "4)  STAMPA CON PROVA"
   @ 14, 22  SAY "0)  USCITA"
   @ 18, 15  say "SCELTA"
   @ 18, 22  get SCE
      @  2, 32  to 4, 44  
   read 
   do case 
   case SCE="0" 
 	QUIT 
   case SCE="1"
      use orologi
        zap    
        appe
   case SCE="2"
      use orologi
      brow NOMO
   case SCE="3"
      use orologi
    label form orologi to print
   CASE SCE='4'
    USE orologi
    label FORM orologi sample TO PRINT 
endc 
endd 
*Formatted by: dANALYST Ver. 5.7, on April 6, 1990.
