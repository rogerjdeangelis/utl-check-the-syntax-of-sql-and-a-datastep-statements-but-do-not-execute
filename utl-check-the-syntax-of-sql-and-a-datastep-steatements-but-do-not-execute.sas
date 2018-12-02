Check the syntax of sql and a datastep statement but do not execute


Check the syntax of sql and a datastep but do not execute

   1. Checking for  valid syntax (sql and datastep)
   2. Examples suppresing output when syntax is valid or marginal


EXAMPLES
========

 1. Is the syntax valid (sql and datastep)
 -----------------------------------------

    SQL

      proc sql;

        validate

        select
          name
       from
          sashelp.class
      ;quit;

       NOTE: PROC SQL statement has valid syntax.
       ------------------------------------------

       263 !      quit;
       NOTE: PROCEDURE SQL used (Total process time):
             real time           0.00 seconds
             cpu time            0.00 seconds

    DATASTEP

      data _null_;
        set sashelp.class;
        put "I will not execute";
      run cancel;

      WARNING: DATA step not executed at user's request.

      NOTE: DATA statement used (Total process time):
            real time           0.00 seconds
            cpu time            0.00 seconds


 2. Examples suppressing output when syntax is valid or marginal(sql datastep)
 ---------------------------------------------------------------------------

    SQL

       %symdel nam / nowarn;

       proc sql;

        validate

        select
          name into :nam separated by " "
       from
          sashelp.class
       ;quit;

        NOTE: PROC SQL statement has valid syntax.
        ------------------------------------------

        NICE TO KNOW
        WARNING: INTO clause that is not in the outermost query block will be ignored.


    DATASTEP (No output and marginal syntax)

        data _null_;

          se sashelp.class;

          putlog "this is not executed";

        run cancel;

        353     data _null_;
        354             se sashelp.class;
                        --
                        1
        WARNING 1-322: Assuming the symbol SET was misspelled as se.

        355             putlog "this is not executed";
        356           run cancel;

        WARNING: DATA step not executed at user's request.

        NOTE: DATA statement used (Total process time):
              real time           0.00 seconds
              cpu time            0.00 seconds





