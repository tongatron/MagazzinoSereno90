USE ARKIVIO
COPY STRU TO CATALOGO
USE CATALOGO 
APPE FROM ARKIVIO FOR CATALOGO ='N'
CLOSE ALL
USE CATALOGO
SORT ON CODISTR TO SCATC
USE SCATC
brow WIDT 14 fiel CODICE,COD_PD,DESCRIZ ,PREZZO_1,;
GIACONT,PROGCAR,PROGSCA,GIADIN,COSTO,DST,SCMIN,ULTCAR NOMO LOCK 5 NOME
CLOSE ALL
DELE FILE CATALOGO.DBF
DELE FILE SCATC.DBF
RETU
