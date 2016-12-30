       identification division.
       program-id. report001.

       environment division.
       input-output section.
       file-control.
           select customer-file assign to '../data/CUSTMAST.DAT'
           organization is record sequential.

       data division.

       file section.

       fd customer-file
           record contains 43 characters.
       01 customer-record.
           05 r-branch-id         pic 9(2).
           05 r-salesrep-id       pic 9(2).
           05 r-customer-id       pic 9(5).
           05 r-customer-name     pic x(20).
           05 r-sales-this-ytd    pic s9(5)V9(2).
           05 r-sales-last-ytd    pic s9(5)V9(2).

       working-storage section.
       01 control-flow.
           05 eof                     pic 9             value zero.

       01 header.
           05 fh-cust                 pic x(7)    value 'CUST'.
           05 fh-num                  pic x(7)    value 'NUM'.
           05 fh-customer-name        pic x(20)   value 'CUSTOMER NAME'.
           05 fh-sales                pic x(13)   value '      SALES'.
           05 fh-this-ytd             pic x(13)   value '     THIS YTD'.
           05 fh-last-ytd             pic x(13)   value '     LAST YTD'.

       01 data-formatting.
           05 pad-customer-id         pic x(2)          value space.
           05 f-sales-this-ytd        pic zz,zzz,zzz.99.
           05 f-sales-last-ytd        pic zz,zzz,zzz.99.
           05 f-customer-id           pic x(5)          value space.
           05 f-customer-name         pic x(20)         value space.

           05 f-total-sales-this-ytd  pic zz,zzz,zzz.99.
           05 f-total-sales-last-ytd  pic zz,zzz,zzz.99.

       01 totals.
           05 total-sales-this-ytd    pic 9(6)v9(2)      value zero.
           05 total-sales-last-ytd    pic 9(6)v9(2)      value zero.


       procedure division.

       000-run.
           perform 010-start-program.
           perform 100-write-records.
           perform 030-finish-program.

       010-start-program.
           open input customer-file.
           perform 020-write-header.

       020-write-header.
           display fh-cust f-customer-name fh-sales fh-sales.
           display fh-num fh-customer-name fh-this-ytd fh-last-ytd.
           display ' '.

       030-finish-program.
           perform 040-write-footer.
           close customer-file.
           stop run.

       040-write-footer.
           move total-sales-this-ytd to f-total-sales-this-ytd.
           move total-sales-last-ytd to f-total-sales-last-ytd.

           display ' '.
           display f-customer-id pad-customer-id f-customer-name
           f-total-sales-this-ytd f-total-sales-last-ytd.

       100-write-records.
           perform 110-process-record
           until eof > 0.

       110-process-record.
           read customer-file next record into customer-record
             at end
             move 1 to eof

             not at end
             perform 120-write-record.

       120-write-record.
           perform 130-increment-totals.

           move r-sales-this-ytd to f-sales-this-ytd.
           move r-sales-last-ytd to f-sales-last-ytd.

           display r-customer-id pad-customer-id r-customer-name
           f-sales-this-ytd f-sales-last-ytd.

       130-increment-totals.
           compute total-sales-this-ytd =
           total-sales-this-ytd + r-sales-this-ytd.

           compute total-sales-last-ytd =
           total-sales-last-ytd + r-sales-last-ytd.

