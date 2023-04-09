*  FILE NAME: MENORD.PRG
*  BY: MASSIMO BINDI
*** MENORD ***
stor 'N' to FINE
do whil FINE='N'
    stor '0' to SCELTA
    @ 0,0 clea 
    @ 1,0 say "É"+repl("Í",78)+"»"
    @ 2,0 say "º SERENO S.A.S.        DATA"
    @ 2,58 say "MENU' GESTIONE ORDINIº"
    @ 3,0 say "È"+repl("Í",78)+"¼"
    @ 10,27 Say "1   FORMAZIONE "
    @ 12,27 say "2   CONTROLLO "
    @ 14,27 say "3   VALORIZZAZIONE "
    @ 16,27 say "4   STAMPA E ESPORTAZIONE"
    @ 18,27 SAY "5   INTEGRARE"
    @ 21,29 say "SCELTA"
    @ 2,28 say date()
    @ 21,37 get SCELTA
    read 
    do case 
    case SCELTA='0'
        retu 
    case SCELTA='1'
        do ORDINE
    case SCELTA='2'
        do CNTORD
    case SCELTA='3'
        do VALORD
    case SCELTA='4'
        do STPORD
    CASE SCELTA='5'
        USE ORDSOR
        APPE
    USE
    endc 
endd 
