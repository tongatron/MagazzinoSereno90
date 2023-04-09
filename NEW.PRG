*  FILE NAME: NEW.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* CARICA
SET TALK OFF 
CLEA 
SELE 3
USE ANAGRAF INDE CODISTR
SELE 1
USE ARKIVIO INDE ARTICOLO
STOR "S" TO ANC
STOR "02" TO TI
DAT=DATE()
DO WHIL ANC="S"
   STOR "S" TO ANC
   STOR "   " TO DI
   @ 1,1  CLEA 
   @ 1,1  SAY DATE()
   @ 1,30 SAY "CONTROLLO CARICHI"
   @ 1,73 SAY "NEW"
   @ 2,30 SAY "====================="
   STOR "S"            TO OK
   STOR "S"            TO ESA
   STOR "            " TO CODIS
   STOR "    "         TO CODIC
   STOR 0             TO QUA
   STOR 0             TO COST
   STOR .F.            TO FQT
   STOR .F.            TO FVV
   STOR "                                   " TO DESCR
   @ 6,16 SAY "999 per finire."
   @ 6,1  SAY "FORNITORE " GET DI
   READ 
   SELE 3
   SEEK DI
   @ 6,31 SAY NOME
   IF EOF()
      IF DI="999"
         STOR "N" TO ANC
      ELSE 
         @ 11,5 SAY "FORNITORE INESISTENTE ! IMMISSIONE " GET OK
         READ 
      ENDI 
   ELSE 
      @ 8,5  SAY "ARTICOLO " GET CODIS PICT "XXXXXXXXXXXX"
      READ 
      SELE 1
      STOR DI+CODIS TO COCO
      SEEK COCO
      IF EOF()
         @10,5  SAY "PRODOTTO INESISTENTE ! IMMISS " GET OK
         READ 
      ELSE 
         STOR A->CODICE TO CODIC
         STOR A->PREZZO_1 TO PREZZV
         @ 8,30 SAY CODICE
         @ 8,42 SAY DESCRIZ
         @10,1  SAY "PRODOTTO ESATTO? <S><N> " GET OK
         READ 
         DO CASE 
         CASE OK = "S"
            @ 10,1  CLEA 
         CASE OK = "N" 
	    @ 7,1 CLEA 
            @ 22,5 SAY "ALTRI CONTROLLI <S><N>? " GET ANC
            READ 
         ENDC 
      ENDI 
   ENDI 
ENDD 
CLEA 
RETU 
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
