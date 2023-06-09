*  FILE NAME: LISTA1.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:

* LISTA1
SET TALK OFF 
STOR "0" TO LI
CLEA 
@  1,1  SAY DATE()
@  1,32 SAY "LISTE MAGAZZINO"
@  1,73 SAY "LISTA1"
@  2,32 SAY "==============="
@  6,32 SAY "0 - FINE LAVORO"
@  8,32 SAY "1 - LM1 (ELENCO GENERALE PER CATEGORIA)"
@ 10,32 SAY "2 - LM2 (ELENCO GENERALE PER PROD/DISTR)"
@ 12,32 SAY "3 - LM3 (LISTINI INTERNI)"
@ 14,32 SAY "4 - LM4 (PER CATEGORIA)"
@ 16,32 SAY "5 - LM5 (PER PROD/DISTR)"
USE ARKIVIO INDE PRODO
@ 20,32 SAY "SCEGLI LISTA " GET LI
READ 
IF LI #"0"
   STOR "999" TO FILT2
   STOR "999" TO FILTRO
   STOR "9999" TO FILT3
   STOR "9999" TO FILT4
   IF LI = "4"
      @  4,0  CLEA 
      @  6,1  SAY "QUALE CATEGORIA (999=TUTTE) " GET FILTRO
      READ 
      * TYPE TO PRINT CHR18
      IF FILTRO="999"
         REPO FORM LM4 NOEJ TO PRIN 
         * TYPE TO PRINT CHR12
      ELSE 
         STOR "CATEGORIA "+FILTRO TO FILT 
         REPO FORM LM4 FOR CAT=FILTRO NOEJ TO PRIN HEAD FILT 
         * TYPE TO PRINT CHR12
      ENDI 
   ELSE 
      @  4,0  CLEA 
      @  6,1  SAY "QUALE PRODUTTORE/DISTR (999=TUTTI)? " GET FILTRO
      @  8,1  SAY "QUALE CATEGORIA        (999=TUTTE)? " GET FILT2
      @ 10,1  SAY "PRODOTTO INIZIALE     (9999=TUTTI)? " GET FILT3
      @ 11,10 SAY "FINALE       (9999=TUTTI)? " GET FILT4
      READ 
      *IF LI ="1"
      * TYPE TO PRINT CHR15
      * ELSE
      * TYPE TO PRINT CHR18
      *ENDIF
      IF FILTRO="999" .AND. FILT2="999" .AND. FILT3="9999"
         DO CASE 
         CASE LI="1"
            REPO FORM LM1 NOEJ TO PRIN 
            * TYPE TO PRINT CHR12
         CASE LI="2"
            USE ARKIVIO INDE ARTICOLO 
            REPO FORM LM2 NOEJ TO PRIN 
            * TYPE TO PRINT CHR12
         CASE LI="5"
            REPO FORM LM5 NOEJ TO PRIN 
            * TYPE TO PRINT CHR12
         CASE LI="3"
            REPO FORM LM3 NOEJ TO PRIN 
            * TYPE TO PRINT CHR12
         ENDC 
      ENDI 
      IF FILTRO # "999" .AND. FILT2="999" .AND. FILT3="9999"
         STOR "PRD/DISTR "+FILTRO TO FILT 
         DO CASE 
         CASE LI="5"
            REPO FORM LM5 FOR PRD=FILTRO NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="3"
            REPO FORM LM3 FOR PRD=FILTRO NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="2"
            USE ARKIVIO INDE ARTICOLO 
            REPO FORM LM2 FOR PRD=FILTRO NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="1"
            REPO FORM LM1 FOR PRD=FILTRO NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         ENDC 
      ENDI 
      IF FILTRO # "999" .AND. FILT2 #"999" .AND. FILT3="9999"
         STOR "PRD/DISTR "+FILTRO TO FILT 
         STOR FILT + " CAT. " + FILT2 TO FILT 
         DO CASE 
         CASE LI ="5"
            REPO FORM LM5 FOR PRD=FILTRO .AND. CAT=FILT2 NOEJ TO PRIN ;
            HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="3"
            REPO FORM LM3 FOR PRD=FILTRO .AND. CAT=FILT2 NOEJ TO PRIN ;
            HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="2"
            USE ARKIVIO INDE ARTICOLO 
            REPO FORM LM2 FOR PRD=FILTRO .AND. CAT=FILT2 NOEJ TO PRIN ;
            HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="1"
            REPO FORM LM1 FOR PRD=FILTRO .AND. CAT=FILT2 NOEJ TO PRIN ;
            HEAD FILT 
            * TYPE TO PRINT CHR12
         ENDC 
      ENDI 
      IF FILTRO ="999" .AND. FILT2 #"999" .AND. FILT3="9999"
         STOR "CAT. "+FILT2 TO FILT 
         DO CASE 
         CASE LI="5"
            REPO FORM LM5 FOR CAT=FILT2 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="3"
            REPO FORM LM3 FOR CAT=FILT2 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="2"
            USE ARKIVIO INDE ARTICOLO 
            REPO FORM LM2 FOR CAT=FILT2 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="1"
            REPO FORM LM1 FOR CAT=FILT2 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         ENDC 
      ENDI 
      IF FILTRO="999" .AND. FILT2="999" .AND. FILT3#"9999"
         STOR "DA COD. "+FILT3 +" A COD. "+FILT4 TO FILT 
         DO CASE 
         CASE LI="5"
            REPO FORM LM5 FOR CODICE >=FILT3 .AND. CODICE <=FILT4;
            NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="3"
            REPO FORM LM3 FOR CODICE >=FILT3 .AND. CODICE <=FILT4;
            NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="2"
            USE ARKIVIO INDE ARTICOLO 
            REPO FORM LM2 FOR CODICE >=FILT3 .AND. CODICE <=FILT4;
            NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="1"
            REPO FORM LM1 FOR CODICE >=FILT3 .AND. CODICE <=FILT4;
            NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         ENDC 
      ENDI 
      IF FILTRO # "999" .AND. FILT2="999" .AND. FILT3#"9999"
         STOR "PRD/DISTR "+FILTRO +"- DA COD."+FILT3+" A COD. "+FILT4 TO FILT 
         DO CASE 
         CASE LI="5"
            REPO FORM LM5 FOR PRD=FILTRO .AND. CODICE >=FILT3 .AND. CODICE;
            <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="3"
            REPO FORM LM3 FOR PRD=FILTRO .AND. CODICE >=FILT3 .AND. CODICE;
            <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="2"
            USE ARKIVIO INDE ARTICOLO 
            REPO FORM LM2 FOR PRD=FILTRO .AND. CODICE >=FILT3 .AND. CODICE;
            <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="1"
            REPO FORM LM1 FOR PRD=FILTRO .AND. CODICE >=FILT3 .AND. CODICE;
            <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         ENDC 
      ENDI 
      IF FILTRO # "999" .AND. FILT2 #"999" .AND. FILT3#"9999"
         STOR "PRD/DISTR "+FILTRO TO FILT 
         STOR FILT + " CAT. " + FILT2 TO FILT 
         STOR FILT +"- DA COD."+FILT3+" A COD."+FILT4 TO FILT 
         DO CASE 
         CASE LI ="5"
            REPO FORM LM5 FOR PRD=FILTRO .AND. CAT=FILT2 .AND. CODICE >=FILT3;
            .AND. CODICE <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="3"
            REPO FORM LM3 FOR PRD=FILTRO .AND. CAT=FILT2 .AND. CODICE >=FILT3;
            .AND. CODICE <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="2"
            USE ARKIVIO INDE ARTICOLO
            REPO FORM LM2 FOR PRD=FILTRO .AND. CAT=FILT2 .AND. CODICE >=FILT3;
            .AND. CODICE <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="1"
            REPO FORM LM1 FOR PRD=FILTRO .AND. CAT=FILT2 .AND. CODICE >=FILT3;
            .AND. CODICE <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         ENDC 
      ENDI 
      IF FILTRO ="999" .AND. FILT2 #"999" .AND. FILT3#"9999"
         STOR "CAT. "+FILT2 +" DA COD."+FILT3+" A COD."+FILT4 TO FILT 
         DO CASE 
         CASE LI="5"
            REPO FORM LM5 FOR CAT=FILT2 .AND. CODICE >=FILT3 .AND. CODICE;
            <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="3"
            REPO FORM LM3 FOR CAT=FILT2 .AND. CODICE >=FILT3 .AND. CODICE;
            <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="2"
            USE ARKIVIO INDE ARTICOLO 
            REPO FORM LM2 FOR CAT=FILT2 .AND. CODICE >=FILT3 .AND. CODICE;
            <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         CASE LI="1"
            REPO FORM LM1 FOR CAT=FILT2 .AND. CODICE >=FILT3 .AND. CODICE;
            <= FILT4 NOEJ TO PRIN HEAD FILT 
            * TYPE TO PRINT CHR12
         ENDC 
      ENDI 
   ENDI 
ENDI 
flush
CLEA 
RETU 
