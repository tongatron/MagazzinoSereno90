*  FILE NAME: LISTA3.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
* LISTA3
STOR "0" TO LI
CLEA 
@  1,1  SAY DATE()
@  1,32 SAY "LISTE FORN/PROD"
@  1,73 SAY "LISTA1"
@  2,32 SAY "================"
@  6,32 SAY "0 - FINE LAVORO"
@  8,32 SAY "1 - LF1 (ELENCO GENERALE)"
@  9,32 SAY "3 - ELENCO A VIDEO"
USE ANAGRAF INDE CODISTR
@ 18,32 SAY "SCEGLI LISTA " GET LI
READ 
DO CASE 
CASE LI ="1"
   * TYPE TO PRINT CHR18
   REPO FORM LF1 NOEJ TO PRIN 
CASE LI = "2"
   * TYPE TO PRINT CHR18
   REPO FORM LF2 NOEJ TO PRIN 
CASE LI = "3"
BROW  NOMOD
* REPO FORM LF1
ENDC 
CLEA
flush 
RETU 
