*  FILE NAME: AGVALOR.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* AGVALOR
STOR .T. TO FQT
CLEA 
SELE 3
USE ARKIVOLD INDE PRODOLD
SELE 1
USE CARICHI INDE PROCAR  
SELE 2
USE ARKIVIO INDE PRODO
SELE 1
DO WHILE .NOT. EOF()
   IF FV 
      SKIP 
   ELSE 
      IF COSTO=0
         SKIP 
      ELSE 
         IF YEAR(DATC) # YEAR(DATE())
            SELE 3
         ELSE 
            SELE 2
         ENDI 
         SEEK A->CODICE
         IF .NOT. EOF()
               REPL COSTO WITH A->COSTO;
               CARVALOR WITH CARVALOR + A->COSTO * A->QUANT,COST_MED;
               WITH CARVALOR/PROGCAR
            IF A->CANALE <> "  "
                  REPL DST WITH A->CANALE
            ENDI 
            SELE 1
               REPL FV WITH FQT
         ELSE 
            SELE 1
            SKIP 
         ENDI 
      ENDI 
   ENDI 
ENDD 
CLOS DATA 
USE PROGCAR INDE CODPRO
   APPE FROM CARICHI FOR FV
CLOS DATA 
USE CARICHI INDE PROCAR
   DELE FOR FV
   PACK 
CLEA
flush 
RETU 
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
