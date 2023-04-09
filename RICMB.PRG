*:*****************************************************************************
*:
*: Procedure file: C:\FOX\UPDATPRO.PRG
*:         System: Magazzino
*:         Author: Massimo Bindi
*:      Copyright (c) 16/0393, max & sandro
*:  Last modified: 14/02/92 at  9:13:04
*:
*:         Set by: MENU1.PRG                         
*:
*:           Uses: ARKIVIO.DBF            Alias: ARK
*:
*:        Indexes: PRODO.IDX          
*:               : ARTICOLO.IDX       
*:               : BARREX.IDX         
*:
*:      Documented 13:41:32                                FoxDoc version 3.00a
*:*****************************************************************************
*  FILE NAME: UPDATPRO.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* UPDATPRO *
SET TALK ON
USE arkivio INDE prodo,articolo,barrex
STOR "S" TO anc

DO WHIL anc ="S"
   STOR "    " TO cod
*   CLEA
   @12,5  SAY "CODICE PRODOTTO " GET cod
   READ
   SEEK cod
 *  CLEA
 CANC='N'
   IF .NOT. EOF()
      @1,1  SAY DATE()
      @1,29 SAY "CORREZIONE MAGAZZINO"
      @1,71 SAY "RICMB"
  *** RICMB ***
@ 0,0 CLEAR
@ 2,25 SAY "CODICE"
@ 3,0 SAY "DITTA"
@ 3,37 SAY "ARTICOLO"
@ 5,0 SAY "DESCR"
@ 7,0 SAY "GIACONT          CARICHI            SCARICHI            GIACENZA"
@ 9,0 SAY "ULTVEND"
@ 9,25 SAY "ULTCAR"
@ 9,52 SAY "IVA"
@ 11,0 SAY "CATEGORIA           CODICE BARRE"
@ 13,0 SAY "COSTO MEDIO"
@ 13,32 SAY "COSTO ULTIMO"
@ 15,0 SAY "CARICO A VALORE"
@ 19,17 SAY "CANCELLO"
@ 21,17 SAY "CONTINUI"
@ 2,32 SAY CODICE
@ 3,6 SAY PRD
@ 3,46 SAY COD_PD
@ 5,6 SAY DESCRIZ
@ 7,8 SAY GIACONT
@ 7,25 SAY PROGCAR
@ 7,45 SAY PROGSCA
@ 7,65 SAY GIADIN
@ 9,8 SAY ULTVEN
@ 9,32 SAY ULTCAR
@ 9,56 SAY IVA
@ 11,10 SAY CAT
@ 11,33 SAY CBARRE
@ 13,12 SAY COST_MED
@ 13,45 SAY COSTO
@ 15,16 SAY CARVALOR
@ 19,29 GET CANC
READ
IF CANC ='S'
DELE
ENDIF
@ 21,29 GET ANC
*** FINE RICMB ***

      READ
    ELSE
RETU
 ENDI
ENDD
PACK
REIND
FLUSH
CLEA
RETU
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
*: EOF: UPDATPRO.PRG
