*  FILE NAME: OPMAGA.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
CLEA 
SET TALK OFF 
USE ARKIVIO 
@  1,0  SAY DATE()
@  1,30 SAY "OPERAZIONI SU MAGAZZINO"
@  1,72 SAY "OPMAGA"
@  2,30 SAY "-----------------------"
STOR 0 TO CHOICE
@  5,10 SAY "1 - VALORIZZAZIONE ANNO IN CORSO COSTO MEDIO"
@  6,10 SAY "2 -                                    ULTIMO"       
@  8,10 SAY "3 - VALORIZZAZIONE ANNO PRECEDENTE     MEDIO"
@  9,10 SAY "4 -                                    ULTIMO"
@ 13,10 SAY "0 - RITORNO A MENU"
@ 20,10 SAY "Scegli l'operazione desiderata " GET CHOICE PICT "9"
READ 
IF CHOICE = 0
   RETU 
ENDI 
SET TALK ON 
IF CHOICE <3 
   USE ARKIVIO
ELSE 
   USE ARKIVOLD     
ENDI 
GO TOP 
IF CHOICE = 2 .OR. CHOICE = 4 
   * YN = "Y"
   * IF .NOT. RLOCK()
      * DO RECLOCK WITH YN
   * ENDIF
   * IF RLOCK() .AND. UPPER(YN) = 'Y'
      REPL COST_CONT WITH COSTO * GIADIN WHIL .NOT. EOF()
   * ENDIF
   * UNLOCK
   * RELEASE YN
ELSE 
   * YN = "Y"
   * IF .NOT. RLOCK()
      * DO RECLOCK WITH YN
   * ENDIF
   * IF RLOCK() .AND. UPPER(YN) = 'Y'
      REPL COST_CONT WITH COST_MED * GIADIN WHIL .NOT.EOF()
   * ENDIF
   * UNLOCK
   * RELEASE YN
ENDI 
TOTALE = 0                                                 
FINE = " "
GO TOP 
* YN = "Y"
* IF .NOT. FLOCK()
   * DO FILELOCK WITH YN
* ENDIF
* IF FLOCK() .AND. UPPER(YN) = 'Y'
   SUM COST_CONT TO TOTALE
* ENDIF
* RELEASE YN
CLEA 
@ 10,1 SAY "VALORE TOTALE = LIRE"
@ 10,22 SAY TOTALE PICT "9999999999"
@ 12,20 SAY "PREMI RETURN PER FINIRE " GET FINE
READ 
RETU 
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
