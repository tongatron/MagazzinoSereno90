SET TALK OFF
USE ARKIVIO INDEX BARREX
STORE '              ' TO XPRD
STORE 'S' TO ANC
DO WHILE ANC='S'
  *  STORE '            ' TO XCOD_PD
*** ATTRIB ***
*STORE '               ' TO XPRD
@ 0,0 CLEAR
@ 2,23 SAY "�"+REPLICATE("�",29)+"�"
@ 3,23 SAY "�CONTROLLO ATTRIBUZIONE CODICE�"
@ 4,23 SAY "�"+REPLICATE("�",29)+"�"
@ 9,8 SAY "�"+REPLICATE("�",18)+"�"+REPLICATE("�",43)+"�"
@ 10,8 SAY "�BARRE:                      "
@ 10,71 SAY "�"
@ 11,8 SAY "�"
@ 11,27 SAY "�"
@ 11,71 SAY "�"
@ 12,8 SAY "�"+REPLICATE("�",18)+"�"+REPLICATE("�",43)+"�"
@ 13,8 SAY "�"
@ 13,27 SAY "�"
@ 13,71 SAY "�"
@ 14,8 SAY "�                  �            "
@ 14,71 SAY "�"
@ 15,8 SAY "�"
@ 15,27 SAY "�"
@ 15,71 SAY "�"
@ 16,8 SAY "�"+REPLICATE("�",18)+"�"+REPLICATE("�",43)+"�"
@ 17,8 SAY "�"
@ 17,27 SAY "�"
@ 17,71 SAY "�"
@ 18,8 SAY "�                  �       "
@ 18,71 SAY "�"
@ 19,8 SAY "�"
@ 19,27 SAY "�"
@ 19,71 SAY "�"
@ 20,8 SAY "�"+REPLICATE("�",18)+"�"+REPLICATE("�",43)+"�"
@ 10,15 GET XPRD
* 10,38 GET XCOD_PD
READ
*TORE XPRD+XCOD_PD TO XTRO
SEEK XPRD
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
ELSE
@ 14,30 SAY 'PRODOTTO SENZA CODICE'
ENDIF
@23,1 SAY 'CONTINUI ?' GET ANC
READ
ENDDO
RETU
*** FINE ATTRIB ***
