*  FILE NAME: AGESIST.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* AGESIST
STOR .T. TO FQT
CLEA 
SELE 3
USE ARKIVOLD INDE PRODOLD
SELE 1
USE CARICHI INDE PROCAR
SELE 2
USE ARKIVIO INDE PRODO
SELE 1
CLEA 
@  1,1  SAY DATE()
@  1,30 SAY "AGGIORNAMENTO ESISTENZA"
@  1,72 SAY "AGESIST"
@  2,30 SAY "======================="
DO WHIL .NOT. EOF()
   IF FQ 
      SKIP 
   ELSE 
      DO CASE 
      CASE YEAR(DATC) = YEAR(DATE())
         SELE 2
      CASE YEAR(DATC) # YEAR(DATE())
         SELE 3
      ENDC 
      SEEK A->CODICE
      IF .NOT. EOF()
         IF A->T # "01"
               REPL ULTCAR WITH A->DATC,GIADIN WITH GIADIN + A->QUANT;
               PROGCAR WITH PROGCAR+A->QUANT,COD_PD WITH A->ARTI
         ENDI 
         IF A->T = "03"
               REPL ORDINE WITH ORDINE-A->QUANT
         ENDI 
         IF A->T = "01"
               REPL GIACONT WITH GIACONT+A->QUANT
         ENDI 
         IF A->CANALE # "  "
               REPL DST WITH A->CANALE
         ENDI 
         IF YEAR(A->DATC) # YEAR(DATE())
            SELE 2
            SEEK A->CODICE
               REPL GIACONT WITH GIACONT+A->QUANT;
               GIADIN WITH GIADIN + A->QUANT,COD_PD WITH A->ARTI
            IF YEAR(A->DATC) >=YEAR(ULTCAR)
                  REPL ULTCAR WITH A->DATC
            ENDI 
         ENDI 
         SELE 1
            REPL FQ WITH FQT
      ELSE 
         SELE 1
      ENDI 
   ENDI 
ENDD 
CLOS DATA 
CLEA
flush 
DO AGVALOR
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
