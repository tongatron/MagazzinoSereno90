*  FILE NAME: PRELISTA.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DATA FILES:
*** PRELISTA ***
STOR '0' TO SCE
@ 0,0 CLEA 
@ 2,0 SAY REPL("=",80)
@ 3,70 SAY "prelista"
@ 8,19 SAY "�"+REPL("�",37)+"�"
@ 9,19 SAY "�"
@ 9,57 SAY "�"
@ 10,19 SAY "�   1)   LISTE SELETTIVE              �"
@ 11,19 SAY "�"
@ 11,57 SAY "�"  
@ 12,19 SAY "�"    
@ 12,57 SAY "�"
@ 13,19 SAY "�   2)   ELENCO GENERALE PER DITTA    �"
@ 14,19 SAY "�   3)   ELENCO PER DITTA E CATEG.   "  
@ 14,57 SAY "�"
@ 15,19 SAY "�"+REPL("�",37)+"�"
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