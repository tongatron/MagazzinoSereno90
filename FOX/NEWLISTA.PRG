STORE "0" TO PIP
CLEA
@ 2,0 SAY REPL("=",80)
@ 3,70 SAY "prelista"
@ 8,19 SAY "�"+REPL("�",37)+"�"
@ 9,19 SAY "�"
@ 9,57 SAY "�"
@ 10,19 SAY "�   1)   STAMPA PER DITTA E CATEG.    �"
@ 11,19 SAY "�"
@ 11,57 SAY "�"
@ 12,19 SAY "�"
@ 12,57 SAY "�"
@ 13,19 SAY "�   0)   USCITA                       �"
@ 14,19 SAY "�"
@ 14,57 SAY "�"
@ 15,19 SAY "�"+REPL("�",37)+"�"
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