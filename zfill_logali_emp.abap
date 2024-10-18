CLASS zfill_logali_emp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zfill_logali_emp IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    INSERT zemp_logali FROM TABLE @( VALUE #(
    ( client = '800' id = '10' email = 'DEDED22E@HOTMAIL.COM' ape1 = 'PEREZ' ape2 = 'JIMENEZ' name = '' fechan = '19991020' fechaa = '20211113'  )
    ( client = '800' id = '111111111Z' email = '1234@A3BCD.EFG' ape1 = 'ABCD' ape2 = 'EFG' name = '' fechan = '19911111' fechaa = '20210924'  )
    ( client = '800' id = '123456789A' email = 'MA3R.BR3WN@LO3GALI.COM' ape1 = 'JP' ape2 = 'BROWN' name = '' fechan = '19660101' fechaa = '20210926'  )
    ( client = '800' id = '222' email = 'DAYMO411N@HOTMAIL.COM' ape1 = 'PEREZ' ape2 = 'JIMENEZ' name = '' fechan = '19971020' fechaa = '20211116'  )
    ( client = '800' id = '333' email = 'DEDED12E@HOTMAIL.COM' ape1 = 'PEREZ' ape2 = 'JIMENEZ' name = '' fechan = '19991020' fechaa = '20211116'  )
    ( client = '800' id = '123456X' email = 'LAURA' ape1 = '' ape2 = '' name = '' fechan = '00000000' fechaa = '00000000'  )
    ( client = '800' id = '123456ABCD' email = 'k4rodr3iguez@gmail.com' ape1 = 'ROD' ape2 = 'SAN' name = '' fechan = '19930205' fechaa = '19920724'  )
    ( client = '800' id = '789123FGHIJ' email = 'sin4hu2e@gmail.com' ape1 = 'VEL' ape2 = 'RA' name = '' fechan = '19930206' fechaa = '19920710'  )
    ( client = '800' id = '1113516342' email = 'dane1ry63@hotmail.com' ape1 = 'montoya' ape2 = 'reina' name = '' fechan = '20230104' fechaa = '20230517'  )
    ( client = '800' id = '1113516348' email = 'MAMR6233@hotmail.com' ape1 = 'montoya' ape2 = 'reina' name = '' fechan = '20230104' fechaa = '20230517'  )
    ( client = '800' id = '1113516349' email = '198238@hotmail.com' ape1 = 'montoya' ape2 = 'reina' name = '' fechan = '20230104' fechaa = '20230517'  )
    ( client = '800' id = '           123' email = 'jua2na3@gmail.com' ape1 = 'Perez' ape2 = 'Rios' name = '' fechan = '19871010' fechaa = '20150102'  )
    ( client = '800' id = '        123111' email = 'ju1an1a@gmail.com' ape1 = 'Perez' ape2 = 'Rios' name = '' fechan = '19871010' fechaa = '20150102'  )
    ( client = '800' id = '1' email = 'VICTOR ISAAC' ape1 = '' ape2 = '           ARIAS' name = '' fechan = '00000000' fechaa = '00000000'  )
    ( client = '800' id = '454' email = 'A' ape1 = '' ape2 = '           AA' name = '' fechan = 'A' fechaa = '00000000'  )
    ( client = '800' id = '454' email = 'VICTOR ISAAC' ape1 = '' ape2 = '           ARIAS' name = '' fechan = '00000000' fechaa = '00000000'  )
    ( client = '800' id = '437' email = 'wladimirrivera@hotmail.com' ape1 = ' Rivera' ape2 = '           Torres' name = '' fechan = '00000000' fechaa = '00000000'  )
     ) ).
  ENDMETHOD.

ENDCLASS.