set defa to C:\fox\maga
set path to C:\fox
use C:\fox\bilancio
appe from C:\FOX\MAGA\arkivIO
replace all valinvent with costo * giacont
replace all valgiac with costo* giadin for giadin>0
replace all valvend with costo * progsca
REPLACE ALL VALTOT WITH VALINVENT+CARVALOR
USE C:\fox\BILANC1
APPE FROM BILANCIO
USE C:\fox\BILANCIO
set safe off
ZAP
USE C:\fox\BILANC1
SORT ON PRD TO BILANC2
ZAP
USE BILANC2
TOTAL ON PRD TO BILFIN FIEL CARVALOR,VALINVENT,VALGIAC,VALTOT,VALVEND
USE
USE BILFIN
ERASE BILANC2.DBF
SORT ON VALVEND TO BILDEF
USE BILDEF
ERASE BILFIN.DBF
set safe on
set filte to valvend>50000
repo form bilancio  TO PRINT
brow  fiel  prd,valinvent,carvalor,valtot,valvend,valgiac
