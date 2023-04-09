use bilancio
appe from D:\FOX\MAGA\ARKIVIO
replace all valinvent with costo * giacont
replace all valgiac with costo* giadin
replace all valvend with costo * progsca
replace all valtot with valinvent + carvalor
USE BILANCI1
APPE FROM BILANCIO
USE BILANCIO
ZAP
USE BILANCI1
SORT ON CAT TO BILANCI2
ZAP
USE BILANCI2
TOTAL ON CAT TO BILFIN FIEL CARVALOR,VALINVENT,VALGIAC,VALTOT,VALVEND
USE
USE BILFIN
ERASE BILANCI2.DBF
SORT ON VALVEND TO BILDEF
USE BILDEF
ERASE BILFIN.DBF
REPORT FORM BILANCIO

