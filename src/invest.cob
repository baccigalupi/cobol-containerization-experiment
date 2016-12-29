       IDENTIFICATION DIVISION.
       PROGRAM-ID. INVESTMENT-VALUE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 user-entries.
         05 menu-choice           pic 9     value 1.
         05 starting-value        pic 99999.
         05 number-of-years       pic 99.
         05 annual-interest-rate  pic 99v9.

       01 calculation-fields.
         05 future-value            pic 9(7)v99.
         05 formatted-future-value  pic z,zzz,zzz.99.
         05 year-counter            pic 999.

       PROCEDURE DIVISION.
       000-RUN-APPLICATION.
           PERFORM 020-PRINT-HEADER.
           PERFORM 010-RUN-APPLICATION-CYCLE
           UNTIL   menu-choice = ZERO.
           PERFORM 050-TERMINATE-PROGRAM.

       010-RUN-APPLICATION-CYCLE.
           PERFORM 030-GET-DATA.
           PERFORM 040-CALC-DISPLAY-FUTURE-VALUE.
           PERFORM 020-PRINT-HEADER.

       020-PRINT-HEADER.
           DISPLAY '--------------------------------'.
           DISPLAY 'To end this program, enter 0.'.
           DISPLAY 'To perform another calculation, enter 1'.
           ACCEPT  menu-choice.

       030-GET-DATA.
           DISPLAY '--------------------------------'.
           DISPLAY 'Enter investment amount (xxxxx):'.
           ACCEPT  starting-value.
           DISPLAY ' '.

           DISPLAY 'Enter number of years (xx):'.
           ACCEPT  number-of-years.
           DISPLAY ' '.

           DISPLAY 'Enter yearly interest rate (xx.x):'.
           ACCEPT  annual-interest-rate.
           DISPLAY ' '.

       040-CALC-DISPLAY-FUTURE-VALUE.
           MOVE 1 TO year-counter.
           MOVE starting-value TO future-value.

           PERFORM 045-CALC-FUTURE-VALUE
           UNTIL year-counter > number-of-years.

           MOVE future-value TO formatted-future-value.
           DISPLAY 'Future value = ' formatted-future-value.

       045-CALC-FUTURE-VALUE.
           COMPUTE future-value rounded =
           future-value + (future-value * annual-interest-rate / 100).

           COMPUTE year-counter =
           year-counter + 1.

       050-TERMINATE-PROGRAM.
           DISPLAY 'End of session'.
           STOP RUN.
