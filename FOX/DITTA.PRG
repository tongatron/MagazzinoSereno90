*  FILE NAME: DITTA.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
SET TALK OFF 
CLEA 
STOR "AAA" TO DTT
STOR "N" TO MER
@  1, 25  SAY "DITTA SERENO GALANTINO S.A.S."
@  3,  0  SAY "REPORT A VIDEO DEGLI ARTICOLI DELLA DITTA "
@  3, 43  GET DTT
@  6,  0  SAY "ORDINATI PER ARTICOLO ?"
@  6, 25  GET MER
READ 
IF DTT='AAA'
RETU
ENDIF
CLEA 
DO CASE 
CASE MER ="Y" .OR. MER ="S"
   USE ARKIVIO INDE ARTICOLO
   DISP OFF CODICE,PRD,COD_PD,DESCRIZ,COSTO,GIADIN FOR PRD= DTT
CASE MER="N"
   USE ARKIVIO
   DISP OFF CODICE,PRD,COD_PD,DESCRIZ,COSTO,GIADIN FOR PRD= DTT
ENDC 
WAIT 
RELE ALL 
USE 
RETU 
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
