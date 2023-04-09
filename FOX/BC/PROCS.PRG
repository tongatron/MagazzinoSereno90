* Procedures used by DEMO.PRG

PROCEDURE brcprint
* This procedure prints the bar code and checks for a user abort
* The dBARCODE calling string is passed here already formed

  PARAMETERS callstring
  IF .not. halt

* For the Laser Jet use a carriage return to force the bar code
* to the far left edge

    IF printer = "1"
      SET DEVICE TO PRINT
      @ PROW(), PCOL() SAY CHR(13) + ' '
      SET DEVICE TO SCREEN
    ENDIF

* This command actually prints the bar code:
    CALL dBARCODE WITH callstring

* Now check if the user aborted printing (error letter "P")
    halt = SUBSTR(callstring,1,1) = 'P'
  ENDIF
RETURN


PROCEDURE txtprint
* This procedure handles text printing of one line

  PARAMETERS textstring

  IF .not. halt
    SET DEVICE TO PRINT
    @ row,1 SAY textstring
    row = PROW() + 1
    SET DEVICE TO SCREEN
  ENDIF
RETURN


PROCEDURE newpage
  IF .not. halt
    SET DEVICE TO PRINT
    EJECT
    row = PROW() + 1
    SET DEVICE TO SCREEN
  ENDIF
RETURN

PROCEDURE movedot
  IF .not. halt
    @ saverow,8 SAY " "
    @ ROW()+1,8 SAY "þ"
    saverow = ROW()
    @ 23,5 SAY "Press ESCAPE to abort printing"
  ENDIF
RETURN
