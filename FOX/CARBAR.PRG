SET TALK OFF
USE ARKIVIO INDEX PRODO,BARREX
STORE 'S' TO ANC
DO WHILE ANC='S'
STORE '    ' TO XPRD
@ 0,0 CLEAR
@ 2,23 SAY "É"+REPLICATE("Í",29)+"»"
@ 3,23 SAY "º  INTRODUZIONE CODICI BARRE  º"
@ 4,23 SAY "È"+REPLICATE("Í",29)+"¼"
@ 9,8 SAY "Ú"+REPLICATE("Ä",18)+"Â"+REPLICATE("Ä",43)+"¿"
@ 10,8 SAY "³COD:              ³         "
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
@ 10,15 GET XPRD PICTURE '!!!!'
READ
*SET ORDER TO 1
SEEK XPRD
IF .NOT. EOF()
@ 10,30 SAY PRD
@ 10,40 SAY 'ART:'
@ 10,45 SAY COD_PD
@ 14,12 SAY 'COSTO.'
@ 14,18 SAY COSTO
@ 14,30 SAY DESCRIZ
@ 18,17 SAY GIADIN
@ 18,36 GET CBARRE
ELSE
@ 14,30 SAY 'CODICE ERRATO'
ENDIF
@23,1 SAY 'CONTINUI ?' GET ANC
READ
ENDDO
FLUS
RETU
