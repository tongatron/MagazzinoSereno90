USE PALCAT
SET SAFE OFF
SET TALK ON
SET CENT OFF
set dohistory on
ZAP
APPE FROM ARKIVIO FOR CATALOGO='N'
SORT ON CODISTR TO PALCATX
USE PALCAT
ZAP
APPE FROM PALM02X
COPY TO PALCAT
USE PALCAT
DELE FOR GIACONT=0 .AND. PROGCAR=0 .AND. PROGSCA=0 .AND. ULTVEN �
<CTOD('30/12/03')
DELE FOR DESCRIZ='  '
DELE FOR CODICE= '   '
PACK
DELE FILE PALCATX.DBF
SET SAFE ON
SET CENT ON
QUIT



