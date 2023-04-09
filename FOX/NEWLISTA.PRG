STORE "0" TO PIP
CLEA
@ 2,0 SAY REPL("=",80)
@ 3,70 SAY "prelista"
@ 8,19 SAY "Ú"+REPL("Ä",37)+"¿"
@ 9,19 SAY "³"
@ 9,57 SAY "³"
@ 10,19 SAY "³   1)   STAMPA PER DITTA E CATEG.    ³"
@ 11,19 SAY "³"
@ 11,57 SAY "³"
@ 12,19 SAY "³"
@ 12,57 SAY "³"
@ 13,19 SAY "³   0)   USCITA                       ³"
@ 14,19 SAY "³"
@ 14,57 SAY "³"
@ 15,19 SAY "À"+REPL("Ä",37)+"Ù"
@ 19,23 SAY "SCELTA" GET PIP
*@ 19,30 GET PIP
READ 
DO CASE 
CASE PIP='0'
   RETURN
CASE PIP='1'
   STOR "AAA" TO DIT
    STOR "AAA" TO VCA
CLEAR
   @ 10,25 SAY "INTRODUCI LA DITTA    "
   @ 10,48 GET DIT
   @ 12,25 SAY "INTRODUCI LA CATEGORIA"
   @ 12,48 GET VCA
   READ 
    IF DIT="AAA"
    RETURN
    ENDIF
    RUN COND
   USE ARKIVIO INDE ARTICOLO
   REPO FORM GENERALE FOR PRD=DIT .AND. CAT=VCA TO PRIN 
EJEC
ENDC 
RELE ALL
flush
