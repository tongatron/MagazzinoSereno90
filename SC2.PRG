*  FILE NAME: SCARICA.PRG
*  BY: MAX BINDI
*  DATE: October 4, 1989
* SCARICA
CLEA
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
STOR "                          " TO PIPPA
stor "S" to ANC
do whil ANC ="S"
    @ 5,0  clea 
  stor "              " to COD
  stor "N" to NO
  stor 1 to QTA
  @1,1   say date()
  @1,29  say "REGISTRAZIONE SCARICHI"
  @1,73  say "SC2"
  @2,29  say "======================"
  stor "S" to OK
  @6,0   clea 
  *  @6,15 SAY "9999 per finire."
  @6,1   say "CODICE: " get COD  picture'!!!!!!!!!!!!!!'
  read 
  COD1 = trim(COD)
  BARRE=.F.
  if len(COD1)#0
    if len(cod1)<=4
      set Order to 1
    else 
      set Order to 2
ENDIF
      BARRE=.T.
      OK='S'
      QTA=1
    seek COD1
    if .NOT. eof()
    *** ULTV ***
*    @ 2,38 SAY "É"+REPLICATE("Í",30)+"»"
*    @ 3,38 SAY "º"
*    @ 3,69 SAY "º"
*    @ 4,38 SAY "È"+REPLICATE("Í",30)+"¼"
    @ 3,41 SAY PIPPA
    *** FINE ULTV ***
      @ 6,25 SAY PRD
      @ 6,32 SAY DST
      @ 6,40 SAY PREZZO_1 / COSTO  
      @ 6,36 SAY ULTCAR
      @ 8,1  say DESCRIZ
      @ 8,40 say GIADIN  
      @ 8,49 say PREZZO_1
      @ 8,61 SAY TRIM(STR(COSTO))+'0069'  
      if .NOT. BARRE 
        @ 10,1 say "PRODOTTO ESATTO <S><N>? " get OK
        read 
      endi 
    STORE DESCRIZ TO PIPPA
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
  @ 23,1  say "CONTINUI <S><N>? " get ANC
  *BARRE =.F.
  read 
endd 
flush
clea 
retu 
*Formatted by: dANALYST Ver. 5.7, on June 7, 1992.
