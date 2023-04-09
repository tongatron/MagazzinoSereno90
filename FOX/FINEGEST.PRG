CLEAR
SET TALK OFF
USE ARKIVIO 
@  1,0  SAY DATE()
@  1,28 SAY "OPERAZIONI DI FINE GESTIONE"
@  1,72 SAY "FINEGEST"
@  2,28 SAY "---------------------------"
STORE 0 TO CHOICE
@  5,10 SAY "1 - CREAZIONE MAGAZZINO PER NUOVO ANNO."
@  6,10 SAY "    Duplica il magazzino spostando la giacenza dinamica"
@  7,10 SAY "    sulla giacenza contabile."
@  8,10 say "    Azzera scarichi e carichi progressivi."
@ 10,10 SAY "    Crea magazzino anno precedente con il nome ARKIVOLD."
@ 12,10 say "2 - ESAME/CORREZIONE MAGAZZINO ANNO PRECEDENTE"
@ 14,10 SAY "0 - RITORNO A MENU"
@ 20,10 SAY "Scegli l'operazione desiderata " GET CHOICE PICTURE '9' 
READ
DO CASE
   CASE CHOICE= 1 
        COPY STRUCTURE TO ARKIVOLD
        COPY TO ARKIVOLD
        CLEAR
        SET TALK ON
        @ 10,10 SAY "STA CREANDO L'INDICE..."
        USE ARKIVOLD
        INDEX ON CODICE TO PRODOLD
        CLEAR
        @ 10,10 SAY "STA TRASFERENDO L'ESISTENZA.."
        USE ARKIVIO
        DO WHILE .NOT. EOF()
           REPLACE GIACONT WITH GIADIN;
           PROGSCA WITH 0,PROGCAR WITH 0,CARVALOR WITH 0
           SKIP
        ENDDO
    CLEAR
 flush
*@ 10,10 SAY "VAFFANCULO"
* WAIT  
CASE CHOICE =2
        DO UPDATOLD
ENDCASE
   RETURN

