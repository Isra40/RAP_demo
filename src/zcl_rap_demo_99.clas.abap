CLASS zcl_rap_demo_99 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAP_DEMO_99 IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

    DATA lt_travel   TYPE TABLE OF ztb_travel_m.
    DATA lt_booking  TYPE TABLE OF ztb_booking_m.
    DATA lt_book_sup TYPE TABLE OF ztb_booksuppl_m.

    SELECT travel_id,
           agency_id,
           customer_id,
           begin_date,
           end_date,
           booking_fee,
           total_price,
           currency_code,
           description,
           case status
             when 'B' THEN 'A'
             when 'P' THEN 'A'
             when 'N' THEN 'O'
             when 'X' THEN 'X'
           end as overall_status,
           createdby     AS created_by,
           createdat     AS created_at,
           lastchangedby AS last_changed_by,
           lastchangedat AS last_changed_at
      FROM /dmo/travel
      INTO CORRESPONDING FIELDS OF TABLE @lt_travel.

    SELECT * FROM /dmo/booking INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    SELECT * FROM /dmo/book_suppl INTO CORRESPONDING FIELDS OF TABLE @lt_book_sup.

    DELETE FROM ztb_travel_m.
    DELETE FROM ztb_booking_m.
    DELETE FROM ztb_booksuppl_m.

    INSERT: ztb_travel_m FROM TABLE @lt_travel,
            ztb_booking_m FROM TABLE @lt_booking,
            ztb_booksuppl_m FROM TABLE @lt_book_sup.

    out->write( sy-dbcnt ). out->write( 'DONE!' ).

ENDMETHOD.
ENDCLASS.
