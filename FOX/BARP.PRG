*:*****************************************************************************
*:
*: Procedure file: C:\FOX\BARP.PRG
*:         System: Magazzino
*:         Author: Massimo Bindi
*:      Copyright (c) 16/0393, max & sandro
*:  Last modified: 12/02/93 at 13:47:02
*:
*:         Set by: ETICH1.PRG                        
*:
*:           Uses: ETICH.DBF          
*:               : ETISP.DBF          
*:
*:    Label Forms: EUROAD.LBX
*:
*:   Binary Files: DBARCODE
*:
*:      Documented 13:41:51                                FoxDoc version 3.00a
*:*****************************************************************************
*  FILE NAME: BARP.PRG
*  BY: SANDRO VINCIGUERRA & MASSIMO BINDI
*  DATE: February 11, 1993
*  DESC:
*  CALLED BY:
*  DATA FILES:
*BARP.PRG
USE etich
PACK
GO TOP
IF codice='   '
   RETU
ENDIF
DO WHIL .NOT. EOF()
   IF quantita =1
      SKIP
      LOOP
   ENDI
   STOR quantita -1 TO io
   STOR 0 TO xcont
   DO WHIL xcont < io
      STOR codice TO xcod
      STOR prezzo_1 TO xprez
      STOR codistr TO xcdis
      STOR descriz TO xdesc
      INSE BLAN
      REPL codice WITH xcod,prezzo_1 WITH xprez,codistr WITH xcdis
      REPL descriz WITH xdesc
      STOR xcont+1 TO xcont
   ENDD
   SKIP
ENDD
CLEA
STOR 'S' TO sce
@  0,  0  SAY "================================================================================"
@  1, 25  SAY "STAMPA ETICHETTE A BARRE"
@  2,  0  SAY "================================================================================"
@  3, 72  SAY "carsce"
@  7, 20  SAY "VUOI LA STAMPA DI PROVA ?"
@ 11, 19  SAY "FAI UNA SCELTA"
@ 11, 34  GET sce
READ
IF sce='S'
   USE etisp
   LABE FORM euroad SAMP TO PRIN
ENDIF
CLEA
CLOS ALL
LOAD dbarcode
*stringa per dbarcode
STOR "142331122020" TO spec
*variabile per numero passate
STOR '0' TO pas
*STOR '1' TO pas
*stringa per space
STOR CHR(25) TO spaz
*
USE etich
GO TOP
DO WHIL .NOT. EOF()
   r1='E.'+STR(prezzo_1,8)+SPAC(9)
   r2=SUBS(descriz,1,25)+SPAC(9)
   r3= codistr + ' '+ codice +SPAC(13)
   DESC =codice
   SKIP
   IF EOF()
      LOOP
   ENDI
   r1=r1+'E.'+STR(prezzo_1,8)+SPAC(9)
   r2=r2+SUBS(descriz,1,25)+SPAC(9)
   r3=r3+codistr+' '+codice+SPAC(13)
   DESC =DESC +codice
   SKIP
   IF EOF()
      LOOP
   ENDI
   r1=r1+'E.'+STR(prezzo_1,8)
   r2=r2+SUBS(descriz,1,25)
   r3=r3+codistr+' '+codice
   DESC =DESC +codice
   SKIP
   *DO PRBCODE
   SET DEVI TO PRIN
   ROW = PROW()
   @ ROW+1,2 SAY '  '+ CHR(27)+CHR(69)+r1+CHR(27)+CHR(70)
   @ ROW+2,2 SAY CHR(15)+r2
   @ ROW+3,2 SAY '  '+ r3
   @ ROW+3,1 SAY CHR(10)
   CALL dbarcode WITH spec+pas+spaz+'0\'+DESC
   SET DEVI TO SCRE
   DESC ='XxXx'
ENDD
IF DESC # 'XxXx'
   
   SET DEVI TO PRIN
   ROW = PROW()
   @ ROW+1,2 SAY '  '+ CHR(27)+CHR(69)+r1+CHR(27)+CHR(70)
   @ ROW+2,2 SAY CHR(15)+r2
   @ ROW+3,2 SAY '  '+ r3
   @ ROW+3,1 SAY CHR(10)
   CALL dbarcode WITH spec+pas+spaz+'0\'+DESC
   SET DEVI TO SCRE
ENDI
ZAP
RETU
*PROCEDURE PRBCODE
*Formatted by: dANALYST Ver. 5.7, on February 11, 1993.
*: EOF: BARP.PRG
