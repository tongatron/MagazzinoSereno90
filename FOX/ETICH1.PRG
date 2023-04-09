*  FILE NAME: ETICH1.PRG
*  BY: MASSIMO BINDI
*  DATE: April 6, 1990
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
   @ 12, 22  SAY "4)  STAMPA RIEPILOGATIVA FATTURA"
   @ 14, 22  SAY "5)  STAMPA CODICI A BARRE"
   @ 16, 22  say "0)  USCITA"
   @ 18, 15  say "SCELTA"
   @ 18, 22  get SCE
   @  2, 32  to 4, 44  
   read 
   do case 
   case SCE="0" 
      retu 
   case SCE="1"
      do ETICH
   case SCE="2"
      use ETICH
      brow 
   case SCE="3"
      do STAMP2
   CASE SCE='4'
    USE ETICH
    REPORT FORM ETICH TO PRINT 
  CASE SCE='5'
	DO BARP2     
  case sce='6'
	do barp
endc 
endd 
*Formatted by: dANALYST Ver. 5.7, on April 6, 1990.
