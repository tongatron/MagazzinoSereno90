*  FILE NAME: UPDATFOR.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* UPDATFOR
SET TALK OFF 
CLEA 
USE ANAGRAF INDE CODISTR            
STOR " " TO OK
STOR "S" TO ANC
DO WHIL ANC="S"
   CLEA 
   STOR "   " TO CODIC
   @ 1,1  SAY DATE()
   @ 1,28 SAY "CORREZIONE PROD/DISTR" 
   @ 1,71 SAY "UPDATFOR"
   @ 2,28 SAY "====================="
   @ 7,5  SAY "CODICE " GET CODIC PICT "XXX"
   READ 
   GO TOP 
   SEEK CODIC
   IF EOF()
      @ 9,5  SAY "FORNITORE/PRODUTTORE INESISTENTE ! IMMISS " GET OK
      READ 
      IF OK =" "
         RETU 
      ENDI 
   ELSE 
      @  9,1  CLEA 
      @  9,1  SAY "NOMINATIVO  : "        GET NOME
      @ 13,1  SAY "STATO       : "        GET STATO
      @ 21,1  SAY "CONTINUI <S><N>? "     GET ANC
      @ 19,1  SAY "---------------------------------------------------"
      READ 
   ENDI 
ENDD 
flush
CLEA 
RETU 
