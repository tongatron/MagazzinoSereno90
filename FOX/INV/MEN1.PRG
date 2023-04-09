* MENU1.CMD
set stat off
set scor off
CLEAR
@  1, 0 SAY "--------------------------------------------------------------------------------"
@  5, 9 SAY "DITTA SERENO   VALORI INVENTARIO"
@  8,14 SAY "1 = VALORI GRUPPO 1"
@ 10,14 SAY "2 = VALORI GRUPPO 2"
@ 12,14 SAY "3 = VALORI GRUPPO 3"
@ 14,14 SAY "4 = VALORI GENERALI"
@ 16,14 SAY "5 = FINE LAVORO    "
@ 18, 0 SAY "--------------------------------------------------------------------------------"
@ 19, 0 SAY "FAI UNA SCELTA"
wait TO RISPOSTA
DO CASE
	CASE RISPOSTA='1'
		DO VISUAL1
	CASE RISPOSTA='2'
		DO VISUAL2
	CASE RISPOSTA='3'
		DO VISUAL3
	CASE RISPOSTA='4'
		DO TOTALI
	CASE RISPOSTA='5'
		QUIT
ENDCASE
RETURN
