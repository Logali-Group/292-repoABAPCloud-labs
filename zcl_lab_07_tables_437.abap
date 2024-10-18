CLASS zcl_lab_07_tables_437 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    TYPES: BEGIN OF ty_employee,
             id     TYPE i,
             email  TYPE string,
             ape1   TYPE string,
             ape2   TYPE string,
             name   TYPE string,
             fechan TYPE d,
             fechaa TYPE d,
           END OF ty_employee,

           BEGIN OF ty_flights,
             iduser(40) TYPE c,
             aircode    TYPE /dmo/carrier_id,
             flightnum  TYPE /dmo/connection_id,
             key        TYPE land1,
             seat       TYPE /dmo/plane_seats_occupied,
             flightdate TYPE /dmo/flight_date,
           END OF ty_flights,

           BEGIN OF ty_airlines,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
           END OF ty_airlines,

           BEGIN OF ty_seats,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             seats         TYPE /dmo/plane_seats_occupied,
             bookings      TYPE /dmo/flight_price,
           END OF ty_seats,

           BEGIN OF ty_range,
             sign(1)   TYPE c,
             option(2) TYPE c,
             low       TYPE i,
             high      TYPE i,
           END OF ty_range.

    TYPES: ty_currency TYPE c LENGTH 8,
           BEGIN OF ENUM mty_currency BASE TYPE ty_currency,
             c_initial VALUE IS INITIAL,
             c_dollar  VALUE 'USD',
             c_euros   VALUE 'EUR',
             c_colpeso VALUE 'COP',
             c_mexpeso VALUE 'MEX',
           END OF ENUM mty_currency.

    DATA: mt_employees    TYPE TABLE OF ty_employee,
          mt_employees_2  TYPE TABLE OF ty_employee,
          ms_employee     TYPE ty_employee,
          mt_spfli        TYPE TABLE OF /dmo/connection,
          ms_spfli        TYPE /dmo/connection,
          ms_spfli_2      TYPE /dmo/connection,
          mt_airlines     TYPE STANDARD TABLE OF /dmo/connection,
          mt_flights_type TYPE STANDARD TABLE OF /dmo/flight,
          mt_scarr        TYPE STANDARD TABLE OF /dmo/carrier.

    METHODS add_records IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS insert_record IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS append_records IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS corresponding_example IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS read_table_example IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS read_table_with_key IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS check_records IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS get_record_index IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS loop_example IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.

    METHODS add_flights_with_for IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS nested_for IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS add_multiple_lines IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS sort_records IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS modify_records IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS delete_records IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS clear_free_memory IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS collect_records IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS use_let IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS use_base IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS group_records IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS use_range_tables IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
    METHODS use_enumerations IMPORTING ir_out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_lab_07_tables_437 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
********************First part**************************************************
*    Add records
    add_records( out ).

*    Insert records
    insert_record( out ).

*    Adding records with append
    append_records( out ).

*    Corresponding
    corresponding_example( out ).

*    Read table with index
    read_table_example( out ).

*    Read table with key
    read_table_with_key( out ).

*    Checking records
    check_records( out ).

*    Index of a record
    get_record_index( out ).

*    Loop statement
    loop_example( out ).

*******************Second part**************************************************
*   For
    add_flights_with_for( out ).

*   For nested
    nested_for( out ).

*    Add multiple lines (select)
    add_multiple_lines( out ).

*    Sort records
    sort_records( out ).

*    Modify records
    modify_records( out ).

*    Delete records
    delete_records( out ).

*    Clear / free
    clear_free_memory( out ).

*    Collect statement
    collect_records( out ).

*    Let instruction
    use_let( out ).

*    Base instruction
    use_base( out ).

*    Grouping of records
    group_records( out ).

*    Range tables
    use_range_tables( out ).

*    Enumerations
    use_enumerations( out ).
  ENDMETHOD.

  METHOD add_records.
*    adding records to internal tables
    me->mt_employees = VALUE #( ( id     = 1
                                  email  = 'emp1@logali.com'
                                  ape1   = 'perez'
                                  ape2   = 'gomez'
                                  name   = 'juan'
                                  fechan = '19900101'
                                  fechaa = '20220101' ) ).

    me->ms_employee-email = 'emp2@logali.com'.
    me->ms_employee-ape1 = 'lopez'.
    me->ms_employee-ape2 = 'martinez'.
    me->ms_employee-name = 'ana'.
    me->ms_employee-fechan = '19920202'.
    me->ms_employee-fechaa ='20220202'.
    APPEND me->ms_employee TO me->mt_employees.

    ir_out->write(  data = me->mt_employees name = 'Add records'  ).
  ENDMETHOD.

  METHOD insert_record.
*     insert missing 3rd record
    me->ms_employee-email = 'emp2@logali.com'.
    me->ms_employee-ape1 = 'lopez'.
    me->ms_employee-ape2 = 'martinez'.
    me->ms_employee-name = 'ana'.
    me->ms_employee-fechan = '19920202'.
    me->ms_employee-fechaa ='20220202'.

    INSERT me->ms_employee INTO TABLE me->mt_employees.

    ir_out->write(  data = me->mt_employees name = 'insert records'  ).
  ENDMETHOD.

  METHOD append_records.
    me->ms_employee = VALUE #( id = 5
                               email = 'emp5@logali.com'
                               ape1 = 'torres'
                               ape2 = 'ruiz'
                               name = 'carlos'
                               fechan = '19950505'
                               fechaa = '20220505' ).

    APPEND me->ms_employee TO me->mt_employees_2.

*     adding a record a me->mt_employees_2 using append value
    APPEND VALUE #( id = 6
                    email = 'emp6@logali.com'
                    ape1 = 'hernandez'
                    ape2 = 'jimenez'
                    name = 'laura'
                    fechan = '19960606'
                    fechaa = '20220606' ) TO me->mt_employees_2.

*     adding lines from me->mt_employees a me->mt_employees_2
    APPEND LINES OF me->mt_employees FROM 2 TO 3 TO me->mt_employees_2.

    ir_out->write(  data = me->mt_employees_2 name = 'Add records with append lines' ).
  ENDMETHOD.

  METHOD corresponding_example.
*     using move-corresponding to move data between structures
    SELECT * FROM /dmo/connection
        WHERE carrier_id EQ 'LH'
        INTO TABLE @mt_spfli.

    READ TABLE mt_spfli INTO me->ms_spfli INDEX 1.

    MOVE-CORRESPONDING me->ms_spfli TO me->ms_spfli_2.

    ir_out->write( data = me->ms_spfli_2 name = 'Add records using move-corresponding' ).
  ENDMETHOD.

  METHOD read_table_example.
*     reading a table with index
    READ TABLE me->mt_spfli INTO me->ms_spfli INDEX 1.
    ir_out->write( data = me->ms_spfli name = 'read table' ).
  ENDMETHOD.

  METHOD read_table_with_key.
*     read table with key to display departure city for destination airport 'FRA'
    READ TABLE me->mt_spfli INTO me->ms_spfli WITH KEY airport_to_id = 'FRA'.
    ir_out->write( |Departure city for FRA: { me->ms_spfli-airport_from_id }| ).
  ENDMETHOD.

  METHOD check_records.
*     flight consultation with connection_id older 0400
    SELECT * FROM /dmo/connection WHERE connection_id GT '0400' INTO TABLE @me->mt_spfli.
    ir_out->write( data = me->mt_spfli name = 'flight consultation with connection_id older 0400' ).

*     check if the flight exists 0407
    IF line_exists( me->mt_spfli[ connection_id = '0407' ] ).
      ir_out->write( |Flight 0407 exists| ).
    ELSE.
      ir_out->write( |Flight 0407 does not exist| ).
    ENDIF.
  ENDMETHOD.

  METHOD get_record_index.
*     get index of flight 0407

*    read table me->mt_spfli with key connection_id = '0407' transporting no fields.
    DATA(lv_index) = line_index( me->mt_spfli[ connection_id = '0407'  ]  ).
    IF sy-subrc = 0.
      ir_out->write( |Flight index 0407: { lv_index }| ).
    ELSE.
      ir_out->write( 'Flight 0407 not found' ).
    ENDIF.
  ENDMETHOD.

  METHOD loop_example.
*     loop through records with loop = 'KM'
    LOOP AT me->mt_spfli INTO me->ms_spfli WHERE distance_unit = 'KM'.
      ir_out->write( me->ms_spfli ).
    ENDLOOP.
  ENDMETHOD.

  METHOD add_flights_with_for.
    DATA: ls_flight       TYPE ty_flights,
          lt_flights      TYPE STANDARD TABLE OF ty_flights,
          lt_flights_info TYPE STANDARD TABLE OF ty_flights.

    lt_flights =   VALUE #( FOR i = 1 UNTIL i > 15
                            ( iduser     = |1234{ sy-index }-t100437|
                              aircode    = 'SQ'
                              flightnum  =  0000 + i
                              key        = | US |
                              seat       =   0 + i
                              flightdate =   cl_abap_context_info=>get_system_date( ) + i  ) ).

    ir_out->write( lt_flights ).

    LOOP AT lt_flights INTO ls_flight.
      ls_flight-aircode = 'CL'.
      ls_flight-flightnum = ls_flight-flightnum + 10.
      ls_flight-key = 'COP'.
      APPEND ls_flight TO lt_flights_info.
    ENDLOOP.
    ir_out->write( data = lt_flights_info name = 'For Table').
  ENDMETHOD.

  METHOD nested_for.
    DATA: lt_final    TYPE SORTED TABLE OF ty_flights WITH NON-UNIQUE KEY aircode.

    SELECT * FROM /dmo/flight INTO TABLE @mt_flights_type.
    SELECT * FROM /dmo/connection WHERE carrier_id = 'SQ' INTO TABLE @mt_airlines.

    lt_final = VALUE #(  FOR ls_flights_type IN mt_flights_type  WHERE (  carrier_id = 'SQ' )
                     FOR ls_airline IN mt_airlines WHERE ( connection_id = ls_flights_type-connection_id )
                       ( iduser = ls_flights_type-client
                         aircode = ls_flights_type-carrier_id
                         flightnum = ls_airline-connection_id
                         key = ls_airline-airport_from_id
                         seat = ls_flights_type-seats_occupied
                         flightdate = ls_flights_type-flight_date  )  ).
    ir_out->write( data = lt_final name = 'Nested For Table' ).
  ENDMETHOD.

  METHOD add_multiple_lines.
    DATA mt_airlines TYPE STANDARD TABLE OF ty_airlines.

    SELECT carrier_id, connection_id, airport_from_id, airport_to_id
      FROM /dmo/connection
      WHERE airport_from_id = 'FRA'
      INTO TABLE @mt_airlines.
    ir_out->write( data = mt_airlines name = 'Multiple lines' ).
  ENDMETHOD.

  METHOD sort_records.
    SORT mt_airlines BY connection_id DESCENDING. " sorted by connection_id in descending order
    ir_out->write( mt_airlines ).
  ENDMETHOD.

  METHOD modify_records.
    LOOP AT mt_spfli INTO DATA(ls_spfli).
      IF ls_spfli-departure_time GT '12:00:00'.
        ls_spfli-departure_time = cl_abap_context_info=>get_system_time(  ).
        MODIFY mt_spfli FROM ls_spfli TRANSPORTING departure_time.
      ENDIF.
    ENDLOOP.
    ir_out->write( data = mt_spfli name = 'Modify table').
  ENDMETHOD.

  METHOD delete_records.
    DELETE mt_spfli WHERE airport_to_id = 'FRA'.
    ir_out->write( data = mt_spfli name = 'Delete Records').
  ENDMETHOD.

  METHOD clear_free_memory.
    CLEAR mt_airlines.
    FREE mt_airlines.
  ENDMETHOD.

  METHOD collect_records.
    DATA: lt_seats   TYPE HASHED TABLE OF ty_seats WITH UNIQUE KEY carrier_id connection_id,
          lt_seats_2 TYPE STANDARD TABLE OF ty_seats.

    SELECT DISTINCT carrier_id, connection_id, seats_occupied AS seats, price AS bookings
      FROM /dmo/flight
      WHERE seats_max EQ '140'
      INTO TABLE @lt_seats.

    SELECT carrier_id, connection_id, seats_occupied AS seats, price AS bookings
      FROM /dmo/flight
      INTO TABLE @lt_seats_2.

    LOOP AT lt_seats_2 INTO DATA(ls_seat).
      COLLECT ls_seat INTO lt_seats.
    ENDLOOP.
    ir_out->write( data = lt_seats name = 'Collect table' ).
  ENDMETHOD.

  METHOD use_let.
    SELECT * FROM /dmo/flight INTO TABLE @mt_flights_type.
    SELECT * FROM /dmo/carrier INTO TABLE @mt_scarr.

    LOOP AT mt_flights_type INTO DATA(ls_flight_let).
      DATA(lv_flights) = CONV string( LET lv_airline_name = mt_scarr[ carrier_id = ls_flight_let-carrier_id ]-carrier_id
                                          lv_flight_price = mt_flights_type[ carrier_id = ls_flight_let-carrier_id
                                          connection_id = ls_flight_let-connection_id ]-price
                                          lv_carrid = mt_scarr[ carrier_id = ls_flight_let-carrier_id ]-carrier_id
                                      IN | { lv_carrid } / Airline name: { lv_airline_name } / flight price: { lv_flight_price } | ).
      EXIT.
    ENDLOOP.
    ir_out->write( data = lv_flights name = 'Let data').
  ENDMETHOD.

  METHOD use_base.
    DATA lt_flights_base TYPE STANDARD TABLE OF /dmo/flight.

    lt_flights_base = VALUE #( BASE mt_flights_type ( carrier_id    = 'DL'
                                                      connection_id    = '2500'
                                                      flight_date    = cl_abap_context_info=>get_system_date( )
                                                      price     = '2000'
                                                      currency_code  =  'USD'
                                                      plane_type_id =  'A380-800'
                                                      seats_max  =  120
                                                      seats_occupied  =  100      )  ).

    ir_out->write( data = lt_flights_base name = 'Flight Base Table' ).
  ENDMETHOD.

  METHOD group_records.
    TYPES lty_group_keys TYPE STANDARD TABLE OF /dmo/connection-carrier_id WITH EMPTY KEY.
    DATA: lt_members TYPE STANDARD TABLE OF /dmo/connection.

    FIELD-SYMBOLS <ls_spfli> TYPE /dmo/connection.

*    Grouping of records
    LOOP AT mt_spfli ASSIGNING <ls_spfli>
        GROUP BY <ls_spfli>-airport_from_id.
      CLEAR lt_members.
      LOOP AT GROUP <ls_spfli> INTO DATA(ls_member).
        lt_members = VALUE #( BASE lt_members ( ls_member ) ).
      ENDLOOP.
      ir_out->write( data = lt_members name = 'lt_members' ).
    ENDLOOP.
    UNASSIGN <ls_spfli>.

*    Grouping by key
    LOOP AT mt_spfli ASSIGNING <ls_spfli>
      "Grouping by more than one column of groups
      GROUP BY ( airportfrom = <ls_spfli>-airport_from_id
                 airportto   = <ls_spfli>-airport_to_id   ) INTO DATA(gs_key).
      CLEAR lt_members.
      LOOP AT GROUP gs_key INTO DATA(gs_member).
        lt_members = VALUE #( BASE lt_members ( gs_member ) ).
      ENDLOOP.
      ir_out->write( data = lt_members name = 'lt_members' ).
      ir_out->write( data = gs_key name = 'gs_key' ).
    ENDLOOP.

*   FOR GROUPS
    ir_out->write(  VALUE lty_group_keys( FOR GROUPS gv_group OF gs_group IN mt_spfli
                                          GROUP BY gs_group-carrier_id
                                          ASCENDING
                                          WITHOUT MEMBERS ( gv_group )  )  ).
  ENDMETHOD.

  METHOD use_range_tables.
    TYPES lty_price TYPE RANGE OF /dmo/flight-price.

    DATA(lt_range) = VALUE lty_price(  ( sign   = 'I'
                                         option = 'BT'
                                         low    = '200'
                                         high   = '400'  )  ).

    SELECT * FROM /dmo/flight WHERE seats_occupied IN @lt_range INTO TABLE @mt_flights_type.

    LOOP AT mt_flights_type INTO DATA(ls_flight).
      ir_out->write( data = ls_flight name = 'Range Tables' ).
    ENDLOOP.
  ENDMETHOD.

  METHOD use_enumerations.
    DATA: lv_currency TYPE mty_currency.

    lv_currency = c_dollar.
    ir_out->write( |Currency Code: { lv_currency }| ).

    lv_currency = c_euros.
    ir_out->write( |Currency Code: { lv_currency }| ).
  ENDMETHOD.
ENDCLASS.