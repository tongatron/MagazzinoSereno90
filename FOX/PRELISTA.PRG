*  FILE NAME: PRELISTA.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DATA FILES:
*** PRELISTA ***
STOR '0' TO SCE
@ 0,0 CLEA 
@ 2,0 SAY REPL("=",80)
@ 3,70 SAY "prelista"
@ 8,19 SAY "Ú"+REPL("Ä",37)+"¿"
@ 9,19 SAY "³"
@ 9,57 SAY "³"
@ 10,19 SAY "³   1)   LISTE SELETTIVE              ³"
@ 11,19 SAY "³"
@ 11,57 SAY "³"  
@ 12,19 SAY "³"    
@ 12,57 SAY "³"
@ 13,19 SAY "³   2)   ELENCO GENERALE PER DITTA    ³"
@ 14,19 SAY "³   3)   ELENCO PER DITTA E CATEG.   "  
@ 14,57 SAY "³"
@ 15,19 SAY "À"+REPL("Ä",37)+"Ù"
@ 19,23 SAY "SCELTA"
@ 19,30 GET SCE
READ 
DO CASE 
CASE SCE='1'
   DO LISTA1
CASE SCE='2'
   DO E:\FOX\MAXLISTA
CASE SCE='3'
    DO NEWLISTA
ENDC 
flush
*** FINE PRELISTA ***
