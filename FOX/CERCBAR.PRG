SET TALK OFF
USE ARKIVIO INDEX ARTICOLO,BARREX
STORE '   ' TO XPRD
STORE 'S' TO ANC
DO WHILE ANC='S'
    STORE '            ' TO XCOD_PD
*** ATTRIB ***
@ 0,0 CLEAR
@ 2,23 SAY "É"+REPLICATE("Í",29)+"»"
@ 3,23 SAY "ºATTRIBUZIONE CODICI A BARRE  º"
@ 4,23 SAY "È"+REPLICATE("Í",29)+"¼"
@ 9,8 SAY "Ú"+REPLICATE("Ä",18)+"Â"+REPLICATE("Ä",43)+"¿"
@ 10,8 SAY "³PROD.             ³ ARTICOLO"
@ 10,71 SAY "³"
@ 11,8 SAY "³"
@ 11,27 SAY "³"
@ 11,71 SAY "³"
@ 12,8 SAY "Ã"+REPLICATE("Ä",18)+"Å"+REPLICATE("Ä",43)+"´"
@ 13,8 SAY "³"
@ 13,27 SAY "³"
@ 13,71 SAY "³"
@ 14,8 SAY "³                  ³            "
@ 14,71 SAY "³"
@ 15,8 SAY "³"
@ 15,27 SAY "³"
@ 15,71 SAY "³"
@ 16,8 SAY "Ã"+REPLICATE("Ä",18)+"Å"+REPLICATE("Ä",43)+"´"
@ 17,8 SAY "³"
@ 17,27 SAY "³"
@ 17,71 SAY "³"
@ 18,8 SAY "³                  ³       "
@ 18,71 SAY "³"
@ 19,8 SAY "³"
@ 19,27 SAY "³"
@ 19,71 SAY "³"
@ 20,8 SAY "À"+REPLICATE("Ä",18)+"Á"+REPLICATE("Ä",43)+"Ù"
@ 10,15 GET XPRD
@ 10,38 GET XCOD_PD
READ
STORE XPRD+XCOD_PD TO XTRO
SEEK XTRO
IF .NOT. EOF()
@ 14,12 SAY 'cod.'
@ 17,13 SAY 'COSTO'
@ 18,12 SAY 'PREZZO' 
@ 19,12 SAY 'UL.FOR'
@ 18,30 SAY 'GIADIN'
@ 14,18 SAY CODICE
@ 14,30 SAY DESCRIZ
@ 17,17 SAY COSTO
@ 18,17 SAY PREZZO_1
@ 19,23 SAY DST
@ 18,36 SAY GIADIN
@ 18,48 SAY 'U.V.'
@ 18,53 SAY ULTVEN
@ 21,10 GET CBARRE
READ
ELSE
@ 14,30 SAY 'PRODOTTO SENZA CODICE'
ENDIF
@23,1 SAY 'CONTINUI ?' GET ANC
READ
ENDDO
RETU
*** FINE ATTRIB ***
