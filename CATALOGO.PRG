*  FILE NAME: LISTA1.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:

* LISTA1
SET TALK OFF 
set stat off
set score off
STOR "0" TO LI
STORE 'N' TO FINE
DO WHILE FINE ='N'
CLEA 
STORE '0' TO LI
@  1,1  SAY DATE()
@  1,32 SAY "GESTIONE ARTICOLI A CATALOGO"
@  1,73 SAY "CATALOGO"
@  2,32 SAY "==============="
@  6,32 SAY "0 - FINE LAVORO"
@  8,32 SAY "1 - INTRODUZIONE MARCATORE"
@ 10,32 SAY "2 - VISUALIZZA ARTICOLI"
@ 12,32 SAY "3 - DA DEFINIRE"
@ 14,32 SAY "4 - DA DEFINIRE"
@ 16,32 SAY "5 - DA DEFINIRE"
USE ARKIVIO INDE PRODO
@ 20,32 SAY "SCEGLI LISTA " GET LI
READ 
     
         DO CASE 
         CASE LI ="1"
            DO CARCATA
        CASE LI ="2"
            DO BRWCAT
        CASE LI ='0'
 *          QUIT
        RETU
         ENDC 
     flush
ENDDO
CLEA 
RETU 
