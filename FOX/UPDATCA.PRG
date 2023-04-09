*  FILE NAME: UPDATCA.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
*  DESC:
*  CALLED BY:
*  DATA FILES:
* UPDATCA
SET TALK OFF 
USE CARICHI INDE PROCAR             
CLEA 
STOR " " TO OK
STOR "S" TO ANC
DO WHIL ANC="S"
   CLEA 
   STOR "            " TO CODIC
   @ 1,1  SAY DATE()
   @ 1,29 SAY "CORREZIONE CARICHI" 
   @ 1,72 SAY "UPDATCA"
   @ 2,29 SAY "=================="
   @ 4,1  SAY "TIPI: 01 = INVENTARIO   02 = DA BOLLE/FAT"
   @ 4,45 SAY "03 = IN ORDINE   99 = ANNULLA"
   @ 7,21 SAY "ARTICOLO " GET CODIC PICT "XXXXXXXXXXXX"
   READ 
   LOCA FOR ARTI=CODIC
   IF EOF()
      @ 9,5  SAY "PRODOTTO NON PRESENTE ! IMMISS " GET OK
      READ 
   ELSE 
      DO WHIL .NOT. EOF()
         @  7,0  CLEA 
         @  9,5  SAY "TIPO (VEDI NOTA) "        GET T    
         @ 9,30  SAY "PROD/DISTR "              GET FORNI     
         @ 9,50  SAY "CANALE "                  GET CANALE
         @ 12,5  SAY "DATA GG/MM/AA "           GET DATC
         @ 12,30 SAY "CODICE ARTICOLO "         GET ARTI 
         @ 14,5  SAY "QUANTITA' "               GET QUANT
         @ 14,23 SAY "COSTO UNITARIO "          GET COSTO
         @ 14,48 SAY "CODICE "                  GET CODICE
         @ 20,1  SAY "---------------------------------------------------"
         READ 
         CONT 
      ENDD 
   ENDI 
   @ 18,1  SAY "CONTINUI <S><N>? "    GET ANC
   READ 
ENDD 
GO TOP 
DO WHIL .NOT. EOF()
      DELE FOR T ="99"
ENDD 
   PACK 
flush
CLEA 
RETU 
