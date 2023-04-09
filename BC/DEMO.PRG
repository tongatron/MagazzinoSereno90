*  dBARCODE Demonstration Program
*
*  (C) Copyright 1988 TimeKeeping Systems, Inc.
*
*
*  This program shows the various ways dBARCODE can print bar codes.  For
*  dBASE programmers, it may also provide some ideas on how to incorporate
*  dBARCODE in your own programs.
*
*  This program is provided in compiled form on this demonstration disk.
*
*  If you are not a dBASE programmer, another program, BARPRINT.PRG, is
*  provided with dBARCODE so that you can print bar codes from your
*  own data bases.
*
SET PROCEDURE TO PROCS

*  These variables are also used by the procedures in PROCS.DBF:
PUBLIC row, saverow, halt, printer

* If the printer isn't ready, it's best to find out right at the beginning!
CH = ' '
SET DEVICE TO SCREEN
SET CONFIRM ON
SET TALK OFF
CLEAR
@1,12 SAY "Please check that printer is on and the press Return" GET CH
READ
SET DEVICE TO PRINT
@ PROW(),PCOL() SAY CHR(13)
SET DEVICE TO SCREEN
SET CONFIRM ON
SET TALK OFF

* To use dBARCODE, first LOAD the binary format module, dBARCODE.BIN
LOAD dBARCODE

* Prompt the user for the printer type being used
CLEAR
@ 1,12 SAY "DEMO.PRG -- dBARCODE Demonstration Program  Version 1.2x"
@ 2,18 SAY '(c) Copyright 1986 TimeKeeping Systems, Inc.'
@ 16,5 SAY "1 - Dot Matrix printer in IBM Graphics mode"
@ 17,5 SAY "2 - Dot Matrix printer in Epson LQ 24-pin mode"
@ 18,5 SAY "3 - Parallel Laser Jet"
@ 19,5 SAY "4 - Serial Laser Jet"
selectprnt=" "
DO WHILE .not. selectprnt $ "1234"
  @ 22,5 SAY "Select printer: "  GET selectprnt
  READ
ENDDO
if selectprnt = "1"
  pstr = "Dot Matrix printer in IBM Graphics mode"
  port = "1"
  printer = "0"
endif
if selectprnt = "2"
  pstr = "Dot Matrix printer in Epson LQ 24-pin mode"
  port = "1"
  printer = "2"
endif
if selectprnt = "3"
  pstr = "Parallel Laser Jet Printer"
  port = "1"
  printer = "1"
endif
if selectprnt = "4"
  pstr = "Serial Laser Jet Printer"
  port = "0"
  printer = "1"
endif
@ 16,0 CLEAR
halt = .f.

* Form the display

@ 4,5 SAY "Displaying:"
@ ROW()+1,10 SAY "Bar code types -- Code 39, 2 of 5, I 2 of 5, UPC-A, EAN-13, Code 93"
@ ROW()+1,10 SAY 'Bar code height -- adjustable in increments of 1/9"'
@ ROW()+1,10 SAY "Long bar codes -- up to 40 characters"
@ ROW()+1,10 SAY 'Space between bar codes -- adjustable in 1/6" increments'
@ ROW()+1,10 SAY "Suppressing text printing beneath the bar code"
@ ROW()+1,10 SAY "Incremental control of bar and space widths"
@ ROW()+1,10 SAY "Very large bar codes"
IF printer <> "1"
  @ ROW()+1,10 SAY "Text beneath narrow bar codes printed in narrow characters"
ENDIF
@ ROW()+1,10 SAY "Variable left margin widths"
IF printer <> "1"
  @ ROW()+1,10 SAY "Variable number of passes"
ENDIF
@ ROW()+1,10 SAY "Multiple bar codes on a single line"
@ ROW()+1,10 SAY "Variable spacing between bar codes"
@ ROW()+1,24 SAY "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
@ ROW()+1,24 SAY "³  TimeKeeping Systems, Inc.  ³"
@ ROW()+1,24 SAY "³    1306 East 55th Street    ³"
@ ROW()+1,24 SAY "³   Cleveland, Ohio  44103    ³"
@ ROW()+1,24 SAY "³      (216) 361-9995         ³"
@ ROW()+1,24 SAY "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"

* Do the printing demonstration

row=PROW()
@ 23,5 SAY "Press ESCAPE to abort printing"
@ 4,5 SAY "Displaying:"
@ ROW()+1,8 SAY "ş"
saverow=ROW()
DO txtprint WITH "dBARCODE Demonstration -- Printed on "+pstr
DO txtprint WITH ""
DO txtprint WITH "dBARCODE can print several different types of barcodes:"
DO txtprint WITH ""

* PROGRAMMING NOTE:
* -- note that you can set the values on the first CALL and dBARCODE
*    "remembers" them until they are changed or dBARCODE is RELEASEd
*    or reLOADed.  For any SPECS values not actually given in the calling
*    string, dBARCODE remembers and uses the previous values.

DO brcprint WITH "1040321220"+printer+port+"00"+chr(27)+"\dBARCODE\Code 39"
*                 ³³³³³³³³³³     ³      ³   ³³     ³
*  ERRLVL ÄÄÄÄÄÄÄÄÙ³³³³³³³³³     ³      ³   ³³     ÀÄÄÄÄÄ ABORT_CHAR
*  FORMAT ÄÄÄÄÄÄÄÄÄÙ³³³³³³³³     ³      ³   ³ÀÄÄÄÄÄÄÄÄÄÄÄ SPACER
*  LINES  ÄÄÄÄÄÄÄÄÄÄÙ³³³³³³³     ³      ³   ÀÄÄÄÄÄÄÄÄÄÄÄÄ PASSES
*  MARGIN ÄÄÄÄÄÄÄÄÄÄÄÙ³³³³³³     ³      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ PORT
*  HEIGHT ÄÄÄÄÄÄÄÄÄÄÄÄÙ³³³³³     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ PRINTER
*  TEXT   ÄÄÄÄÄÄÄÄÄÄÄÄÄÙ³³³ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ CODE_TYPE
*  NBW    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ³ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ WBSW
*  NSW    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


* Here, for example, dBARCODE uses the printer, port, passes, spacer and
* abort character from the previous line:

DO brcprint WITH "1040301221\0123456789\Code 2 of 5"
DO brcprint WITH "1040301332\0123456789\Interleaved Code 2 of 5"
DO brcprint WITH "1040302003\01234567890\UPC Code Version A"
DO brcprint WITH "1040302004\012345678900\EAN-13A"
DO brcprint WITH "1040301225\ABCDEFGHIJ\Code 93"
DO txtprint WITH "dBARCODE also can print condensed (half as wide) bar codes,"
DO txtprint WITH "although these usually print well only on a laser printer."
DO txtprint WITH ""
DO brcprint WITH "1040321220"+CHR(ASC(printer)+3)+"\dBARCODE\Code 39"


* Demonstrate various bar code height values

DO movedot
DO txtprint WITH 'You can print bar codes from 1/9" high to 1" high, in'
DO txtprint WITH 'increments of 1/9"'
DO txtprint WITH ""
DO brcprint WITH '1030101220'+printer+'\dBARCODE\Height = 1/9"'
DO brcprint WITH '10503\dBARCODE\Height = 3/9"'
DO brcprint WITH '10709\dBARCODE\Height = 9/9"'

* Demonstrate long bar codes

DO movedot
DO txtprint WITH "You can print bar codes up to 40 characters long:"
DO txtprint WITH ""
DO brcprint WITH "10302\0123456789 -.$/+%ABCDEFGHIJKLMNOPQRSTUVWXYZ"

DO newpage
DO txtprint WITH "dBARCODE does not issue form feeds, so you can always use the EJECT"
DO txtprint WITH "command or your printer's top of form button to get to the top"
DO txtprint WITH "of the next page."

* Demonstrate "lines to move" value

DO movedot
DO txtprint WITH 'The "lines to move" value determines the space from the top of '
DO txtprint WITH 'one barcode to the top of the next.  Lines are each 1/6".'
DO txtprint WITH ""
DO brcprint WITH '103024\dBARCODE\Lines value=3: 1/2" to next barcode'
DO brcprint WITH '106024\dBARCODE\Lines value=6: 1" to next barcode'
DO brcprint WITH "103020\dBARCODE\ "
* Demonstrate suppression of text beneath bar code

DO movedot
DO txtprint WITH "Text can be omitted under the barcode, for security or other reasons."
DO txtprint WITH ""
DO brcprint WITH "103021\dBARCODE\No text printed under barcode"
IF printer<>"1"
  DO txtprint WITH "You can select extended, normal or compressed description"
  DO txtprint WITH "to the right of the bar code."
  DO txtprint WITH ""
  DO brcprint WITH "103020\dBARCODE\Extended characters"
  DO brcprint WITH "103024\dBARCODE\Normal characters in description"
  DO brcprint WITH "103022\dBARCODE\Compressed characters in description"
ENDIF
DO txtprint WITH "dBARCODE gives you complete control over the widths of the bars"
DO txtprint WITH "and spaces.  The printer and bar code reader you use will "
DO txtprint WITH "determine which values work best for you.  Larger values "
DO txtprint WITH "produce bar codes which will copy well in a reducing copier."
DO txtprint WITH ""

* Demonstrate various bar and space widths

DO movedot
stylestr = "121122123223233234244245345355"
N=2
DO WHILE N<10
  NSTR=SUBSTR(STYLESTR,N*3+1,3)
  DO brcprint WITH "103020"+NSTR+"\dBARCODE"
  N=N+1
ENDDO

DO newpage

* Demonstrate very large bar code

DO movedot
DO txtprint WITH "dBARCODE will print very large bar codes:"
DO txtprint WITH ""
DO brcprint WITH "1080906;;\HUGE"
IF printer<>"1"
  DO movedot
  DO txtprint WITH "On dot matrix printers, dBARCODE will automatically"
  DO txtprint WITH "switch to narrow characters for the text underneath "
  DO txtprint WITH "the bar code if the bar code is narrower than the text."
  DO txtprint WITH ""
  DO brcprint WITH "1050303xx3\01234567890\UPC-A, wide type"
  DO brcprint WITH "1050302xx3\01234567890\UPC-A, narrow type"
ENDIF
* Demonstrate variable left margin

DO movedot
DO txtprint WITH "You can vary the margin to the left of the bar code."
DO txtprint WITH ""
DO brcprint WITH "1030201220\dBARCODE\No margin"
DO brcprint WITH "1038\dBARCODE\Small margin"
DO brcprint WITH "103@\dBARCODE\Medium margin"
DO brcprint WITH "103H\dBARCODE\Large margin"

* Demonstrate multiple passes (dot matrix printers only)

IF printer<>"1"
  DO movedot
  DO txtprint WITH "You can select the number of passes the printer makes, to"
  DO txtprint WITH "allow you to adjust for a weak ribbon."
  DO txtprint WITH ""
  DO brcprint WITH "1030201220010\dBARCODE\One pass"
  DO brcprint WITH "1030201220011\dBARCODE\Two passes"
  DO brcprint WITH "1040201220013\dBARCODE\Four passes"
ENDIF

DO newpage

* Demonstrate multiple bar codes on one line

DO movedot
DO txtprint WITH "Barcodes can be printed in columns across the page.  In this case,"
DO txtprint WITH "descriptions are not printed.  You can specify the number of"
DO txtprint WITH "columns.  This makes it easy to print forms with bar codes, or"
DO txtprint WITH "bar code menus for data entry."
DO txtprint WITH ""
DO brcprint WITH "1830201220"+printer+port+"0"+chr(20)+"\PASS    REJECT  REWORK  "
DO brcprint WITH "183020122\OIL LEAKBAD WELDAIR LEAK"
DO txtprint WITH "You can also vary the spacing between multiple bar codes:"
DO txtprint WITH ""

* Demonstrate variable spacing between multiple bar codes

DO movedot
DO brcprint WITH "1330201220"+printer+port+"0"+chr(16)+"\JANFEBMARAPRMAY"
DO brcprint WITH "1330201220"+printer+port+"0"+chr(30)+"\JUNJULAUGSEP"
DO brcprint WITH "1330201220"+printer+port+"0"+chr(58)+"\OCTNOVDEC"
DO brcprint WITH "1330201220"+printer+port+"0"+chr(30)+"\MONTUEWEDTHU"
DO brcprint WITH "1330201220"+printer+port+"0"+chr(16)+"\FRISATSUN012345"
IF printer = "0"
  DO txtprint WITH "+-----------------------------+"
  DO txtprint WITH "|  TimeKeeping Systems, Inc.  |"
  DO txtprint WITH "|    1306 East 55th Street    |"
  DO txtprint WITH "|   Cleveland, Ohio  44103    |"
  DO txtprint WITH "|      (216) 361-9995         |"
  DO txtprint WITH "+-----------------------------+"
ELSE
  DO txtprint WITH ""
  DO txtprint WITH "TimeKeeping Systems, Inc."
  DO txtprint WITH "1306 East 55th Street"
  DO txtprint WITH "Cleveland, Ohio  44103"
  DO txtprint WITH "(216) 361-9995"
  DO txtprint WITH ""
ENDIF
DO newpage
@ saverow,8 SAY " "
@ 23,0
IF  halt
  @ 23,5 SAY "User abort -- program halted."
ELSE
  @ 23,5 SAY "Demonstration complete."
ENDIF

SET DEVICE TO SCREEN
SET PROCEDURE TO

* When done, release the dBARCODE module

RELEASE dBARCODE
RELEASE ALL
