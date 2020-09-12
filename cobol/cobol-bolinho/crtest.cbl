       IDENTIFICATION DIVISION.
       PROGRAM-ID.     CRTEST.

           THIS PROGRAM TESTS THE FUNCTIONS OF THE
           CRT DRIVERS USED WITH MS-COBOL.

           UPDATED 10.9.83 LN
           UPDATED 5.21.84 BZ

       AUTHOR.         MICROSOFT.
       DATE-WRITTEN.   15 FEBRUARY 1983
       SECURITY.       NONE.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ACCEPT-FIELDS.
           03  IN-FIELD         PIC X(6).
           03  IN-CHAR          PIC X.
           03  WAIT-CHAR        PIC X.
           03  COLOR-CHAR       PIC X  VALUE 'N'.
               88  NO-COLOR            VALUE 'N', 'n'.
	   03  ESC-CODE         PIC 99.

       SCREEN SECTION.

       01  CLEAR-SCREEN.
           03  BLANK SCREEN.

       01  BLINK-SCREEN.
           03  BLANK SCREEN
                   VALUE "SCREEN ATTRIBUTE TEST.".
           03  LINE 3 HIGHLIGHT
                   VALUE "THIS MESSAGE SHOULD BE HIGHLIGHTED.".
           03  LINE 4 BLINK    
                   VALUE "THIS MESSAGE SHOULD BLINK.".
           03  LINE 5 REVERSE-VIDEO
                   VALUE "THIS MESSAGE SHOULD BE IN REVERSE-VIDEO.".
           03  LINE 6 UNDERLINE
                   VALUE "THIS MESSAGE SHOULD BE UNDERLINED.".
           03  LINE 7
                   VALUE "THIS MESSAGE SHOULD BE IN NORMAL VIDEO.".

       01  BLANK-LINE-SCREEN.
           03  LINE 10  PIC X(80) FROM ALL "X".
           03  LINE 11  PIC X(80) FROM ALL "X".
           03  LINE 12  PIC X(80) FROM ALL "X".
           03  LINE 13  PIC X(80) FROM ALL "X".
           03  LINE 14  PIC X(80) FROM ALL "X".

           03  LINE 11 COLUMN 20 BLANK LINE
                   VALUE "B".
           03  LINE 12 COLUMN 40 BLANK LINE
                   VALUE "B".
           03  LINE 13 COLUMN 60 BLANK LINE
                   VALUE "B".
           03  LINE 16 BLANK LINE.

       01  DEFAULT-SCREEN.
           03  BLANK SCREEN FOREGROUND-COLOR 7 BACKGROUND-COLOR 0.

       01  REVERSE-SCREEN.
           03  BLANK SCREEN FOREGROUND-COLOR 0 BACKGROUND-COLOR 7.

       01  NEW-COLOR-SCREEN.
           03  BLANK SCREEN FOREGROUND-COLOR 2 BACKGROUND-COLOR 1.

       01  COLOR-SCREEN.
           03  "COBOL WITH COLOR FROM MICROSOFT".
           03  LINE 2 COLUMN 2 "REV-VIDEO" REVERSE-VIDEO.
           03  LINE 2 COLUMN 25 "HIGHLIGHT" HIGHLIGHT.
           03  LINE 2 COLUMN 55 "BLINKING " BLINK.
           03  LINE 3 COLUMN 5 "FOREGD  0" FOREGROUND-COLOR 0.
           03  LINE 4 COLUMN 6 "FOREGD  1" FOREGROUND-COLOR 1.
           03  LINE 5 COLUMN 7 "FOREGD  2" FOREGROUND-COLOR 2.
           03  LINE 6 COLUMN 8 "FOREGD  3" FOREGROUND-COLOR 3.
           03  LINE 7 COLUMN 9 "FOREGD  4" FOREGROUND-COLOR 4.
           03  LINE 8 COLUMN 10 "FOREGD  5" FOREGROUND-COLOR 5.
           03  LINE 9 COLUMN 11 "FOREGD  6" FOREGROUND-COLOR 6.
           03  LINE 10 COLUMN 12 "FOREGD  7" FOREGROUND-COLOR 7.
           03  LINE 11 COLUMN 13 "FOREGD  8" FOREGROUND-COLOR 8.
           03  LINE 12 COLUMN 14 "FOREGD  9" FOREGROUND-COLOR 9.
           03  LINE 13 COLUMN 15 "FOREGD 10" FOREGROUND-COLOR 10.
           03  LINE 14 COLUMN 16 "FOREGD 11" FOREGROUND-COLOR 11.
           03  LINE 15 COLUMN 17 "FOREGD 12" FOREGROUND-COLOR 12.
           03  LINE 16 COLUMN 18 "FOREGD 13" FOREGROUND-COLOR 13.
           03  LINE 17 COLUMN 19 "FOREGD 14" FOREGROUND-COLOR 14.
           03  LINE 18 COLUMN 20 "FOREGD 15" FOREGROUND-COLOR 15.

           03  LINE 3 COLUMN 25 "BACKGD  0" BACKGROUND-COLOR 0.
           03  LINE 4 COLUMN 26 "BACKGD  1" BACKGROUND-COLOR 1.
           03  LINE 5 COLUMN 27 "BACKGD  2" BACKGROUND-COLOR 2.
           03  LINE 6 COLUMN 28 "BACKGD  3" BACKGROUND-COLOR 3.
           03  LINE 7 COLUMN 29 "BACKGD  4" BACKGROUND-COLOR 4.
           03  LINE 8 COLUMN 30 "BACKGD  5" BACKGROUND-COLOR 5.
           03  LINE 9 COLUMN 31 "BACKGD  6" BACKGROUND-COLOR 6.
           03  LINE 10 COLUMN 32 "BACKGD  7" BACKGROUND-COLOR 7.
           03  LINE 11 COLUMN 33 "BACKGD  8" BACKGROUND-COLOR 8.
           03  LINE 12 COLUMN 34 "BACKGD  9" BACKGROUND-COLOR 9.
           03  LINE 13 COLUMN 35 "BACKGD 10" BACKGROUND-COLOR 10.
           03  LINE 14 COLUMN 36 "BACKGD 11" BACKGROUND-COLOR 11.
           03  LINE 15 COLUMN 37 "BACKGD 12" BACKGROUND-COLOR 12.
           03  LINE 16 COLUMN 38 "BACKGD 13" BACKGROUND-COLOR 13.
           03  LINE 17 COLUMN 39 "BACKGD 14" BACKGROUND-COLOR 14.
           03  LINE 18 COLUMN 40 "BACKGD 15" BACKGROUND-COLOR 15.

           03  LINE 19 COLUMN 3 "FORE 0 BACK 4"
		FOREGROUND-COLOR 0 BACKGROUND-COLOR 4.
           03  LINE 20 COLUMN 3 "FORE 1 BACK 5"
		FOREGROUND-COLOR 1 BACKGROUND-COLOR 5.
           03  LINE 21 COLUMN 3 "FORE 2 BACK 6"
		FOREGROUND-COLOR 2 BACKGROUND-COLOR 6.
           03  LINE 22 COLUMN 3 "FORE 3 BACK 7"
		FOREGROUND-COLOR 3 BACKGROUND-COLOR 7.

           03  LINE 19 COLUMN 23 "FORE 0 BACK 4 BLINK RV"
                BLINK REVERSE-VIDEO
		FOREGROUND-COLOR 0 BACKGROUND-COLOR 4.
           03  LINE 20 COLUMN 23 "FORE 1 BACK 5 BLINK RV"
                BLINK REVERSE-VIDEO
		FOREGROUND-COLOR 1 BACKGROUND-COLOR 5.
           03  LINE 21 COLUMN 23 "FORE 2 BACK 6 BLINK RV"
                BLINK REVERSE-VIDEO
		FOREGROUND-COLOR 2 BACKGROUND-COLOR 6.
           03  LINE 22 COLUMN 23 "FORE 3 BACK 7 BLINK RV"     
                BLINK REVERSE-VIDEO
		FOREGROUND-COLOR 3 BACKGROUND-COLOR 7.

           03  LINE 19 COLUMN 55 "FORE 8 BACK 12 "
		FOREGROUND-COLOR 8 BACKGROUND-COLOR 12.
           03  LINE 20 COLUMN 55 "FORE 9 BACK 13 "
		FOREGROUND-COLOR 9 BACKGROUND-COLOR 13.
           03  LINE 21 COLUMN 55 "FORE 10 BACK 14"
		FOREGROUND-COLOR 10 BACKGROUND-COLOR 14.
           03  LINE 22 COLUMN 55 "FORE 11 BACK 15"
		FOREGROUND-COLOR 11 BACKGROUND-COLOR 15.

           03  LINE 14 COLUMN 55 "FORE 12 BACK 4"
		FOREGROUND-COLOR 12 BACKGROUND-COLOR 4.
           03  LINE 15 COLUMN 55 "FORE 13 BACK 5"
		FOREGROUND-COLOR 13 BACKGROUND-COLOR 5.
           03  LINE 16 COLUMN 55 "FORE 14 BACK 6"
		FOREGROUND-COLOR 14 BACKGROUND-COLOR 6.
           03  LINE 17 COLUMN 55 "FORE 15 BACK 7"
		FOREGROUND-COLOR 15 BACKGROUND-COLOR 7.

           03  LINE 19 COLUMN 76 "U.L. " UNDERLINE
		FOREGROUND-COLOR 0 BACKGROUND-COLOR 4.
           03  LINE 20 COLUMN 76 "R.V. " REVERSE-VIDEO
		FOREGROUND-COLOR 1 BACKGROUND-COLOR 5.
           03  LINE 21 COLUMN 76 "HIGH " HIGHLIGHT
		FOREGROUND-COLOR 2 BACKGROUND-COLOR 6.
           03  LINE 22 COLUMN 76 "HI RV"
		HIGHLIGHT REVERSE-VIDEO
		FOREGROUND-COLOR 3 BACKGROUND-COLOR 7.

       PROCEDURE DIVISION.
       MAIN.
           PERFORM INITIAL-SCREEN.
           PERFORM ERASE-TEST.
           PERFORM POSITION-TEST.
           PERFORM TERMINATOR-TEST.
           PERFORM EDIT-TEST.
           PERFORM ALARM-TEST.
           PERFORM BLINK-TEST.
           PERFORM BLANK-LINE-TEST.
           PERFORM COLOR-TEST.
           DISPLAY (22, 1) "END OF TESTS.".
           DISPLAY " ".

           STOP RUN.

       INITIAL-SCREEN.
           DISPLAY (1, 1) ERASE.
           DISPLAY "1.  THIS PROGRAM TESTS THE CRT DRIVER.".
           DISPLAY "2.  IF YOUR TERMINAL HAS THE ABILITY TO"
           DISPLAY "3.  TURN THE CURSOR ON AND OFF, THEN"
           DISPLAY "4.  YOU SHOULD SEE THE CURSOR STAY ON"
           DISPLAY "5.  THE SCREEN ONLY WHEN ASKED TO ENTER"
           DISPLAY "6.  DATA."
           DISPLAY "7.".
           DISPLAY "8.  A 24 BY 80 DISPLAY IS ASSUMED.".
           DISPLAY "9.".



       ERASE-TEST.
           DISPLAY "10. *****************************************".
           DISPLAY "11.".
           DISPLAY "12. CURSOR POSITION AND ERASE TEST.".
           DISPLAY "13. FIRST, LINES 12-24 OF THE".
           DISPLAY "14. SCREEN SHOULD BE ERASED. THEN"
           DISPLAY "15. THE CURSOR SHOULD HOME (TO THE"
           DISPLAY "16. TOP LEFT CORNER) AND THE FULL"
           DISPLAY "17. SCREEN SHOULD BE ERASED."

           DISPLAY "18.".
           DISPLAY "19. TYPE ANY CHARACTER TO CONTINUE.".
           ACCEPT (, ) WAIT-CHAR  WITH AUTO-SKIP.
           MOVE 12 TO LIN.
           MOVE 1  TO COL.
           DISPLAY (LIN,  COL) ERASE.
           PERFORM WAIT-FOR-INPUT.  
           MOVE 1 TO LIN.
           DISPLAY (LIN,  COL) ERASE.

           PERFORM WAIT-FOR-INPUT.




       POSITION-TEST.
           DISPLAY ( 1,  1) ERASE.
           DISPLAY ( 1,  1) "GENERAL CURSOR POSITION TEST.".
           DISPLAY ( 2,  1) "THIS TEST DISPLAYS TEXT IN THE"
           DISPLAY ( 3,  1) "POSITIONS DESCRIBED BY THE"
           DISPLAY ( 4,  1) "TEXT ITSELF."

           PERFORM WAIT-FOR-INPUT.  

           MOVE 1  TO LIN.
           DISPLAY (LIN,  1) ERASE.
           DISPLAY (LIN,  1) "TOP LEFT CORNER".
           DISPLAY (24, 61) "BOTTOM RIGHT CORNER".
           DISPLAY ( 1, 65) "TOP RIGHT CORNER".
           DISPLAY (24,  1) "BOTTOM LEFT CORNER".
           MOVE 28 TO COL.
           DISPLAY (12, COL + 2) "CENTER (MORE OR LESS)".
           DISPLAY (LIN, 35) "TOP CENTER".
           DISPLAY (24, 34) "BOTTOM CENTER".
           DISPLAY (12,  1) "LEFT CENTER".
           MOVE 10  TO LIN.
           MOVE 70 TO COL.
           DISPLAY (LIN + 2, COL - 1) "RIGHT CENTER".

           PERFORM WAIT-FOR-INPUT.




       TERMINATOR-TEST.
           DISPLAY (1, 1) ERASE
                   "TERMINATOR KEY TEST.".

           DISPLAY (3, 1) "THIS TESTS WHETHER THE TERMINATOR "
                          "AND FUNCTION KEYS ARE RECOGNIZED CORRECTLY.".

           DISPLAY (5, 1) "EACH TIME THE PROMPT IS GIVEN, ENTER "
                          "ONE OF THE TERMINATOR OR FUNCTION KEYS".
           DISPLAY (6, 5) "SUCH AS RETURN, TAB, ESC, OR BACK TAB,".
           DISPLAY (7, 5) "DESCRIBED IN THE MS-COBOL USERS' GUIDE.".
           DISPLAY (8, 1) "THIS PROGRAM WILL RESPOND WITH THE "
                          "ESCAPE CODE FOR THAT KEY.".

           DISPLAY (10, 1) "THE TEST WILL TERMINATE WHEN YOU ENTER "
                          "ANY NON-SPACE KEY BEFORE THE TERMINATOR.".

           MOVE SPACE TO IN-CHAR.
           PERFORM GET-TERMINATOR
               UNTIL IN-CHAR NOT = SPACE.

       GET-TERMINATOR.
           DISPLAY (13, 1) ERASE.
           DISPLAY (12, 1) "ENTER TERMINATOR KEY: ".
           ACCEPT (, ) IN-CHAR WITH PROMPT.
           ACCEPT ESC-CODE FROM ESCAPE KEY.
           DISPLAY (13, 1) "ESCAPE CODE IS " ESC-CODE.
           PERFORM WAIT-FOR-INPUT.  





       EDIT-TEST.
           DISPLAY (1, 1) ERASE
                          "EDIT KEY TEST.".

           DISPLAY (3, 1) "THE FOLLOWING ABBREVIATIONS ARE USED "
                          "TO REPRESENT THE EDITING KEYS:".
           DISPLAY (5, 10) "[LD] = LINE (FIELD) DELETE KEY"
                   (6, 10) "[CD] = CHARACTER DELETE KEY"
                   (7, 10) "[BS] = BACKSPACE KEY"
                   (8, 10) "[FS] = FORWARD SPACE KEY".

           DISPLAY (10, 1) "THE MS-COBOL USERS' GUIDE DESCRIBES "
                            "WHICH TERMINAL KEYS PERFORM ".
           DISPLAY (11, 1) "THESE EDITING FUNCTIONS.".
           MOVE SPACE TO IN-CHAR.
           PERFORM GET-EDIT-FIELD 
               UNTIL IN-CHAR NOT = SPACE.

       GET-EDIT-FIELD.

           DISPLAY (13, 1) ERASE
                           "ENTER ABCDE[LD]+-XXX[CD]"
                           "[BS][BS]W[FS]YZ    ".

           MOVE SPACES TO IN-FIELD.
           ACCEPT (, ) IN-FIELD.
           IF  IN-FIELD NOT = "+-WXYZ"
               DISPLAY (15, 1) "*** RESULT WAS " IN-FIELD
               DISPLAY (16, 1) "SHOULD HAVE BEEN +-WXYZ"
           ELSE DISPLAY (15, 1) "RESULT WAS CORRECT.".

           DISPLAY (18, 1) "THIS TEST WILL TERMINATE WHEN YOU ENTER "
                          "ANY NON-SPACE KEY HERE.".

           ACCEPT (, ) IN-CHAR WITH PROMPT.
           IF IN-CHAR NOT = SPACE
                PERFORM WAIT-FOR-INPUT.



       ALARM-TEST.
           DISPLAY (1, 1) ERASE "ALARM ($ALARM) TEST.".

           DISPLAY (3, 1) "THE AUDIBLE TONE SHOULD SOUND "
                          "WHEN THIS MESSAGE IS PRINTED.".

           DISPLAY (5, 1) "TYPE ANY CHARACTER TO CONTINUE.".

           ACCEPT (, ) WAIT-CHAR  WITH AUTO-SKIP BEEP.




       BLINK-TEST.
           DISPLAY BLINK-SCREEN.
           PERFORM WAIT-FOR-INPUT.





       BLANK-LINE-TEST.
           DISPLAY (1, 1) ERASE "BLANK LINE ($EOL) TEST.".

           DISPLAY (3, 1) "LINES 10-14 WILL BE FILLED WITH X.".
           DISPLAY (4, 1) "THEN LINES 11-13 SHOULD BE BLANKED "
                          "FOLLOWING THE 'B' CHARACTER.".

           DISPLAY BLANK-LINE-SCREEN.
           PERFORM WAIT-FOR-INPUT.


       COLOR-TEST.
           DISPLAY (1, 1) ERASE "COLOR TEST.".

           DISPLAY (3, 1) "THESE TESTS WILL DISPLAY TEXT WITH A".
           DISPLAY (4, 1) "VARIETY OF FOREGROUND AND BACKGROUND".
           DISPLAY (5, 1) "COLORS. THE INTEGERS USED TO PRODUCE".
           DISPLAY (6, 1) "THE COLORS ARE INDICATED BY THE TEXT.".
           DISPLAY (8, 1) "IF YOUR TERMINAL IS CONFIGURED WITHOUT".       
           DISPLAY (9, 1) "COLOR SUPPORT, THE COLOR INFORMATION IS".
           DISPLAY (10, 1) "IGNORED, AND TEXT WILL APPEAR IN A".
           DISPLAY (11, 1) "SINGLE COLOR.".
           DISPLAY (13, 1) "IF YOU DO NOT WISH TO RUN THESE TESTS,".
           DISPLAY (14, 1) 'REPLY "N" OR "n" BELOW. ANY OTHER '.
           DISPLAY (15, 1) "RESPONSES WILL RUN THE TESTS.".
           
           DISPLAY (17, 1)
                  "DO YOU WISH TO RUN THE COLOR TESTS? (Y/N): ".
           ACCEPT (, ) COLOR-CHAR  WITH AUTO-SKIP.
           IF NOT NO-COLOR
              PERFORM RUN-COLOR-TESTS.
	     

       RUN-COLOR-TESTS.
             DISPLAY DEFAULT-SCREEN.
             DISPLAY " DEFAULT SCREEN COLORS ARE NOW: ".
             DISPLAY "   FOREGROUND 7 BACKGROUND 0 (NORMAL SCREEN)".
             PERFORM WAIT-FOR-INPUT.
             DISPLAY DEFAULT-SCREEN.
             DISPLAY COLOR-SCREEN.
             PERFORM WAIT-FOR-NEXT-SCREEN.
             
             DISPLAY REVERSE-SCREEN.
             DISPLAY " DEFAULT SCREEN COLORS ARE NOW: ".
             DISPLAY "   FOREGROUND 0 BACKGROUND 7 (REVERSE VIDEO)".
             PERFORM WAIT-FOR-INPUT.
             DISPLAY REVERSE-SCREEN.
             DISPLAY COLOR-SCREEN.
             PERFORM WAIT-FOR-NEXT-SCREEN.

             DISPLAY NEW-COLOR-SCREEN.
             DISPLAY " DEFAULT SCREEN COLORS ARE NOW: ".
             DISPLAY "   FOREGROUND 2 BACKGROUND 1 ".
             PERFORM WAIT-FOR-INPUT.
             DISPLAY NEW-COLOR-SCREEN.
             DISPLAY COLOR-SCREEN.
             PERFORM WAIT-FOR-NEXT-SCREEN.
             DISPLAY DEFAULT-SCREEN.

        
       WAIT-FOR-INPUT.
           DISPLAY " ".
           DISPLAY " ".
           DISPLAY  "TYPE ANY CHARACTER TO CONTINUE.".
           ACCEPT (, ) WAIT-CHAR  WITH AUTO-SKIP.
       
       WAIT-FOR-NEXT-SCREEN.
           DISPLAY (24, 1 ) "TYPE ANY CHARACTER TO CONTINUE.".
           ACCEPT (, ) WAIT-CHAR  WITH AUTO-SKIP.

