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
@ 2,0 SAY "�"+REPLICATE("�",78)+"�"
@ 3,0 SAY "�"
@ 3,28 SAY "REGISTRAZIONE CARICHI              SERENO S.A.S.   �"
@ 4,0 SAY "�������������������������"+REPLICATE("�",54)+"�"
@ 5,0 SAY "� FORNIT.�              �"
@ 5,79 SAY "�"
@ 6,0 SAY "���������������������������������"+REPLICATE("�",46)+"�"
@ 7,0 SAY "� ARTIC. �              �       �"
@ 7,64 SAY "    OK?        �"
@ 8,0 SAY "���������������������������������������"+REPLICATE("�",40)+"�"
@ 9,0 SAY "�"
@ 9,19 SAY "�"
@ 9,38 SAY "�                �01  da inventario      �"
@ 10,0 SAY "�    DATA          �  CANALE          � TIPO           �02  da bolla/fattura   �"
@ 11,0 SAY "�"
@ 11,19 SAY "�"
@ 11,38 SAY "�                �03  in ordine          �"
@ 12,0 SAY "�"+REPLICATE("�",18)+"��������������������"+REPLICATE("�",40)+"�"
@ 13,0 SAY "�"
@ 13,26 SAY "�"
@ 13,79 SAY "�"
@ 14,0 SAY "� QUANTITA                �  COSTO UNIT."
@ 14,79 SAY "�"
@ 15,0 SAY "�"
@ 15,26 SAY "�"
@ 15,79 SAY "�"
@ 16,0 SAY "�"+REPLICATE("�",25)+"�"+REPLICATE("�",26)+"�"+REPLICATE("�",25)+"�"
@ 17,0 SAY "�"
@ 17,26 SAY "�"
@ 17,53 SAY "�"
@ 17,79 SAY "�"
@ 18,0 SAY "�   SCONTO                �  COSTO NETTO             � TOT.CAR.                �"
@ 19,0 SAY "�"
@ 19,26 SAY "�"
@ 19,53 SAY "�"
@ 19,79 SAY "�"
@ 20,0 SAY "�"+REPLICATE("�",25)+"�"+REPLICATE("�",26)+"�"+REPLICATE("�",25)+"�"
@ 21,0 SAY "�"
@ 21,79 SAY "�"
@ 22,0 SAY "�     ESATTO ?"
@ 22,47 SAY "CONTINUI ?"
@ 22,79 SAY "�"
@ 23,0 SAY "�"
@ 23,79 SAY "�"
@ 24,0 SAY "�"+REPLICATE("�",78)+"�"
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