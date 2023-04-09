*BARPRINT.PRG version 1.3
*
*Modified to support dBARCODE version 1.3x additional specs features
*
*(C) Copyright 1986,1988 TimeKeeping Systems, Inc.
*
*     This program provides a simple manual entry routine and a
*     programming example for printing bar codes from a database
*     file.  It may be modified as desired by the user.  Notes
*     on modifying this program to work with your database are
*     included below.
*
SET CONFIRM ON
SET TALK OFF
IF ISCOLOR()
  SET COLOR TO W+/B, GR+/R, B
ELSE
  SET COLOR TO W/B, W+/B
ENDIF
CLEAR
LOAD dBARCODE
USE SPECSAVE
*
*     Set defaults
*
call_strng = error+format+lines+margin+height+text_+style+code_type+printer+;
  port+passes+spacer+chr(27)+"\"
logmarstrg = error+"04"+margin+"40"+style+"0"+printer+;
  port+passes+spacer+chr(27)+"\"
descr    = xdescr
desc_type= SUBSTR("EECCNN",VAL(text_)+1,1)
xcondensed = IIF(VAL(printer) > 2, "Y", "N")
columns  = xcolumns
codetype = VAL(code_type)
code_temp= code_type
DO CASE
  CASE codetype = 3
    nformat = 11
  CASE codetype = 4
    nformat = 12
  OTHERWISE
    nformat = VAL(format)
ENDCASE
DO WHILE .t.
  CLEAR
  @  2,20 SAY "BARPRINT.PRG -- Barcode printing program"
  @  3,18 SAY '(c) Copyright 1986,1988 TimeKeeping Systems, Inc.'
  @  5, 2 TO 15,77 double
  @  5,39 SAY chr(209)
  @  6,39 TO 15,39
  @ 15,39 SAY chr(207)
  @  7, 5 SAY "1.  Enter from Keyboard           ณ  2.  Print Parts Listing"
  @  9, 5 SAY "3.  Print Demo                    ณ  4.  Print LOGMARS Labels"
  @ 11, 5 SAY "5.  Change Setup                  ณ"
  STORE " " TO choice
  @ 17,20 SAY "Enter Choice Number or Q to Quit "
  @ 17,57 GET choice PICTURE "!"
  READ
  DO WHILE .NOT. choice$ "Q12345"
    @ 17,57 GET choice PICTURE "!"
    READ
  ENDDO
  CLEAR GETS
  @ 17,0
  IF choice = "Q"
    CLEAR ALL
    RELEASE dBARCODE
    RETURN
  ENDIF
****************************************************************************
*                                                                          *
*                     Menu choice 1 -- print from keyboard                 *
*                                                                          *
****************************************************************************
  IF choice = "1"
    code_  = SPACE(40)
    descr_ = SPACE(60)
    DO WHILE .t.
      @ 5,0 CLEAR
      code_ = SUBSTR(code_ + SPACE(40),1,40)
      IF columns = "1"
        IF .not. ISCOLOR()
          SET COLOR TO W/B, WU+/B
        ENDIF
        @ 7,20  SAY "Enter the code -- up to 40 characters"
        @ 9,20  SAY "Enter spaces to exit"
        @ 5,20  GET code_  PICTURE REPLICATE(IIF(code_temp $ "05","!","#"),40)
        READ
        IF code_ = SPACE(40)
          IF .not. ISCOLOR()
            SET COLOR TO W/B, W+/B
          ENDIF
          EXIT
        ENDIF
        code_  = TRIM(code_)
        desclength = MIN(80-LEN(code_),60)
        descr_ = SUBSTR(descr_ + SPACE(60),1,desclength)
        @ 13,20 SAY "Enter description -- up to " + LTRIM(STR(desclength)) +;
        " characters"
        @ 11,20  GET descr_ PICTURE REPLICATE("X",desclength)
        @ 15,20 SAY "Code plus description cannot exceed 80 characters"
        IF VAL(code_) <> 0
          @ 17,20 SAY "To increment the value, enter spaces"
        ENDIF
        READ
        IF .not. ISCOLOR()
          SET COLOR TO W/B, W+/B
        ENDIF
        descr_ = TRIM(descr_)
        @ 15,0 CLEAR
        IF VAL(code_) <> 0 .and. LEN(descr_) = 0
          ans = " "
          @ 15,20 SAY "Increment each code?"
          @ 15,59 GET ans PICTURE "!"
          READ
          DO WHILE .NOT. ans$ "YN"
            @ 15,52 GET ans PICTURE "!"
            READ
          ENDDO
          IF ans = "Y"
            codeval = VAL(code_)
            incval = 1
            finval = 0
            @ 17,20 SAY "Increment by:"
            @ 19,20 SAY "Final value: "
            @ 17,55 GET incval PICTURE "#####"
            @ 19,53 GET finval PICTURE "#######"
            READ
            DO WHILE finval <= codeval
              @ 21,20 SAY "Final value cannot be less than or equal to starting value"
              @ 19,53 GET finval PICTURE "#######"
              READ
            ENDDO
            @ 21,0
            leadspaces = 0
            DO WHILE leadspaces < 6
              IF SUBSTR(code_,leadspaces+1,1) <> " "
                EXIT
              ENDIF
              leadspaces = leadspaces + 1
            ENDDO
            DO WHILE codeval <= finval
              code_ = SPACE(leadspaces) + LTRIM(STR(codeval))
              @ 5,20  SAY code_
              q = TRIM(call_strng + code_)
              CALL dBARCODE WITH q
              codeval = codeval + incval
            ENDDO
          ELSE
            q = TRIM(call_strng + code_)
            CALL dBARCODE WITH q
          ENDIF
        ELSE
          q = TRIM(call_strng + code_ + "\" + descr_)
          CALL dBARCODE WITH q
        ENDIF
      ELSE
*           && columns = "1"
        IF .not. ISCOLOR()
          SET COLOR TO W/B, WU+/B
        ENDIF
        @ 7,20  SAY "Enter the codes -- up to " + STR(nformat,2) + " characters each"
        @ 9,20  SAY "Enter spaces for the first code to exit"
        scrcol = 1
        DO WHILE scrcol <= VAL(columns)
          code_x = "code_"+STR(scrcol,1)
          &code_x = SPACE(nformat)
          start_line = (80 - (nformat + 1) * VAL(columns))/2
          @ 5,(scrcol-1) * (nformat + 1) + start_line GET &code_x
          scrcol = scrcol + 1
        ENDDO
        IF columns = "1"
          code_2 = SPACE(nformat)
        ENDIF
        READ
        IF .not. ISCOLOR()
          SET COLOR TO W/B, W+/B
        ENDIF
        IF code_1 = SPACE(nformat)
          EXIT
        ENDIF
        @ 11,0 CLEAR
        IF VAL(code_1) <> 0 .and. code_2 = SPACE(nformat)
          ans = " "
          @ 11,20 SAY "Increment each code?"
          @ 11,59 GET ans PICTURE "!"
          READ
          DO WHILE .NOT. ans$ "YN"
            @ 11,52 GET ans PICTURE "!"
            READ
          ENDDO
          IF ans = "Y"
            codeval = VAL(code_1)
            incval = 1
            finval = 0
            @ 13,20 SAY "Increment by:"
            @ 15,20 SAY "Final value: "
            @ 13,55 GET incval PICTURE "#####"
            @ 15,53 GET finval PICTURE "#######"
            READ
            DO WHILE finval <= codeval
              @ 17,20 SAY "Final value cannot be less than or equal to starting value"
              @ 15,53 GET finval PICTURE "#######"
              READ
            ENDDO
            @ 17,0
            DO WHILE codeval <= finval
              scrcol = 1
              q = call_strng
              DO WHILE codeval <= finval .and. scrcol <= VAL(columns)
                code_x = "code_"+STR(scrcol,1)
                &code_x = SUBSTR(LTRIM(STR(codeval)) + SPACE(nformat),1,nformat)
                @ 5,(scrcol-1) * 10 + 1 SAY &code_x
                q = q + &code_x
                codeval = codeval + incval
                scrcol = scrcol + 1
              ENDDO
              CALL dBARCODE WITH q
            ENDDO
          ELSE
            q = call_strng
            scrcol = 1
            DO WHILE scrcol <= VAL(columns)
              code_x = "code_"+STR(scrcol,1)
              IF &code_x = SPACE(nformat)
                EXIT
              ENDIF
              q = q + &code_x
              scrcol = scrcol + 1
            ENDDO
            CALL dBARCODE WITH q
          ENDIF
        ELSE
*             && VAL(code_1) <> 0 .and. code_2 = SPACE(nformat)
          q = call_strng
          scrcol = 1
          DO WHILE scrcol <= VAL(columns)
            code_x = "code_"+STR(scrcol,1)
            IF &code_x = SPACE(nformat)
              EXIT
            ENDIF
            q = q + &code_x
            scrcol = scrcol + 1
          ENDDO
          CALL dBARCODE WITH q
        ENDIF
      ENDIF
     ENDDO
    CLEAR
  ENDIF
****************************************************************************
*                                                                          *
*                     Menu choice 2 -- print parts listing                 *
*                                                                          *
****************************************************************************

*
* This part of the program prints bar codes and descriptions from a sample
* file called PARTLIST.DBF.  It can be changed to print from your own
* database.  The changes you will need to make are noted.
*
*
  IF choice = "2"
*
*  Change the next line to USE your own database and index
*
    USE partlist INDEX partlist
    from = "      "
    to   = "      "
    @ 19,20 SAY "Enter range or ALL -- From            To"
    @ 19,47 GET from PICTURE "!!!!!!!!!!"
    @ 19,62 GET to   PICTURE "!!!!!!!!!!"
    READ
    DO WHILE to < from .and. TRIM(from) <> "ALL"
      @ 21,20 SAY "FROM cannot be greater than TO"
      @ 19,47 GET from PICTURE "!!!!!!!!!!"
      @ 19,62 GET to   PICTURE "!!!!!!!!!!"
      READ
    ENDDO
    @ 21,20
    IF TRIM(from) = "ALL"
      from = "      "
      to   = "zzzzzz"
      @ 19,42 SAY "     ALL                  "
    ENDIF
    GO TOP
    IF eof()
      ans = " "
      @ 17,0 CLEAR
*
*  Change the prompt from "part numbers" to whatever is in your file
*
      @ 17,20 SAY "There are no part numbers in the file"
      @ 19,20 SAY "Press RETURN to continue"
      @ 19,52 GET ans
      READ
      @ 17,0
      @ 19,0
      LOOP
    ENDIF
*
*  Instead of partnumber, use your own field name here
*
*  If your file uses a numeric variable, you will have to convert it
*  to a character variable so it can be compared with from and to
*
    DO WHILE partnumber < from .and. .not. eof()
      SKIP
    ENDDO
    IF eof()
      ans = " "
      @ 17,0 CLEAR
*
*  Change the words "part numbers" in the prompt
*
      @ 17,20 SAY "There are no part numbers in the file between "
      @ 19,20 SAY from+" and "+to+" -- Press RETURN to continue"
      @ 19,72 GET ans
      READ
      LOOP
    ENDIF
    IF SUBSTR(call_strng,2,1) = "0"
*
*  Instead of partnumber and description, use your own field names here
*
*  If your file uses numeric variables, you will have to convert them to
*  character variables so that they can be put into the character string q
*
*  Print a barcode with description
*
      DO WHILE partnumber <= to .and. .not. eof()
        @ 21,0
        @ 21,20 SAY partnumber
        @ 21,33 SAY descrption
        q = TRIM(call_strng + partnumber + "\" + descrption)
        CALL dBARCODE WITH q
        SKIP
      ENDDO
    ELSE
*
*  NOTE THAT FOR MULTIPLE BAR CODES ACROSS THE PAGE WE HAVE TO SET FORMAT
*  BECAUSE THE FIELD "PARTNUMBER" IS EIGHT CHARACTERS LONG
*  WE ALSO HAVE TO RE-FORM CALL_STRNG TO INCLUDE THE NEW FORMAT
*
*  Set myformat to the length of your field
*
      myformat = "8"
*     mystring = STUFF(call_strng,2,1,myformat)

*
*  Force the barcode to be printed in the right code type by inserting
*  the correct digit into mystring:  0 = Code 39, 1 = Code 2 of 5
*  2 = Interleaved Code 2 of 5, 3 = UPC Version A
*
*  Set mycode to the value of your code type
*
      mycode   = "0"
*     mystring = STUFF(mystring,10,1,mycode)
* changed to work with clipper:
**      mystring = error+myformat+lines+margin+height+text_+style+;
**                 mycode+printer+port+passes+spacer+chr(27)+"\"
      mystring = SUBSTR(call_strng,1,1) + myformat + SUBSTR(call_strng,3,7);
                 + mycode + SUBSTR(call_strng,11,4) + CHR(27) + "\"
*
*  Instead of partnumber and description, use your own field names here
*
*  If your file uses numeric variables, you will have to convert them to
*  character variables so that they can be put into the character string q
*
*  Print multiple bar codes across the page
*
      DO WHILE partnumber <= to .and. .not. eof()
        counter = 0
        code_ = ""
        DO WHILE counter < VAL(columns) .and. partnumber <= to .and. .not. eof()
          counter = counter + 1
          code_ = code_ + partnumber
          SKIP
        ENDDO
        @ 21,0
        @ 21,20 SAY code_
        q = mystring + code_
        CALL dBARCODE WITH q
        IF eof()
          exit
        ENDIF
      ENDDO
    ENDIF
    @ 19,0
    @ 21,0
    USE
  ENDIF
****************************************************************************
*                                                                          *
*                          Menu choice 3 -- print demo                     *
*                                                                          *
****************************************************************************
  IF choice = "3"
    DO DEMO
    LOAD dBARCODE
  ENDIF
****************************************************************************
*                                                                          *
*                      Menu choice 4 -- print LOGMARS labels               *
*                                                                          *
****************************************************************************
*
* You can modify this section as desired to handle any special label or
* forms printing requirements you may have
*
  IF choice = "4"
    code_  = SPACE(20)
    line1  = SPACE(30)
    line2  = SPACE(30)
    line3  = SPACE(30)
    line4  = SPACE(30)
    line5  = SPACE(30)
    line6  = SPACE(30)
    DO WHILE .t.
      @ 5,0 CLEAR
      @ 5,5 SAY "Print LOGMARS Labels"
      code_ = SUBSTR(code_ + SPACE(20),1,20)
      IF .not. ISCOLOR()
        SET COLOR TO W/B, WU+/B
      ENDIF
      @  7,5  SAY "Enter the bar code -- up to 20 characters"
      @  9,5  SAY "Enter spaces to exit"
      @ 11,5  SAY "Description line 1 -- up to 30 characters"
      @ 13,5  SAY "Description line 2 -- up to 30 characters"
      @ 15,5  SAY "Description line 3 -- up to 30 characters"
      @ 17,5  SAY "Description line 4 -- up to 30 characters"
      @ 19,5  SAY "Description line 5 -- up to 30 characters"
      @ 21,5  SAY "Description line 6 -- up to 30 characters"
      ans = " "
      DO WHILE .NOT. ans = "N"
        @  7,48  GET code_  PICTURE REPLICATE("!",20)
        READ
        IF code_ = SPACE(20)
          EXIT
        ENDIF
        @ 11,48  GET line1  PICTURE REPLICATE("X",30)
        @ 13,48  GET line2  PICTURE REPLICATE("X",30)
        @ 15,48  GET line3  PICTURE REPLICATE("X",30)
        @ 17,48  GET line4  PICTURE REPLICATE("X",30)
        @ 19,48  GET line5  PICTURE REPLICATE("X",30)
        @ 21,48  GET line6  PICTURE REPLICATE("X",30)
        READ
        ans = " "
        @ 23,20 SAY "Any Change ? (Yes / No ) ออออ"
        @ 23,52 GET ans PICTURE "!"
        READ
        DO WHILE .NOT. ans$ "YN"
          @ 23,52 GET ans PICTURE "!"
          READ
        ENDDO
      ENDDO
      IF code_ = SPACE(20)
        EXIT
      ENDIF
      copies = 0
      @ 23,0
      @ 23,20 SAY "How many copies? ออออ"
      @ 23,52 GET copies PICTURE "#"
      READ
      IF .not. ISCOLOR()
        SET COLOR TO W/B, W+/B
      ENDIF
      SET DEVICE TO PRINT
      DO WHILE copies > 0
        code_  = TRIM(code_)
        q = TRIM(logmarstrg + code_)
        CALL dBARCODE WITH q
        ROW = PROW()
        @ ROW+1,1 SAY line1
        @ ROW+2,1 SAY line2
        @ ROW+3,1 SAY line3
        @ ROW+4,1 SAY line4
        @ ROW+5,1 SAY line5
        @ ROW+6,1 SAY line6
        @ ROW+7,1 SAY CHR(10)
        copies = copies - 1
      ENDDO
      SET DEVICE TO SCREEN
    ENDDO
  ENDIF
****************************************************************************
*                                                                          *
*                        Menu choice 5 -- change setup                     *
*                                                                          *
****************************************************************************
  IF choice = "5"
    CLEAR
    USE SPECSAVE
    STORE " " TO ans
    * use the non-condensed printer value here
    IF .not. printer $ "012"
      REPLACE printer WITH STR(VAL(printer) - 3,1)
    ENDIF
    DO WHILE .NOT. ans = "N"
      @  0,18 to 22,54
      @  0,26 SAY " Barcode Formatting "
      @  2,20 SAY "Margin อออออออออออออออออออออ"
      @  2,51 SAY xmargin PICTURE "99"
      @  3,20 SAY 'Barcode Height (1/9") ออออออ'
      @  3,52 SAY height
      @  4,20 SAY 'Lines to Move (1/6") อออออออ'
      @  4,52 SAY lines
      @  5,20 SAY "Print Text (Y/N) อออออออออออ"
      @  5,52 SAY xtext
      @  6,20 SAY "Barcode Style ออออออออออออออ"
      @  6,52 SAY xstyle
      @  7,20 SAY "Print Description (Y/N) ออออ"
      @  7,52 SAY xdescr
      @  8,20 SAY "Description Type (C/N/E) อออ"
      @  8,52 SAY desc_type
      @  9,20 SAY "Barcode Type (0 - 4) อออออออ"
      @  9,52 SAY code_type
      @ 11,18 SAY "รฤฤฤฤฤฤ Multi-Column Printing ฤฤฤฤฤฤด"
      @ 12,20 SAY "Number of Barcodes Across ออ"
      @ 12,52 SAY xcolumns
      @ 13,20 SAY "Characters per Column ออออออ"
      @ 13,52 SAY format
      @ 14,20 SAY "Column Spacing (0 - 255) อออ"
      @ 14,50 SAY xspacer PICTURE "###"
      @ 16,18 SAY "รฤฤฤฤฤฤฤฤฤ Printer Setup ฤฤฤฤฤฤฤฤฤฤฤด"
      @ 17,20 SAY "Printer Type (0 - 2) อออออออ"
      @ 17,52 SAY printer
      @ 18,20 SAY "Condensed Bar Codes (Y/N) ออ"
      @ 18,52 SAY xcondensed
      @ 19,20 SAY "Passes อออออออออออออออออออออ"
      @ 19,52 SAY xpasses
      @ 20,20 SAY "Printer Port (0 - 3) อออออออ"
      @ 20,52 SAY port


      IF ans <> "N"
        CLEAR GETS
      ENDIF
      ans = " "
      @ 23,20 SAY "Any Change ? (Yes / No) ออออ"
      @ 23,52 GET ans PICTURE "!"
      READ
      DO WHILE .NOT. ans$ "YN"
        @ 23,52 GET ans PICTURE "!"
        READ
      ENDDO
      IF ans = "Y"
        @ 23,0
        @  2,51 GET xmargin   PICTURE "99"
        @  3,52 GET height    PICTURE "#"
        @  4,52 GET lines     PICTURE "#"
        @  5,52 GET xtext     PICTURE "!"
        @  6,52 GET xstyle    PICTURE "#"
        @  7,52 GET xdescr    PICTURE "!"
        @  8,52 GET desc_type PICTURE "!"
        @  9,52 GET code_type PICTURE "#"
        @ 12,52 GET xcolumns  PICTURE "#"
        @ 13,52 GET format   PICTURE "#"
        @ 14,50 GET xspacer  PICTURE "999"
        @ 17,52 GET printer   PICTURE "#"
        @ 18,52 GET xcondensed PICTURE "!"
        @ 19,52 GET xpasses    PICTURE "9"
        @ 20,52 GET port      PICTURE "9"
        READ

* check for illegal bar code height value
        DO WHILE VAL(height) = 0
          @ 23,0
          @  3,55 SAY "Cannot be 0"
          @  3,52 GET height PICTURE "#"
          READ
          @  3,55
        ENDDO

* check for illegal lines value
        DO WHILE VAL(lines) = 0
          @ 23,0
          @  4,55 SAY "Cannot be 0"
          @  4,52 GET lines PICTURE "#"
          READ
          @  4,55
        ENDDO

* check for illegal text value (not Y or N)
        DO WHILE .NOT. xtext$ "YN"
          @ 23,0
          @  5,55 SAY "Enter Y or N"
          @  5,52 GET xtext PICTURE "!"
          READ
          @ 5,55
        ENDDO

* check for illegal description value (not Y or N)
        DO WHILE .NOT. xdescr$ "YN"
          @ 23,0
          @  7,55 SAY "Enter Y or N"
          @  7,52 GET xdescr PICTURE "!"
          READ
          @  7,55
        ENDDO

* check for description requested with multiple columns
        DO WHILE (xdescr= "Y" .and. VAL(xcolumns) > 1) .or. .not. xdescr $ "YN"
          @ 23,0
          @  7,55 SAY "No description allowed"
          @ 12,55 SAY "with multiple columns"
          @  7,52 GET xdescr PICTURE "!"
          @ 12,52 GET xcolumns PICTURE "#"
          READ
          @  7,55
          @ 12,55
        ENDDO
        REPLACE xcolumns WITH IIF(xdescr="Y","1",xcolumns)
        @ 12,52 SAY xcolumns

* check for illegal desc_type value (not Y or N)
        IF printer = "1"
          desc_type = "N"
        ELSE
          DO WHILE .NOT. desc_type$ "CNE"
            @ 23,0
            @  6,56 SAY   "ฺ Select one"
            @  7,56 SAY   "ณ C - Condensed"
            @  8,54 SAY "ฤฤด N - Normal"
            @  9,56 SAY   "ภ E - Expanded"
            @  8,52 GET desc_type PICTURE "!"
            READ
            @  6,56
            @  7,56
            @  8,54 SAY "ณ                         "
            @  9,56
          ENDDO
        ENDIF

* check for illegal bar code type choice
        DO WHILE VAL(code_type) > 5
          @ 23,0
          @  6,56 SAY   "ฺ Select one"
          @  7,56 SAY   "ณ 0-Code 39"
          @  8,56 SAY   "ณ 1-Code 2 of 5"
          @  9,54 SAY "ฤฤด 2-Interleaved 2 of 5"
          @ 10,56 SAY   "ณ 3-UPC Code Version A"
          @ 11,56 SAY   "ณ 4-EAN-13"
          @ 12,56 SAY   "ภ 5-Code 93"
          @  9,52 GET code_type PICTURE "#"
          READ
          @  6,56
          @  7,56
          @  8,56
          @  9,54 SAY "ณ                         "
          @ 10,56
          @ 11,56
          @ 12,56
        ENDDO

* check for values larger than space for prompts
        DO WHILE (VAL(format) + 1) * VAL(xcolumns) >80
*           too big to prompt on 1 line
          @ 23,0
          @ 12,55 SAY "Choose smaller values"
          @ 13,55 SAY "Choose smaller values"
          @ 12,52 GET xcolumns PICTURE "#"
          @ 13,52 GET format PICTURE "#"
          READ
          @ 12,55
          @ 13,55
        ENDDO

* check for illegal number of columns
        DO WHILE xcolumns = "0" .or. VAL(xcolumns) > 8
          @ 23,0
          @ 12,55 SAY "Must be between 1 and 8"
          @ 12,52 GET xcolumns PICTURE "#"
          READ
          @ 12,55
        ENDDO
        REPLACE format WITH IIF(xcolumns = "1", "0", format)
        REPLACE format WITH IIF(VAL(xcolumns) > 1 .and. code_type $ "34","1",format)
        @ 13,52 SAY format PICTURE "#"

* check for no characters per column value
        IF VAL(xcolumns) > 1 .and. VAL(format) = 0 .and. .not. code_type $ "34"
          @ 23,0
          @ 13,55 SAY "Enter Characters/Column"
          @ 13,52 GET format PICTURE "#"
          READ
          @ 13,55
        ENDIF
        DO WHILE VAL(xcolumns) > 1 .and. VAL(format) = 0 .and. .not. code_type $ "34"
          @ 23,0
          @ 13,55 SAY "Must be between 1 and 9"
          @ 13,52 GET format PICTURE "#"
          READ
          @ 13,55
        ENDDO

* check for illegal spacer value
        DO WHILE VAL(xspacer) > 255
          @ 23,0
          @ 14,55 SAY "Must be between 0 and 255"
          @ 14,50 GET xspacer PICTURE "999"
          READ
          @ 14,55
        ENDDO

* check for illegal passes value
        DO WHILE xpasses = "0" .or. VAL(xpasses) > 9
          @ 23,0
          @ 19,55 SAY "Must be between 1 and 9"
          @ 19,52 GET xpasses PICTURE "9"
          READ
          @ 19,55
        ENDDO

* check for illegal printer type
        DO WHILE .not. printer $ '012'
          @ 23,0
          @ 15,56 SAY   "ฺ  Select one"
          @ 16,56 SAY   "ณ  0 - IBM Dot Matrix"
          @ 17,54 SAY "ฤฤด  1 - HP Laser Jet"
          @ 18,56 SAY   "ภ  2 - 24 Pin Dot Matrix"
          @ 17,52 GET printer PICTURE "#"
          READ
          @ 15,56
          @ 16,56
          @ 17,54 SAY "ณ                      "
          @ 18,56
        ENDDO

* check for illegal xcondensed value (not Y or N)
        DO WHILE .NOT. xcondensed $ "YN"
          @ 23,0
          @ 18,55 SAY "Enter Y or N"
          @ 18,52 GET xcondensed PICTURE "!"
          READ
          @ 18,55
        ENDDO

* check for illegal port value
        DO WHILE VAL(port) > 3
          @ 23,0
          @ 18,56 SAY   "ฺ  Select one"
          @ 19,56 SAY   "ณ  0 - DOS Default"
          @ 20,54 SAY "ฤฤด  1 - LPT1:"
          @ 21,56 SAY   "ณ  2 - LPT2:"
          @ 22,56 SAY   "ภ  3 - LPT3:"
          @ 20,52 GET port PICTURE "#"
          READ
          @ 18,56
          @ 19,56
          @ 20,54 SAY "ณ             "
          @ 21,56
          @ 22,56
        ENDDO

      ELSE
        CLEAR
      ENDIF
    ENDDO

* store the new values in the SPECSAVE database
    IF xcondensed = "Y"
      REPLACE printer WITH STR(VAL(printer) + 3,1)
    ENDIF
    stylestr = "121122123223233234244245345355"

    REPLACE text_  WITH STR((AT(desc_type,'ECN')-1)*2 + IIF(xtext = "Y",0,1),1)
    REPLACE style  WITH SUBSTR(stylestr,VAL(xstyle)*3+1,3)
    REPLACE margin WITH CHR(48 + VAL(xmargin) )
    REPLACE spacer WITH CHR(VAL(xspacer))
    REPLACE passes WITH STR(VAL(xpasses)-1,1)
    descr   = xdescr
    columns = xcolumns
    codetype = VAL(code_type)
    code_temp = code_type
    DO CASE
      CASE codetype = 3
        nformat = 11
      CASE codetype = 4
        nformat = 12
      OTHERWISE
        nformat = VAL(format)
    ENDCASE

* re-form the SPECS strings used in this program
    call_strng = error+format+lines+margin+height+text_+style+code_type+;
      printer+port+passes+spacer+chr(27)+"\"
    logmarstrg = error+"04"+margin+"40"+style+"0"+;
      printer+port+passes+spacer+chr(27)+"\"
    USE
  ENDIF

ENDDO
return
*********************************
**   BARPRINT.PRG Version 1.3  **
*********************************


