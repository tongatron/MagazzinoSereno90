*  FILE NAME: SANDRO.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
CLEA 
SET TALK OFF 
USE ARKIVIO INDE PRODO
A=65
DO WHIL A < 91
   A=A+1
   B=CHR(A)
   SEEK B
   IF .NOT.FOUN()
   LOOP
   ENDI 
   SKIP -1
   ? CODICE
ENDD 
GO BOTTOM
? CODICE
USE 
WAIT 
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
