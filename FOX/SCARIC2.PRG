*  FILE NAME: SCARICA.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
* SCARICA
set talk off 
DATUL=date()
sele 2
use SCARICHI inde NDXSCARI
sele 3
use ANAGRAF inde CODISTR
sele 4
use ARKIVOLD inde PRODOLD,barold
set rela to PRD into ANAGRAF
sele 1
use ARKIVIO inde PRODO,barrex
set rela to PRD into ANAGRAF
stor "S" to ANC
do whil ANC ="S"
  clea 
  stor "              " to COD
  stor "N" to NO
  stor 1 to QTA
*  @1,1   say date()
*  @1,29  say "REGISTRAZIONE SCARICHI"
*  @1,73  say "SCARICA"
*  @2,29  say "======================"
  stor "S" to OK
*  @6,0   clea 
  *  @6,15 SAY "9999 per finire."
*  @6,1   say "CODICE: " get COD 
*** VENDITA ***
@ 0,0 CLEAR
@ 2,2 SAY DATE()
@ 2,29 SAY "REGISTRAZIONE SCARICHI"
@ 3,0 SAY REPLICATE("Ä",80)
@ 4,0 SAY "CODICE PRODOTTO"
@ 4,16 GET COD
@ 5,0 SAY REPLICATE("Ä",80)
READ


*** FINE VENDITA ***

  read 
  COD1 = trim(COD)
  BARRE=.F.
  if len(COD1)#0
    if len(cod1)<=4
      set Order to 1
    else 
      set Order to 2
      BARRE=.T.
      OK='S'
      QTA=1
    endi 
    seek COD1
    if .NOT. eof()
@ 7,0 SAY "DESCRIZIONE"
@ 7,54 SAY "COD.INTERNO"
@ 8,6 SAY "DITTA"
@ 8,54 SAY "INDICE ROT."
@ 9,5 SAY "PREZZO"
@ 10,0 SAY "ULTIMO CAR."
@ 11,0 SAY "ULTIMA VEN."
@ 13,0 SAY REPLICATE("Ä",80)
@ 7,15 SAY DESCRIZ
@ 7,66 SAY PREZZO_1/COSTO
@ 8,15 SAY PRD
@ 8,66 SAY COSTO/1000
@ 9,15 SAY PREZZO_1
@ 10,15 SAY ULTCAR
@ 11,15 SAY ULTVEN
*      @ 6,25 SAY PRD
*      @ 6,32 SAY DST
*      @ 6,36 SAY ULTCAR
*      @ 6,49 SAY PREZZO_1 / COSTO
*      @ 8,1  say DESCRIZ
*      @ 8,40 say GIADIN  
*      @ 8,49 say PREZZO_1 
*      @ 8,61 SAY TRIM(STR(COSTO))+'0069'  
      if .NOT. BARRE 
        @ 10,1 say "PRODOTTO ESATTO <S><N>? " get OK
        read 
      endi 
      if OK = "S"   
        if .NOT. BARRE     
          @12,5   say "DATA SCARICO " get DATUL
          @12,35  say "QUANTITA' " get QTA pict "99999"
          read 
        endi 
        @ 12,55 say year(DATUL)
        if QTA > GIADIN
          @14,5   say "ESISTENZA "
          @14,15  say GIADIN
          @14,20  say "<- MINORE DI SCARICO!"
          if .NOT. BARRE    
            @14,42  say "VA BENE COSI' <N><S>? " get NO
            read 
            if NO = "N"
              loop 
            endi 
          endi 
        endi 
        if year(date()) #  year(DATUL)
          sele 4
        endi 
        seek COD1
        repl GIADIN with GIADIN - QTA
        repl PROGSCA with PROGSCA + QTA
        repl ULTVEN with DATUL 
        stor ANAGRAF->NOME to NOME
        if year(date())  # year(DATUL)
          sele 1
          seek COD1
          repl GIACONT with GIACONT - QTA
          repl GIADIN  with GIADIN  - QTA
          if year(ULTVEN)< year(DATUL)
            repl ULTVEN with DATUL 
          endi 
          stor ANAGRAF->NOME to NOME
        endi 
        sele 2
        appe blan 
        repl CODICE with A->CODICE,PRD with A->PRD,QUANT with QTA;
        data with DATUL,CODISTR with A->CODISTR,ARTICOLO with ;
        A->COD_PD,PRODUT with NOME,DESCRIZ with A->DESCRIZ
      endi 
      sele 1
    endi 
  endi 
@ 21,0 SAY "CONTINUI ?"
@ 21,13 GET ANC
*  @ 23,1  say "CONTINUI <S><N>? " get ANC
  *BARRE =.F.
  read 
endd 
flush
clea 
retu 
*Formatted by: dANALYST Ver. 5.7, on June 7, 1992.
