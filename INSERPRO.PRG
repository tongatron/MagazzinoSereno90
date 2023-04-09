*  FILE NAME: INSERPRO.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* INSERPRO
USE ARKIVIO INDE PRODO,ARTICOLO,BARREX,XDESC
GO BOTT 
SET TALK OFF 
STOR "S" TO A
STOR "S" TO OK
STOR "   " TO C2
STOR "  " TO C7
STOR "   " TO C4
DO WHIL A="S"
   CLEA 
   STOR "    " TO C1
   STOR "                                   " TO C6
   STOR "            " TO C3
   STOR 0 TO C9
   STOR 0 TO C12
   STOR '               ' TO C16
   STOR 0 TO C17
   STOR 0 TO C18
   STOR 0 TO C19
   STOR 0 TO C20
   STOR 0 TO C21
   STOR "        " TO C22
   STOR 0 TO C23
   STOR 0 TO C24
   STOR 0 TO C55
   STOR 0 TO C25
   STOR 20                              TO C8
   @1,1   SAY DATE()
   @1,29  SAY "CARICAMENTO MAGAZZINO"
   @1,72  SAY "INSERPRO"
   @2,29  SAY "====================="
   @6,1   SAY "CODICE: " GET C1
   READ 
   SEEK C1
   IF .NOT. EOF()
      @ 8,10 SAY "CODICE GIA' ASSEGNATO !! IMMISS " GET C1
   ELSE 
      @6,21  SAY "PROD/DISTR: " GET C2
      @6,42  SAY "ARTICOLO: "  GET C3 
      @ 6,70 SAY "CAT.: " GET C4
      @ 8,1  SAY "DESCRIZIONE: " GET C6
      @ 8,54 SAY "CANALE FORNITURA: " GET C7
      @10,1  SAY "COSTO: " GET C9 PICT "999999.99"
      @10,21 SAY "PREZZO: " GET C12 PICT "999999.99"
      @10,55 SAY "% I.V.A. " GET C8 PICT "99"
      @14,1  SAY "CODICE A BARRE :" GET C16 
      *     @14,33 SAY "Q.TA' IN ORDINE: " GET C17 PICTURE "99999"
           @14,50 SAY "CODICE VEDES : " GET C18 PICTURE "99999999"
      *     @16,1  SAY "ESISTENZA: " GET C20 PICTURE "99999"
      *     @16,41 SAY "COSTO CONTABILE " GET C55 PICTURE "99999999"
      @18,1  SAY "--------------------------------------------------"
      @ 20,1 SAY "TUTTO CORRETTO   <S><N>? " GET OK
      @ 22,1 SAY "INSERISCI ANCORA <S><N>? " GET A
      READ 
      IF OK ="S"
         STOR C2+C3 TO C26
            APPE BLAN 
            REPL PRD WITH C2,DST WITH C7,CAT WITH C4,IVA WITH C8;
            CODICE WITH C1,COD_PD WITH C3,DESCRIZ WITH C6,COSTO WITH C9
            REPL PREZZO_1 WITH C12,CBARRE WITH C16,ORDINE WITH C17;
            SCMIN WITH C18,COST_MED WITH C19,COST_CONT WITH C55;
            GIADIN WITH C20,PROGCAR WITH C23,PROGSCA WITH C24
            REPL CARVALOR WITH C25,CODISTR WITH C26
      ENDI 
   ENDI 
ENDD 
CLOS DATA
flush 
CLEA 
RETU 
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
