*  FILE NAME: CARICA.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* CARICA
SET TALK OFF 
CLEA 
SELE 3
USE ANAGRAF INDE CODISTR
SELE 1
USE ARKIVIO INDE ARTICOLO
SELE 2
USE CARICHI INDE PROCAR              
STOR "S" TO ANC  
STOR "02" TO TI
DAT=DATE()  
STOR "   " TO DI
STOR "  " TO CANAL
STOR 0.00 TO SCONTO
DO WHIL ANC="S"
   STOR "S" TO ANC
*** CARICHI ***
@ 0,0 CLEAR
@ 2,0 SAY "Ú"+REPLICATE("Ä",78)+"¿"
@ 3,0 SAY "³"
@ 3,28 SAY "REGISTRAZIONE CARICHI              SERENO S.A.S.   ³"
@ 4,0 SAY "ÃÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂ"+REPLICATE("Ä",54)+"´"
@ 5,0 SAY "³ FORNIT.³              ³"
@ 5,79 SAY "³"
@ 6,0 SAY "ÃÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÂ"+REPLICATE("Ä",46)+"´"
@ 7,0 SAY "³ ARTIC. ³              ³       ³"
@ 7,64 SAY "    OK?        ³"
@ 8,0 SAY "ÆÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÑÍÍÍÍÏÍÍÍÍÍÍÍÏÍÍÍÍÍÑ"+REPLICATE("Í",40)+"µ"
@ 9,0 SAY "³"
@ 9,19 SAY "³"
@ 9,38 SAY "³                Ú01  da inventario      ³"
@ 10,0 SAY "³    DATA          ³  CANALE          ³ TIPO           Ã02  da bolla/fattura   ³"
@ 11,0 SAY "³"
@ 11,19 SAY "³"
@ 11,38 SAY "³                À03  in ordine          ³"
@ 12,0 SAY "Ã"+REPLICATE("Ä",18)+"ÁÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÁ"+REPLICATE("Ä",40)+"´"
@ 13,0 SAY "³"
@ 13,26 SAY "³"
@ 13,79 SAY "³"
@ 14,0 SAY "³ QUANTITA                ³  COSTO UNIT."
@ 14,79 SAY "³"
@ 15,0 SAY "³"
@ 15,26 SAY "³"
@ 15,79 SAY "³"
@ 16,0 SAY "Ã"+REPLICATE("Ä",25)+"Å"+REPLICATE("Ä",26)+"Â"+REPLICATE("Ä",25)+"´"
@ 17,0 SAY "³"
@ 17,26 SAY "³"
@ 17,53 SAY "³"
@ 17,79 SAY "³"
@ 18,0 SAY "³   SCONTO                ³  COSTO NETTO             ³ TOT.CAR.                ³"
@ 19,0 SAY "³"
@ 19,26 SAY "³"
@ 19,53 SAY "³"
@ 19,79 SAY "³"
@ 20,0 SAY "Ã"+REPLICATE("Ä",25)+"Á"+REPLICATE("Ä",26)+"Á"+REPLICATE("Ä",25)+"´"
@ 21,0 SAY "³"
@ 21,79 SAY "³"
@ 22,0 SAY "³     ESATTO ?"
@ 22,47 SAY "CONTINUI ?"
@ 22,79 SAY "³"
@ 23,0 SAY "³"
@ 23,79 SAY "³"
@ 24,0 SAY "À"+REPLICATE("Ä",78)+"Ù"
*** FINE CARICHI ***
   @ 3,2  SAY DATE()
   STOR "S"            TO OK
   STOR "S"            TO ESA
   STOR "            " TO CODIS
   STOR "    "         TO CODIC
   STOR 0             TO QUA
   STOR 0             TO COST
   STOR 0             TO COTOT  
   STOR .F.            TO FQT
   STOR .F.            TO FVV
   STOR "                                   " TO DESCR
   @ 5,11 GET DI
   READ 
   SELE 3
   SEEK DI
   @ 5,27 SAY NOME
   IF EOF()
      IF DI="999"
         STOR "N" TO ANC
      ELSE 
         @  5,30 SAY "FORNITORE INESISTENTE ! IMMISSIONE " GET OK
         READ 
      ENDI 
   ELSE 
      @ 7,11 GET CODIS PICT "XXXXXXXXXXXX"
      READ 
      SELE 1
      STOR DI+CODIS TO COCO
      SEEK COCO                   
      IF EOF()
         @10,5  SAY "PRODOTTO INESISTENTE ! IMMISS " GET OK
         READ 
      ELSE 
         STOR A->CODICE TO CODIC
         STOR A->PREZZO_1 TO PREZZV
         @ 7,25 SAY CODICE
         @ 7,33 SAY DESCRIZ 
         @ 7,72 GET OK PICT "X"
         READ 
         DO CASE 
         CASE OK = "S"  
            @ 10,10 GET DAT        PICT "XXXXXX"         
            @ 10,29 GET CANAL             PICT "XX"
*           @ 10,47 GET TI      PICT  "XX"
            @ 14,12 GET QUA            PICT "99999"
            @ 14,41 GET COST      PICT "999999.99"
            @ 18,12 GET SCONTO PICT "99.9999"
            READ 
            IF SCONTO # 0
               STOR (COST *(100-SCONTO))/100 TO COST
               @ 18,41 SAY COST PICT "99999.99"
               STOR COST*QUA TO COTOT
              @ 18,64 SAY COTOT PICT "999999.99"  
            ENDI 
            IF QUA=0
               STOR " " TO ESA
               @ 20,5 SAY "QUANTITA' ZERO: CARICO NON REGISTRATO!!" GET ESA
            ELSE 
               @ 22,15 GET ESA
               READ 
            ENDI 
            IF ESA = "S"
               @ 22,58 GET ANC 
               READ 
               SELE 2
                  APPE BLAN 
                  REPL T WITH '02',CODICE WITH CODIC,DATC WITH DAT,ARTI WITH CODIS;
                  QUANT WITH QUA, COSTO WITH COST,CANALE WITH CANAL,FORNI WITH DI;
                  PREZZO WITH PREZZV
            ELSE 
            ENDI 
         CASE OK = "N"
	   * @ 7,1 CLEA 
            @ 22,47 SAY "ALTRI CARICHI <S><N>? " GET ANC
            READ 
         ENDC 
      ENDI 
   ENDI 
ENDD 
flush
CLEA 
RETU 
*Formatted by: dANALYST Ver. 5.7, on October 4, 1989.
