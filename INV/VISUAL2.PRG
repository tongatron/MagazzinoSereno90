
* VISUAL2.CMD
CLEAR
RELEASE ALL
RESTORE FROM VAR2
@  1,13 SAY ".  0-2.5    .     2.5-5     . 5 -  7.5 .   7.5-  10 .    10-15"
@  2, 0 SAY "VALORE GR2."
@  2,10 SAY VAR_01
@  2,23 SAY "."
@  2,24 SAY VAR_04
@  2,38 SAY "."
@  2,40 SAY VAR_07
@  2,50 SAY "."
@  2,52 SAY VAR_52
@  2,62 SAY "."
@  2,65 SAY VAR_10
@  3, 0 SAY "NUM.PEZZI    ."
@  3,10 SAY VAR_02
@  3,23 SAY "."
@  3,24 SAY VAR_05
@  3,38 SAY "."
@  3,40 SAY VAR_08
@  3,50 SAY "."
@  3,52 SAY VAR_53
@  3,62 SAY "."
@  3,65 SAY VAR_11
@  4, 0 SAY "MEDIA        ."
@  4,10 SAY VAR_03
@  4,23 SAY "."
@  4,24 SAY VAR_06
@  4,38 SAY "."
@  4,40 SAY VAR_09
@  4,50 SAY "."
@  4,52 SAY VAR_54
@  4,62 SAY "."
@  4,65 SAY VAR_12
@  5, 0 SAY "-------------+------------+-------------+-------------+-------------+-----------"
@  6,13 SAY ".15  -  20  .      20-25 .      25-30     .    30-38     .    38-45"
@  7, 0 SAY "-------------+------------+-------------+-------------+-------------+-----------"
@  8, 0 SAY "VALORE GR2   ."
@  8,10 SAY VAR_13
@  8,23 SAY "."
@  8,24 SAY VAR_16
@  8,38 SAY "."
@  8,40 SAY VAR_19
@  8,50 SAY "."
@  8,52 SAY VAR_22
@  8,62 SAY "."
@  8,65 SAY VAR_25
@  9, 0 SAY "NUM.PEZZI    ."
@  9,10 SAY VAR_14
@  9,23 SAY "."
@  9,24 SAY VAR_17
@  9,38 SAY "."
@  9,40 SAY VAR_20
@  9,50 SAY "."
@  9,52 SAY VAR_23
@  9,62 SAY "."
@  9,65 SAY VAR_26
@ 10, 0 SAY "MEDIA        ."
@ 10,10 SAY VAR_15
@ 10,23 SAY "."
@ 10,24 SAY VAR_18
@ 10,38 SAY "."
@ 10,40 SAY VAR_21
@ 10,50 SAY "."
@ 10,52 SAY VAR_24
@ 10,62 SAY "."
@ 10,65 SAY VAR_27
@ 11, 0 SAY "-------------+------------+-------------+-------------+-------------+-----------"
@ 12,13 SAY "    45-55.         55-70 .      70-85  .     85-100  .     100-150"
@ 13, 0 SAY "-------------+------------+-------------+-------------+-------------+-----------"
@ 14, 0 SAY "VALORE GR2   ."
@ 14,10 SAY VAR_28
@ 14,23 SAY "."
@ 14,24 SAY VAR_31
@ 14,38 SAY "."
@ 14,40 SAY VAR_34
@ 14,50 SAY "."
@ 14,52 SAY VAR_37
@ 14,62 SAY "."
@ 14,65 SAY VAR_40
@ 15, 0 SAY "NUM.PEZZI    ."
@ 15,10 SAY VAR_29
@ 15,23 SAY "."
@ 15,24 SAY VAR_32
@ 15,38 SAY "."
@ 15,40 SAY VAR_35
@ 15,50 SAY "."
@ 15,52 SAY VAR_38
@ 15,62 SAY "."
@ 15,65 SAY VAR_41
@ 16, 0 SAY "MEDIA        ."
@ 16,10 SAY VAR_30
@ 16,23 SAY "."
@ 16,24 SAY VAR_33
@ 16,38 SAY "."
@ 16,40 SAY VAR_36
@ 16,50 SAY "."
@ 16,52 SAY VAR_39
@ 16,62 SAY "."
@ 16,65 SAY VAR_42
@ 17, 0 SAY "-------------+------------+-------------+-------------+-------------+-----------"
@ 18,13 SAY ".   150-200         .200-250       .>250      .             ."
@ 19, 0 SAY "-------------+------------+-------------+-------------+-------------+-----------"
@ 20, 0 SAY "VALORE GR2   ."
@ 20,10 SAY VAR_43
@ 20,23 SAY ".             .             .             ."
@ 21, 0 SAY "NUM.PEZZI    ."
@ 21,10 SAY VAR_44
@ 21,23 SAY ".             .             .             ."
@ 22, 0 SAY "MEDIA        .            .             .             .             ."
@ 22,10 SAY VAR_45
@ 20,24 SAY VAR_46
@ 21,27 SAY VAR_47
@ 22,27 SAY VAR_48
@ 20,41 SAY VAR_49
@ 21,41 SAY VAR_50
@ 22,41 SAY VAR_51
@ 23, 0 SAY "BATTI 1 PER AGGIORNARE          2 PER SPEGNERE"
WAIT TO RISPOSTA
DO CASE
 CASE RISPOSTA='1'
       DO PREZZO2
 CASE RISPOSTA='2'
       DO MEN1
ENDCASE
RETURN
