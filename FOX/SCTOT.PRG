SET DATE ITAL
set talk oN
USE SCTOT
ZAP
APPE FROM SCARICHI
SORT ON CODICE TO SCTOT1
USE SCTOT1
TOTAL ON CODICE TO SCTOT2 FIEL QUANT
USE SCTOT2
ERASE SCTOT1.DBF
SORT ON PRODUT TO SCTOT3
USE SCTOT3
ERASE SCTOT2.DBF
INDEX ON CODICE TO SCTCOD
*CLEAR ALL
SELE 1
USE ARKIVIO INDEX PRODO
SELE 2
USE SCTOT3 INDEX SCTCOD
SET RELATION TO CODICE INTO ARKIVIO
REPLACE ALL GIADIN WITH ARKIVIO->GIADIN
*CLEAR ALL
USE SCTOT3
SORT ON PRODUT,ARTICOLO TO SCTOT4
USE SCTOT4
ERASE SCTOT3.DBF
**  REPORT NORMALE
*REPORT FORM SCTOT NOEJ TO PRINT
**  REPORT SU FOGLI LUNGHI
REPO FORM SCMOD TO PRINT
**  REPORT SU FILE
*REPO FORM SCTOT TO SCARNOV.TXT
**  REPORT PER MODELLISMO
*REPORT FORM SCTOT FOR CODICE='H' TO FILE MODEL.FIL
**  REPORT PER MODELLISMO SU FOGLI LUNGHI
*REPO FORM SCMOD FOR CODICE='H' TO PRINT
USE
SET SAFE ON
erase sctot4.dbf
USE
ERASE SCTCOD.IDX
PO=DTOC(DATE())
PO='S'+SUBSTR(PO,1,2)+SUBSTR(PO,4,2)+SUBSTR(PO,7,2)+'.DBF'
PI=DTOC(DATE())
PI='N'+SUBSTR(PI,1,2)+SUBSTR(PI,4,2)+SUBSTR(PI,7,2)+'.IDX'
RUN COPY E:\FOX\MAGA\SCARICHI.DBF E:\FOX\SCARICHI\SCARICHI.DBF
RUN COPY E:\FOX\MAGA\NDXSCARI.IDX E:\FOX\SCARICHI\NDXSCARI.IDX
RENAME E:\FOX\SCARICHI\SCARICHI.DBF TO E:\FOX\SCARICHI\&PO
RENAME E:\FOX\SCARICHI\NDXSCARI.IDX TO E:\FOX\SCARICHI\&PI
USE SCARICHI INDEX NDXSCARI
ZAP
*CLEAR ALL
RETU
