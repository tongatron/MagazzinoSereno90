*  FILE NAME: UPDATPRO.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* UPDATPRO *
SET TALK OFF 
USE ARKIVIO INDE PRODO,ARTICOLO,BARREX,XDESC
STOR "S" TO ANC
DO WHIL ANC ="S"
   STOR "    " TO COD
   CLEA 
   @12,5  SAY "CODICE PRODOTTO " GET COD 
   READ 
   SEEK COD
   CLEA 
   IF .NOT. EOF()
      @1,1  SAY DATE()
      @1,29 SAY "CORREZIONE MAGAZZINO"
      @1,71 SAY "UDDATPRO"
      @1,50 SAY CODICE
      @2,29 SAY "===================="
      @6,1   SAY "ARTICOLO: " GET COD_PD
      @6,26  SAY "PROD/DISTRIB.: " GET PRD
      @6,47  SAY "CANALE FORN: " GET DST
      @ 6,64 SAY "CATEGORIA: " GET CAT
      @ 9,1  SAY "DESCRIZIONE: " GET DESCRIZ
      @12,1  SAY "COSTO: " GET COSTO
      @12,19 SAY "% I.V.A.: " GET IVA
      @12,34 SAY "PREZZO: " GET PREZZO_1
      @12,53 SAY "DATA ULT.VENDITA" GET ULTVEN
*     @14,1  SAY "QUANTITA' ORD. MINIMO: " GET QMIN
      @14,33 SAY "BR:" GET CBARRE
      @14,57 SAY "CVED: " GET SCMIN
      @16,1  SAY "GIACENZA CONT.: " GET GIACONT
      @16,30 SAY "DINAMICA " GET GIADIN
      @16,54 SAY "DATA ULT.CARICO" GET ULTCAR
      @18,1  SAY "COSTO MEDIO " GET COST_MED
      @18,25 SAY "COSTO CONT." GET COST_CONT
      @18,50 SAY "PROG.CARICHI VALORE " GET CARVALOR
      @20,1  SAY "QUANTITA' PROGRESSIVE: CARICHI " GET PROGCAR
      @20,42 SAY "SCARICHI " GET PROGSCA
      @20,60 SAY "CATAL." GET CATALOGO
      @23,1  SAY "CONTINUI <S><N>? " GET ANC
      READ 
         REPL CODISTR WITH PRD+COD_PD
   ELSE 
      RETU 
   ENDI 
ENDD
flush 
CLEA 
RETU 
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
