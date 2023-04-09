*  FILE NAME: CARSCE.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
CLEA 
STOR '0' TO SC
@  0,  0  SAY "================================================================================"
@  1, 25  SAY "ELENCO CARICHI SPECIFICI"
@  2,  0  SAY "================================================================================"
@  3, 72  SAY "carsce"
@  6, 20  SAY "1)  PER DITTA"
@  7, 20  SAY "2)  PER CODICE"
@  8, 20  SAY "3)  PER CANALE"
@ 11, 19  SAY "FAI UNA SCELTA"
@ 11, 34  GET SC  PICT "#"
READ 
DO CASE 
CASE SC='0'
   RETU 
CASE SC='1'
   DO CARNEW
CASE SC='2'
   DO CARNEW2
CASE SC='3'
   DO CARNEW3
ENDC 
flush
