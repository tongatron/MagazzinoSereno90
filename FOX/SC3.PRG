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
*V1='    '
*V2='             '
*V3='                             '
*V4=0
stor "S" to ANC
do whil ANC ="S"

    @ 5,0  clea 
  stor "              " to COD
  stor "N" to NO
  stor 1 to QTA
*  @1,1   say date()
*  @1,29  say "REGISTRAZIONE SCARICHI"
*  @1,73  say "SC2"
*  @2,29  say "======================"
 
 stor "S" to OK
@ 0,0 CLEAR
*@ 1,4 SAY V1
*@ 1,12 SAY V2
*@ 1,28 SAY V3
*@ 1,52 SAY V4
@ 2,2 SAY DATE()
@ 2,29 SAY "REGISTRAZIONE SCARICHI"
@ 3,0 SAY REPLICATE("Ä",80)
@ 4,0 SAY "CODICE PRODOTTO"
@ 5,0 SAY REPLICATE("Ä",80)
@ 4,16 GET COD picture'!!!!!!!!!!!!!!'
 * @6,0   clea 
  *  @6,15 SAY "9999 per finire."
*@6,1   say "CODICE: " get COD  picture'!!!!!!!!!!!!!!'
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
*    @ 3,41 SAY PIPPA
    *** FINE ULTV ***
@ 7,0 SAY "DESCRIZIONE"
@ 7,50 SAY "C.INT."
@ 7,62 SAY "UT."
@ 7,65 SAY LTRIM(STR(PREZZO_1 - (COST_MED*1.2)))
@ 8,6 SAY "DITTA"
@ 8,50 SAY "RT."
@ 9,50 SAY  "INV."
@ 9,55 SAY LTRIM(STR(GIACONT))
@ 9,59 SAY "ACQ."
@ 9,65 SAY LTRIM(STR(PROGCAR))
@ 9,70 SAY "="
@ 9,72 SAY LTRIM(STR(GIACONT+PROGCAR))
@ 10,59 SAY "SC."
@ 10,72 SAY LTRIM(STR(PROGSCA+1))
@ 11,59 SAY "GI."
@ 11,72 SAY LTRIM(STR(GIADIN-1))
@ 9,5 SAY "PREZZO"
@ 10,0 SAY "ULTIMO CAR."
@ 11,0 SAY "ULTIMA VEN."
@ 12,0 SAY "FORN."
@ 12,15 SAY DST
@ 15,0 SAY REPLICATE("Ä",80)
PIPPA= DESCRIZ
*@ 7,15 SAY DESCRIZ
@ 7,15 SAY PIPPA
@ 7,57 SAY LTRIM(STR(PREZZO_1/COST_MED,8,2))
@ 8,15 SAY PRD
*@ 8,66 SAY COSTO/1000
@ 8,54 SAY LTRIM(STR(COST_MED))+'0069'
*@9,15 SAY LTRIM(STR(PREZZO_1))
@9,15 SAY PREZZO_1
@ 9,30 SAY "L."
@ 9,33 SAY LTRIM(STR(ROUND(PREZZO_1*1936.27,4)))
@ 10,15 SAY ULTCAR
@ 11,15 SAY ULTVEN
*STORE PREZZO_1 TO V4
IF IVA <19
    @18,16 SAY "----ATTENZIONE BATTERE IVA ALIQUOTA DIVERSA----"
    @19,18 SAY "---ATTENZIONE BATTERE IVA ALIQUOTA DIVERSA---"
    @20,20 SAY "--ATTENZIONE BATTERE IVA ALIQUOTA DIVERSA--"	
ENDIF
*      @ 6,25 SAY PRD
*      @ 6,32 SAY DST
*      @ 6,40 SAY PREZZO_1 / COSTO  
*      @ 6,36 SAY ULTCAR
*      @ 8,1  say DESCRIZ
*      @ 8,40 say GIADIN  
*      @ 8,49 say PREZZO_1
*      @ 8,61 SAY TRIM(STR(COSTO))+'0069'  
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
*        STOR CODICE  TO V1
*        STORE CODISTR TO V2
*        STORE DESCRIZ TO V3
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