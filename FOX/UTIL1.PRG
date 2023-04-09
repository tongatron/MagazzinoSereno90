* FILE NAME: UTIL1.PRG
*  BY: MASSIMO BINDI
*  DATE: February 2, 1992
*  DESC:
*  CALLED BY:
*  DATA FILES:
*** UTIL1 ***
stor 'N' to FINE
do whil FINE='N'
    stor '0' to SCELTA
    @ 0,0 clea 
    @ 1,0 say "É"+repl("Í",78)+"»"
    @ 2,0 say "º SERENO S.A.S.        DATA"
    @ 2,58 say "MENU' UTILITA' VARIE º"
    @ 3,0 say "È"+repl("Í",78)+"¼"
    @ 8,20 say "1   RICERCA ARTICOLI CON CHIAVE"
    @ 10,20 say "2   VISUALIZZAZIONE ARTICOLI PER DITTA"
    @ 12,20 say "3   CONTROLLO DEL VENDUTO"
    @ 14,20 say "4   CONTROLLO DEL VENDUTO CON GIACENZA"
    @ 16,20 SAY "5   VISUALIZZ.ART. PER DITTA SU ARKIVOLD"
    @ 18,20 SAY "6   BROWSE PER DITTA"
    @ 20,20 SAY "7   RICERCA PER DESCRIZIONE"
    @ 22,29 say "SCELTA"
    @ 2,28 say date()
    @ 22,37 get SCELTA
    read 
    do case 
    case SCELTA='0'
        retu 
    case SCELTA='1'
        do RICERCA
    case SCELTA='2'
        do BROWDI
        *   case SCELTA='3'
        *      do BROWVE
    case SCELTA='4'
        do BROWGI
    CASE SCELTA='5'
        DO BRWOLD
    CASE SCELTA='6'
        DO RICBRW
    CASE SCELTA="7"
        DO RICDSC
    endc 
endd 
