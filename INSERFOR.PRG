*  FILE NAME: INSERFOR.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* INSERFOR
USE ANAGRAF INDE CODISTR
SET TALK OFF 
STOR "S" TO ANC
DO WHIL ANC = "S"
   CLEA 
   STOR "S" TO OK
   STOR "   " TO C1
   STOR "                                        " TO C2
   STOR "     " TO C5
   @  1,1  SAY DATE()
   @  1,30 SAY "INSERIMENTO PROD/DISTR"
   @  1,72 SAY "INSERFOR"
   @  2,30 SAY "======================"
   @  6,5  SAY "CODICE        " GET C1 PICT "XXX"
   @  8,5  SAY "DENOMINAZIONE " GET C2 
   @ 14,52 SAY "STATO " GET C5
   @ 16,5  SAY "-------------------------------------------------"
   @ 20,5  SAY "TUTTO ESATTO <S><N>? " GET OK
   @ 22,5  SAY "PROSEGUI     <S><N>? " GET ANC
   READ 
   IF OK = "S"
         APPE BLAN 
         REPL CODICE WITH C1,NOME WITH C2,STATO WITH C5
   ENDI 
ENDD 
flush
CLEA 
RETU 
