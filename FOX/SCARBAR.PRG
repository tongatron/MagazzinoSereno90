RELE ALL
DATUL=DATE()
SELE 2
USE SCARICHI INDE NDXSCARI
SELE 3
USE ANAGRAF INDE CODISTR
*SELE 4
*USE ARKIVOLD INDE PRODOLD
*SET RELA TO PRD INTO ANAGRAF
SELE 1
USE ARKIVIO INDE BARREX
SET RELA TO PRD INTO ANAGRAF
STOR "S" TO ANC
DO WHIL ANC ="S"
   CLEA 
   STOR "              " TO XCBAR
   STOR "N" TO NO
   STOR 1 TO QTA
   @1,1   SAY DATE()
   @1,29  SAY "REGISTRAZIONE SCARICHI"
   @1,73  SAY "SCARICA"
   @2,29  SAY "======================"
   STOR "S" TO OK
   @6,0   CLEA 
*  @6,15 SAY "9999 per finire."
   @6,1   SAY "CODICE: " GET XCBAR 
   READ 
    IF XCBAR=' '
*    LOOP
    RETU
    ENDIF
   SEEK XCBAR
   IF .NOT. EOF()
      @ 8,1  SAY DESCRIZ
      @ 8,40 SAY GIADIN  
      @ 10,1 SAY "PRODOTTO ESATTO <S><N>? " GET OK
      READ 
      IF OK = "S"   
         @12,5   SAY "DATA SCARICO " 
         @12,20  SAY DATUL
         @12,35  SAY "QUANTITA' " GET QTA PICT "99999"
         READ 
         @ 12,55 SAY YEAR(DATUL)
         IF QTA > GIADIN
            @14,5   SAY "ESISTENZA "
            @14,15  SAY GIADIN
            @14,20  SAY "<- MINORE DI SCARICO!"
            @14,42  SAY "VA BENE COSI' <N><S>? " GET NO
            READ 
            IF NO = "N"
               LOOP 
            ENDI 
         ENDI 
*         IF YEAR(DATE()) #  YEAR(DATUL)
*            SELE 4
         ENDI 
         SEEK XCBAR
            REPL GIADIN WITH GIADIN - QTA
            REPL PROGSCA WITH PROGSCA + QTA
            REPL ULTVEN WITH DATUL 
         STOR ANAGRAF->NOME TO NOME
         IF YEAR(DATE())  # YEAR(DATUL)
            SELE 1
            SEEK XCBAR
               REPL GIACONT WITH GIACONT - QTA
               REPL GIADIN  WITH GIADIN  - QTA
            IF YEAR(ULTVEN)< YEAR(DATUL)
                  REPL ULTVEN WITH DATUL 
            ENDI 
            STOR ANAGRAF->NOME TO NOME
         ENDI 
         SELE 2
            APPE BLAN 
            REPL CODICE WITH A->CODICE,PRD WITH A->PRD,QUANT WITH QTA;
            DATA WITH DATUL,CODISTR WITH A->CODISTR,ARTICOLO WITH ;
            A->COD_PD,PRODUT WITH NOME,DESCRIZ WITH A->DESCRIZ
      ENDI 
      SELE 1
*   ENDI 
   @ 23,1  SAY "CONTINUI <S><N>? " GET ANC
   READ 
ENDD 
flush
CLEA 
RETU 
