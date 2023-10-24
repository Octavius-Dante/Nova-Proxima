CLASS zcl_t_table_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_t_table_fill IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* DATA FILL FOR ZTBDLS  ****************************

    DATA : it_ZTBDLS TYPE TABLE OF ztbdls.

*   fill internal table (itab)
    it_ZTBDLS = VALUE #(

( logsys = 'NPLCLNT001' )

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ztbdls.
*   insert the new table entries
    INSERT ztbdls FROM TABLE @it_ztbdls.

*   check the result
    SELECT * FROM ztbdls INTO TABLE @it_ZTBDLS.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZTBDLS table !' ).

* END OF DATA FILL FOR ZTBDLS ************************
************************************************************************
* DATA FILL FOR ZTCURC  ****************************

    DATA : it_ZTCURC TYPE TABLE OF ztcurc.

*   fill internal table (itab)
    it_ZTCURC = VALUE #(

 ( mandt = '001' waers = 'ADP' isocd = 'ADP' altwr = '020' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AED' isocd = 'AED' altwr = '784' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AFA' isocd = 'AFA' altwr = '004' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AFN' isocd = 'AFN' altwr = '971' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ALL' isocd = 'ALL' altwr = '008' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AMD' isocd = 'AMD' altwr = '051' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ANG' isocd = 'ANG' altwr = '532' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AOA' isocd = 'AOA' altwr = '973' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AON' isocd = 'AON' altwr = '024' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AOR' isocd = 'AOR' altwr = '982' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ARS' isocd = 'ARS' altwr = '032' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ATS' isocd = 'ATS' altwr = '040' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AUD' isocd = 'AUD' altwr = '036' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AWG' isocd = 'AWG' altwr = '533' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AZM' isocd = 'AZM' altwr = '031' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'AZN' isocd = 'AZN' altwr = '944' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BAM' isocd = 'BAM' altwr = '977' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BBD' isocd = 'BBD' altwr = '052' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BDT' isocd = 'BDT' altwr = '050' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BEF' isocd = 'BEF' altwr = '056' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BGN' isocd = 'BGN' altwr = '975' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BHD' isocd = 'BHD' altwr = '048' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BIF' isocd = 'BIF' altwr = '108' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BMD' isocd = 'BMD' altwr = '060' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BND' isocd = 'BND' altwr = '096' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BOB' isocd = 'BOB' altwr = '068' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BRL' isocd = 'BRL' altwr = '986' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BSD' isocd = 'BSD' altwr = '044' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BTN' isocd = 'BTN' altwr = '064' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BWP' isocd = 'BWP' altwr = '072' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BYB' isocd = 'BYB' altwr = '112' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BYN' isocd = 'BYN' altwr = '933' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BYR' isocd = 'BYR' altwr = '974' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'BZD' isocd = 'BZD' altwr = '084' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CAD' isocd = 'CAD' altwr = '124' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CDF' isocd = 'CDF' altwr = '976' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CFP' isocd = 'XPF' altwr = '953' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CHF' isocd = 'CHF' altwr = '756' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CLP' isocd = 'CLP' altwr = '152' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CNY' isocd = 'CNY' altwr = '156' gdatu = '00000000' xprimary = 'X' )
 ( mandt = '001' waers = 'COP' isocd = 'COP' altwr = '170' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CRC' isocd = 'CRC' altwr = '188' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CSD' isocd = 'CSD' altwr = '891' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CUC' isocd = 'CUC' altwr = '931' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CUP' isocd = 'CUP' altwr = '192' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CVE' isocd = 'CVE' altwr = '132' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CYP' isocd = 'CYP' altwr = '196' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'CZK' isocd = 'CZK' altwr = '203' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'DEM' isocd = 'DEM' altwr = '280' gdatu = '00000000' xprimary = 'X' )
 ( mandt = '001' waers = 'DEM3' isocd = 'DEM' altwr = '280' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'DJF' isocd = 'DJF' altwr = '262' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'DKK' isocd = 'DKK' altwr = '208' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'DOP' isocd = 'DOP' altwr = '214' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'DZD' isocd = 'DZD' altwr = '012' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ECS' isocd = 'ECS' altwr = '218' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'EEK' isocd = 'EEK' altwr = '233' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'EGP' isocd = 'EGP' altwr = '818' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ERN' isocd = 'ERN' altwr = '232' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ESP' isocd = 'ESP' altwr = '724' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ETB' isocd = 'ETB' altwr = '230' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'EUR' isocd = 'EUR' altwr = '978' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'FIM' isocd = 'FIM' altwr = '246' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'FJD' isocd = 'FJD' altwr = '242' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'FKP' isocd = 'FKP' altwr = '238' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'FRF' isocd = 'FRF' altwr = '250' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GBP' isocd = 'GBP' altwr = '826' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GEL' isocd = 'GEL' altwr = '981' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GHC' isocd = 'GHC' altwr = '288' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GHS' isocd = 'GHS' altwr = '936' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GIP' isocd = 'GIP' altwr = '292' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GMD' isocd = 'GMD' altwr = '270' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GNF' isocd = 'GNF' altwr = '324' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GRD' isocd = 'GRD' altwr = '300' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GTQ' isocd = 'GTQ' altwr = '320' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GWP' isocd = 'GWP' altwr = '624' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'GYD' isocd = 'GYD' altwr = '328' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'HKD' isocd = 'HKD' altwr = '344' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'HNL' isocd = 'HNL' altwr = '340' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'HRK' isocd = 'HRK' altwr = '191' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'HTG' isocd = 'HTG' altwr = '332' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'HUF' isocd = 'HUF' altwr = '348' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'IDR' isocd = 'IDR' altwr = '360' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'IEP' isocd = 'IEP' altwr = '372' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ILS' isocd = 'ILS' altwr = '376' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'INR' isocd = 'INR' altwr = '356' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'IQD' isocd = 'IQD' altwr = '368' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'IRR' isocd = 'IRR' altwr = '364' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ISK' isocd = 'ISK' altwr = '352' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ITL' isocd = 'ITL' altwr = '380' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'JMD' isocd = 'JMD' altwr = '388' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'JOD' isocd = 'JOD' altwr = '400' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'JPY' isocd = 'JPY' altwr = '392' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KES' isocd = 'KES' altwr = '404' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KGS' isocd = 'KGS' altwr = '417' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KHR' isocd = 'KHR' altwr = '116' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KMF' isocd = 'KMF' altwr = '174' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KPW' isocd = 'KPW' altwr = '408' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KRW' isocd = 'KRW' altwr = '410' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KWD' isocd = 'KWD' altwr = '414' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KYD' isocd = 'KYD' altwr = '136' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'KZT' isocd = 'KZT' altwr = '398' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LAK' isocd = 'LAK' altwr = '418' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LBP' isocd = 'LBP' altwr = '422' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LKR' isocd = 'LKR' altwr = '144' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LRD' isocd = 'LRD' altwr = '430' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LSL' isocd = 'LSL' altwr = '426' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LTL' isocd = 'LTL' altwr = '440' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LUF' isocd = 'LUF' altwr = '442' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LVL' isocd = 'LVL' altwr = '428' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'LYD' isocd = 'LYD' altwr = '434' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MAD' isocd = 'MAD' altwr = '504' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MDL' isocd = 'MDL' altwr = '498' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MGA' isocd = 'MGA' altwr = '969' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MGF' isocd = 'MGF' altwr = '450' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MKD' isocd = 'MKD' altwr = '807' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MMK' isocd = 'MMK' altwr = '104' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MNT' isocd = 'MNT' altwr = '496' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MOP' isocd = 'MOP' altwr = '446' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MRO' isocd = 'MRO' altwr = '478' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MTL' isocd = 'MTL' altwr = '470' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MUR' isocd = 'MUR' altwr = '480' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MVR' isocd = 'MVR' altwr = '462' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MWK' isocd = 'MWK' altwr = '454' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MXN' isocd = 'MXN' altwr = '484' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MYR' isocd = 'MYR' altwr = '458' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MZM' isocd = 'MZM' altwr = '508' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'MZN' isocd = 'MZN' altwr = '943' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'NAD' isocd = 'NAD' altwr = '516' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'NGN' isocd = 'NGN' altwr = '566' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'NIO' isocd = 'NIO' altwr = '558' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'NLG' isocd = 'NLG' altwr = '528' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'NOK' isocd = 'NOK' altwr = '578' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'NPR' isocd = 'NPR' altwr = '524' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'NZD' isocd = 'NZD' altwr = '554' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'OMR' isocd = 'OMR' altwr = '512' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'PAB' isocd = 'PAB' altwr = '590' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'PEN' isocd = 'PEN' altwr = '604' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'PGK' isocd = 'PGK' altwr = '598' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'PHP' isocd = 'PHP' altwr = '608' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'PKR' isocd = 'PKR' altwr = '586' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'PLN' isocd = 'PLN' altwr = '985' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'PTE' isocd = 'PTE' altwr = '620' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'PYG' isocd = 'PYG' altwr = '600' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'QAR' isocd = 'QAR' altwr = '634' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'RMB' isocd = 'CNY' altwr = '156' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ROL' isocd = 'ROL' altwr = '642' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'RON' isocd = 'RON' altwr = '946' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'RSD' isocd = 'RSD' altwr = '941' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'RUB' isocd = 'RUB' altwr = '643' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'RWF' isocd = 'RWF' altwr = '646' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SAR' isocd = 'SAR' altwr = '682' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SBD' isocd = 'SBD' altwr = '090' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SCR' isocd = 'SCR' altwr = '690' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SDD' isocd = 'SDD' altwr = '736' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SDG' isocd = 'SDG' altwr = '938' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SDP' isocd = 'SDP' altwr = '736' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SEK' isocd = 'SEK' altwr = '752' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SGD' isocd = 'SGD' altwr = '702' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SHP' isocd = 'SHP' altwr = '654' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SIT' isocd = 'SIT' altwr = '705' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SKK' isocd = 'SKK' altwr = '703' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SLL' isocd = 'SLL' altwr = '694' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SOS' isocd = 'SOS' altwr = '706' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SRD' isocd = 'SRD' altwr = '968' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SRG' isocd = 'SRG' altwr = '740' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SSP' isocd = 'SSP' altwr = '728' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'STD' isocd = 'STD' altwr = '678' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SVC' isocd = 'SVC' altwr = '222' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SYP' isocd = 'SYP' altwr = '760' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'SZL' isocd = 'SZL' altwr = '748' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'THB' isocd = 'THB' altwr = '764' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TJR' isocd = 'TJR' altwr = '762' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TJS' isocd = 'TJS' altwr = '972' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TMM' isocd = 'TMM' altwr = '795' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TMT' isocd = 'TMT' altwr = '934' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TND' isocd = 'TND' altwr = '788' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TOP' isocd = 'TOP' altwr = '776' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TPE' isocd = 'TPE' altwr = '626' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TRL' isocd = 'TRL' altwr = '792' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TRY' isocd = 'TRY' altwr = '949' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TTD' isocd = 'TTD' altwr = '780' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TWD' isocd = 'TWD' altwr = '901' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'TZS' isocd = 'TZS' altwr = '834' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'UAH' isocd = 'UAH' altwr = '980' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'UGX' isocd = 'UGX' altwr = '800' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'USD' isocd = 'USD' altwr = '840' gdatu = '00000000' xprimary = 'X' )
 ( mandt = '001' waers = 'USDN' isocd = 'USD' altwr = '840' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'UYU' isocd = 'UYU' altwr = '858' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'UZS' isocd = 'UZS' altwr = '860' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'VEB' isocd = 'VEB' altwr = '862' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'VEF' isocd = 'VEF' altwr = '937' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'VND' isocd = 'VND' altwr = '704' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'VUV' isocd = 'VUV' altwr = '548' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'WST' isocd = 'WST' altwr = '882' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'XAF' isocd = 'XAF' altwr = '950' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'XCD' isocd = 'XCD' altwr = '951' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'XEU' isocd = 'XEU' altwr = '954' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'XOF' isocd = 'XOF' altwr = '952' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'XPF' isocd = 'XPF' altwr = '953' gdatu = '00000000' xprimary = 'X' )
 ( mandt = '001' waers = 'YER' isocd = 'YER' altwr = '886' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'YUM' isocd = 'YUM' altwr = '891' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ZAR' isocd = 'ZAR' altwr = '710' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ZMK' isocd = 'ZMK' altwr = '894' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ZMW' isocd = 'ZMW' altwr = '967' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ZRN' isocd = 'ZRN' altwr = '180' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ZWD' isocd = 'ZWD' altwr = '716' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ZWL' isocd = 'ZWL' altwr = '932' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ZWN' isocd = 'ZWN' altwr = '942' gdatu = '00000000' xprimary = '' )
 ( mandt = '001' waers = 'ZWR' isocd = 'ZWR' altwr = '935' gdatu = '00000000' xprimary = '' )


    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM ztcurc.
*   insert the new table entries
    INSERT ztcurc FROM TABLE @it_ztcurc.

*   check the result
    SELECT * FROM ztcurc INTO TABLE @it_ZTCURC.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZTCURC table !' ).

* END OF DATA FILL FOR ZTCURC ************************
************************************************************************
* DATA FILL FOR ZT000  ****************************

    DATA : it_ZT000 TYPE TABLE OF zt000.

*   fill internal table (itab)
    it_ZT000 = VALUE #(

"   ( mandt = '010' mtext = 'SAP SE' ort01 = 'Walldorf' mwaer = 'EUR' adrnr = '' cccategory = 'S' cccoractiv = '1' ccnocliind = '' cccopylock = '' ccnocascad = '' ccsoftlock = '' ccorigcont = '' ccimaildis = ''
"    cctemplock = '' changeuser = 'DDIC' changedate = '20171218' logsys = '' )
    ( mandt = '001' mtext = 'SAP SE' ort01 = 'Walldorf' mwaer = 'EUR' adrnr = '' cccategory = 'C' cccoractiv = '1' ccnocliind = '' cccopylock = '' ccnocascad = '' ccsoftlock = '' ccorigcont = '' ccimaildis = ''
    cctemplock = '' changeuser = '' changedate = '00000000' logsys = 'NPLCLNT001' )

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt000.
*   insert the new table entries
    INSERT zt000 FROM TABLE @it_zt000.

*   check the result
    SELECT * FROM zt000 INTO TABLE @it_ZT000.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT000 table !' ).

* END OF DATA FILL FOR ZT000 ************************
************************************************************************
* DATA FILL FOR ZT002  ****************************

    DATA : it_ZT002 TYPE TABLE OF zt002.

*   fill internal table (itab)
    it_ZT002 = VALUE #(

  ( spras = '0' laspez = 'S' lahq = '0' laiso = 'SR' )
  ( spras = '1' laspez = 'D' lahq = '0' laiso = 'ZH' )
  ( spras = '2' laspez = 'M' lahq = '0' laiso = 'TH' )
  ( spras = '3' laspez = 'D' lahq = '0' laiso = 'KO' )
  ( spras = '4' laspez = 'S' lahq = '0' laiso = 'RO' )
  ( spras = '5' laspez = 'S' lahq = '0' laiso = 'SL' )
  ( spras = '6' laspez = 'S' lahq = '0' laiso = 'HR' )
  ( spras = '7' laspez = 'S' lahq = '4' laiso = 'MS' )
  ( spras = '8' laspez = 'S' lahq = '0' laiso = 'UK' )
  ( spras = '9' laspez = 'S' lahq = '0' laiso = 'ET' )
  ( spras = 'A' laspez = 'L' lahq = '0' laiso = 'AR' )
  ( spras = 'B' laspez = 'L' lahq = '0' laiso = 'HE' )
  ( spras = 'C' laspez = 'S' lahq = '4' laiso = 'CS' )
  ( spras = 'D' laspez = 'S' lahq = '1' laiso = 'DE' )
  ( spras = 'E' laspez = 'S' lahq = '1' laiso = 'EN' )
  ( spras = 'F' laspez = 'S' lahq = '2' laiso = 'FR' )
  ( spras = 'G' laspez = 'S' lahq = '0' laiso = 'EL' )
  ( spras = 'H' laspez = 'S' lahq = '4' laiso = 'HU' )
  ( spras = 'I' laspez = 'S' lahq = '2' laiso = 'IT' )
  ( spras = 'J' laspez = 'D' lahq = '2' laiso = 'JA' )
  ( spras = 'K' laspez = 'S' lahq = '3' laiso = 'DA' )
  ( spras = 'L' laspez = 'S' lahq = '0' laiso = 'PL' )
  ( spras = 'M' laspez = 'D' lahq = '0' laiso = 'ZF' )
  ( spras = 'N' laspez = 'S' lahq = '2' laiso = 'NL' )
  ( spras = 'O' laspez = 'S' lahq = '3' laiso = 'NO' )
  ( spras = 'P' laspez = 'S' lahq = '4' laiso = 'PT' )
  ( spras = 'Q' laspez = 'S' lahq = '0' laiso = 'SK' )
  ( spras = 'R' laspez = 'S' lahq = '3' laiso = 'RU' )
  ( spras = 'S' laspez = 'S' lahq = '2' laiso = 'ES' )
  ( spras = 'T' laspez = 'S' lahq = '0' laiso = 'TR' )
  ( spras = 'U' laspez = 'S' lahq = '3' laiso = 'FI' )
  ( spras = 'V' laspez = 'S' lahq = '3' laiso = 'SV' )
  ( spras = 'W' laspez = 'S' lahq = '4' laiso = 'BG' )
  ( spras = 'X' laspez = 'S' lahq = '0' laiso = 'LT' )
  ( spras = 'Y' laspez = 'S' lahq = '0' laiso = 'LV' )
  ( spras = 'Z' laspez = 'S' lahq = '0' laiso = 'Z1' )
  ( spras = 'a' laspez = 'S' lahq = '0' laiso = 'AF' )
  ( spras = 'b' laspez = 'S' lahq = '0' laiso = 'IS' )
  ( spras = 'c' laspez = 'S' lahq = '4' laiso = 'CA' )
  ( spras = 'd' laspez = 'S' lahq = '4' laiso = 'SH' )
  ( spras = 'i' laspez = 'S' lahq = '0' laiso = 'ID' )
  ( spras = '묩' laspez = 'M' lahq = '0' laiso = 'HI' )
  ( spras = '뱋' laspez = 'S' lahq = '0' laiso = 'KK' )
  ( spras = '쁩' laspez = 'S' lahq = '0' laiso = 'VI' )
  ( spras = '셩' laspez = 'S' lahq = '1' laiso = 'EN' )


    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt002.
*   insert the new table entries
    INSERT zt002 FROM TABLE @it_zt002.

*   check the result
    SELECT * FROM zt002 INTO TABLE @it_ZT002.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT002 table !' ).

* END OF DATA FILL FOR ZT002 ************************
************************************************************************
* DATA FILL FOR ZT005A  ****************************

    DATA : it_ZT005A TYPE TABLE OF zt005a.

*   fill internal table (itab)
    it_ZT005A = VALUE #(

 ( mandt = '001' addrs = '001' )
 ( mandt = '001' addrs = '002' )
 ( mandt = '001' addrs = '003' )
 ( mandt = '001' addrs = '004' )
 ( mandt = '001' addrs = '005' )
 ( mandt = '001' addrs = '006' )
 ( mandt = '001' addrs = '007' )
 ( mandt = '001' addrs = '008' )
 ( mandt = '001' addrs = '009' )
 ( mandt = '001' addrs = '010' )
 ( mandt = '001' addrs = '011' )
 ( mandt = '001' addrs = '012' )
 ( mandt = '001' addrs = '013' )
 ( mandt = '001' addrs = '014' )
 ( mandt = '001' addrs = '015' )
 ( mandt = '001' addrs = '016' )
 ( mandt = '001' addrs = '017' )
 ( mandt = '001' addrs = '018' )
 ( mandt = '001' addrs = '019' )
 ( mandt = '001' addrs = '021' )
 ( mandt = '001' addrs = '022' )
 ( mandt = '001' addrs = '023' )
 ( mandt = '001' addrs = '027' )
 ( mandt = '001' addrs = '029' )
 ( mandt = '001' addrs = '030' )
 ( mandt = '001' addrs = '031' )
 ( mandt = '001' addrs = '032' )
 ( mandt = '001' addrs = '033' )
 ( mandt = '001' addrs = '113' )

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt005a.
*   insert the new table entries
    INSERT zt005a FROM TABLE @it_zt005a.

*   check the result
    SELECT * FROM zt005a INTO TABLE @it_ZT005A.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT005A table !' ).

* END OF DATA FILL FOR ZT005A ************************
************************************************************************
* DATA FILL FOR ZT005N  ****************************

    DATA : it_ZT005N TYPE TABLE OF zt005n.

*   fill internal table (itab)
    it_ZT005N = VALUE #(

 ( mandt = '001' land1 = 'DE' nmfmt = '01' )
 ( mandt = '001' land1 = 'DE' nmfmt = '02' )
 ( mandt = '001' land1 = 'US' nmfmt = '01' )

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt005n.
*   insert the new table entries
    INSERT zt005n FROM TABLE @it_zt005n.

*   check the result
    SELECT * FROM zt005n INTO TABLE @it_ZT005N.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT005N table !' ).

* END OF DATA FILL FOR ZT005N ************************
************************************************************************
* DATA FILL FOR ZT005  ****************************

    DATA : it_ZT005 TYPE TABLE OF zt005.

*   fill internal table (itab)
    it_ZT005 = VALUE #(

 ( mandt = '001' land1 = 'AD' landk = 'AND' lnplz = '05' prplz = '9' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AD' intca3 = 'AND' intcn3 = '020' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AE' landk = 'UAE' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AE' intca3 = 'ARE' intcn3 = '784' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AF' landk = 'AFG' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AF' intca3 = 'AFG' intcn3 = '004' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AG' landk = 'ANT' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AG' intca3 = 'ATG' intcn3 = '028' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AI' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AI' intca3 = 'AIA' intcn3 = '660' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '12' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AL' landk = 'AL' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AL' intca3 = 'ALB' intcn3 = '008' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AM' landk = 'ARM' lnplz = '04' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'R' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AM' intca3 = 'ARM' intcn3 = '051' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AO' landk = 'ANG' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'P' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AO' intca3 = 'AGO' intcn3 = '024' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AQ' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AQ' intca3 = 'ATA' intcn3 = '010' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '15' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'AR' landk = 'RA' lnplz = '04' prplz = '4' addrs = '010' xplzs = 'X' xplpf = '' spras = 'S' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AR' intca3 = 'ARG' intcn3 = '032' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'AS' landk = 'WS' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AS' intca3 = 'ASM' intcn3 = '016' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'AT' landk = 'A' lnplz = '04' prplz = '4' addrs = '014' xplzs = 'X' xplpf = '' spras = 'D' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AT' intca3 = 'AUT' intcn3 = '040' xegld = 'X' xskfn = '' xmwsn = ''
lnbkn = '11' prbkn = '2' lnblz = '05' prblz = '4' lnpsk = '07' prpsk = '2' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '3' uinln = '11' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'AU' landk = 'AUS' lnplz = '07' prplz = '2' addrs = '009' xplzs = '' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AU' intca3 = 'AUS' intcn3 = '036' xegld = '' xskfn = 'X' xmwsn = 'X'
lnbkn = '09' prbkn = '8' lnblz = '07' prblz = '3' lnpsk = '10' prpsk = '5' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '16' prst1 = '5' lnst2 = '11' prst2 = '5' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'AW' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'N' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AW' intca3 = 'ABW' intcn3 = '533' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'AX' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'U' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AX' intca3 = 'ALA' intcn3 = '248' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'AZ' landk = 'AZ' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'T' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'AZ' intca3 = 'AZE' intcn3 = '031' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BA' landk = 'BIH' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '6' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'BA' intca3 = 'BIH' intcn3 = '070' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BB' landk = 'BDS' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BB' intca3 = 'BRB' intcn3 = '052' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BD' landk = 'BD' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BD' intca3 = 'BGD' intcn3 = '050' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BE' landk = 'B' lnplz = '04' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'F' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'BE' intca3 = 'BEL' intcn3 = '056' xegld = 'X' xskfn = 'X' xmwsn = 'X'
lnbkn = '14' prbkn = '3' lnblz = '00' prblz = '' lnpsk = '14' prpsk = '3' xprbk = 'X' bnkey = '4' lnbks = '03' prbks = '3' xprso = 'X' pruin = '1' uinln = '11' lnst1 = '10' prst1 = '1' lnst2 = '09' prst2 = '1' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'BF' landk = 'BF' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BF' intca3 = 'BFA' intcn3 = '854' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BG' landk = 'BG' lnplz = '04' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'W' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BG' intca3 = 'BGR' intcn3 = '100' xegld = 'X' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'BH' landk = 'BRN' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BH' intca3 = 'BHR' intcn3 = '048' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BI' landk = 'RU' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BI' intca3 = 'BDI' intcn3 = '108' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BJ' landk = 'DY' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BJ' intca3 = 'BEN' intcn3 = '204' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BM' landk = 'BER' lnplz = '05' prplz = '9' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BM' intca3 = 'BMU' intcn3 = '060' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BN' landk = 'BRU' lnplz = '06' prplz = '9' addrs = '' xplzs = 'X' xplpf = '' spras = '7' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BN' intca3 = 'BRN' intcn3 = '096' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'BO' landk = 'BOL' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BO' intca3 = 'BOL' intcn3 = '068' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BQ' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'N' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BQ' intca3 = 'BES' intcn3 = '535' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'BR' landk = 'BRA' lnplz = '09' prplz = '7' addrs = '007' xplzs = 'X' xplpf = '' spras = 'P' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BR' intca3 = 'BRA' intcn3 = '076' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '15' prbkn = '1' lnblz = '09' prblz = '2' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '09' prbks = '2' xprso = 'X' pruin = '' uinln = '00' lnst1 = '14' prst1 = '4' lnst2 = '11' prst2 = '4' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'BS' landk = 'BS' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BS' intca3 = 'BHS' intcn3 = '044' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BT' landk = 'BHT' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BT' intca3 = 'BTN' intcn3 = '064' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'BV' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'O' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BV' intca3 = 'BVT' intcn3 = '074' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BW' landk = 'RB' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BW' intca3 = 'BWA' intcn3 = '072' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BY' landk = 'BY' lnplz = '06' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'R' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BY' intca3 = 'BLR' intcn3 = '112' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'BZ' landk = 'BH' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'BZ' intca3 = 'BLZ' intcn3 = '084' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CA' landk = 'CDN' lnplz = '06' prplz = '9' addrs = '005' xplzs = 'X' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CA' intca3 = 'CAN' intcn3 = '124' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '10' prbkn = '5' lnblz = '10' prblz = '5' lnpsk = '10' prpsk = '5' xprbk = '' bnkey = '1' lnbks = '10' prbks = '5' xprso = '' pruin = '' uinln = '00' lnst1 = '10' prst1 = '5' lnst2 = '10' prst2 = '5' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'CC' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CC' intca3 = 'CCK' intcn3 = '166' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'CD' landk = 'RCB' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CD' intca3 = 'COD' intcn3 = '180' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'CF' landk = 'RCA' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CF' intca3 = 'CAF' intcn3 = '140' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CG' landk = 'RCB' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CG' intca3 = 'COG' intcn3 = '178' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'CH' landk = 'CH' lnplz = '04' prplz = '4' addrs = '011' xplzs = 'X' xplpf = '' spras = 'D' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'CH' intca3 = 'CHE' intcn3 = '756' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '18' prbkn = '5' lnblz = '07' prblz = '2' lnpsk = '11' prpsk = '1' xprbk = 'X' bnkey = '1' lnbks = '07' prbks = '2' xprso = 'X' pruin = '' uinln = '00' lnst1 = '12' prst1 = '3' lnst2 = '07' prst2 = '2' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'CI' landk = 'CI' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CI' intca3 = 'CIV' intcn3 = '384' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CK' landk = 'COI' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CK' intca3 = 'COK' intcn3 = '184' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CL' landk = 'RCH' lnplz = '07' prplz = '1' addrs = '' xplzs = '' xplpf = '' spras = 'S' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CL' intca3 = 'CHL' intcn3 = '152' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '15' prbks = '5' xprso = 'X' pruin = '' uinln = '00' lnst1 = '11' prst1 = '5' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CM' landk = 'RFC' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CM' intca3 = 'CMR' intcn3 = '120' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CN' landk = 'CHI' lnplz = '06' prplz = '4' addrs = '022' xplzs = 'X' xplpf = '' spras = '1' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CN' intca3 = 'CHN' intcn3 = '156' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'CO' landk = 'CO' lnplz = '00' prplz = '' addrs = '010' xplzs = '' xplpf = '' spras = 'S' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CO' intca3 = 'COL' intcn3 = '170' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '' uinln = '00' lnst1 = '16' prst1 = '6' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CR' landk = 'CR' lnplz = '10' prplz = '1' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CR' intca3 = 'CRI' intcn3 = '188' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CS' landk = 'SCG' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = '' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'CS' intca3 = 'SCG' intcn3 = '891' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'CU' landk = 'C' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CU' intca3 = 'CUB' intcn3 = '192' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CV' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'P' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CV' intca3 = 'CPV' intcn3 = '132' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CW' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'N' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CW' intca3 = 'CUW' intcn3 = '531' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'CX' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CX' intca3 = 'CXR' intcn3 = '162' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CY' landk = 'CY' lnplz = '04' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'G' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'CY' intca3 = 'CYP' intcn3 = '196' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'CZ' landk = 'CZ' lnplz = '06' prplz = '9' addrs = '001' xplzs = 'X' xplpf = '' spras = 'C' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'CZ' intca3 = 'CZE' intcn3 = '203' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '18' prbkn = '5' lnblz = '04' prblz = '4' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '04' prbks = '5' xprso = '' pruin = '' uinln = '00' lnst1 = '14' prst1 = '5' lnst2 = '10' prst2 = '5' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'DE' landk = 'D' lnplz = '05' prplz = '4' addrs = '015' xplzs = 'X' xplpf = 'X' spras = 'D' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'DE' intca3 = 'DEU' intcn3 = '276' xegld = 'X' xskfn = '' xmwsn = ''
lnbkn = '14' prbkn = '2' lnblz = '08' prblz = '4' lnpsk = '10' prpsk = '1' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '3' uinln = '11' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'DJ' landk = 'DJI' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'DJ' intca3 = 'DJI' intcn3 = '262' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'DK' landk = 'DK' lnplz = '04' prplz = '4' addrs = '019' xplzs = 'X' xplpf = '' spras = 'K' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'DK' intca3 = 'DNK' intcn3 = '208' xegld = 'X' xskfn = 'X' xmwsn = ''
lnbkn = '10' prbkn = '2' lnblz = '04' prblz = '' lnpsk = '10' prpsk = '1' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '3' uinln = '10' lnst1 = '07' prst1 = '2' lnst2 = '08' prst2 = '4' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'DM' landk = 'WD' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'DM' intca3 = 'DMA' intcn3 = '212' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'DO' landk = 'DOM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'DO' intca3 = 'DOM' intcn3 = '214' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'DZ' landk = 'DZ' lnplz = '05' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'DZ' intca3 = 'DZA' intcn3 = '012' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'EC' landk = 'EC' lnplz = '06' prplz = '9' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'EC' intca3 = 'ECU' intcn3 = '218' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'EE' landk = 'EST' lnplz = '05' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = '9' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'EE' intca3 = 'EST' intcn3 = '233' xegld = 'X' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'EG' landk = 'ET' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'EG' intca3 = 'EGY' intcn3 = '818' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'EH' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'EH' intca3 = 'ESH' intcn3 = '732' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'ER' landk = 'ER' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ER' intca3 = 'ERI' intcn3 = '232' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'ES' landk = 'E' lnplz = '05' prplz = '4' addrs = '001' xplzs = 'X' xplpf = 'X' spras = 'S' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'ES' intca3 = 'ESP' intcn3 = '724' xegld = 'X' xskfn = '' xmwsn = ''
lnbkn = '10' prbkn = '4' lnblz = '08' prblz = '4' lnpsk = '00' prpsk = '' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '3' uinln = '11' lnst1 = '09' prst1 = '3' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'ET' landk = 'ETH' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ET' intca3 = 'ETH' intcn3 = '231' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'FI' landk = 'FIN' lnplz = '05' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'U' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'FI' intca3 = 'FIN' intcn3 = '246' xegld = 'X' xskfn = '' xmwsn = ''
lnbkn = '18' prbkn = '1' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = 'X' bnkey = '4' lnbks = '11' prbks = '1' xprso = 'X' pruin = '3' uinln = '10' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'FJ' landk = 'FJI' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'FJ' intca3 = 'FJI' intcn3 = '242' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'FK' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'FK' intca3 = 'FLK' intcn3 = '238' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'FM' landk = 'FSM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'FM' intca3 = 'FSM' intcn3 = '583' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'FO' landk = 'FR' lnplz = '03' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'K' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'FO' intca3 = 'FRO' intcn3 = '234' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'FR' landk = 'F' lnplz = '05' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'F' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'FR' intca3 = 'FRA' intcn3 = '250' xegld = 'X' xskfn = 'X' xmwsn = ''
lnbkn = '11' prbkn = '3' lnblz = '10' prblz = '4' lnpsk = '10' prpsk = '1' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '3' uinln = '13' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'GA' landk = 'G' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GA' intca3 = 'GAB' intcn3 = '266' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GB' landk = 'GB' lnplz = '09' prplz = '5' addrs = '006' xplzs = 'X' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GB' intca3 = 'GBR' intcn3 = '826' xegld = 'X' xskfn = 'X' xmwsn = 'X'
lnbkn = '08' prbkn = '1' lnblz = '06' prblz = '1' lnpsk = '10' prpsk = '1' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '1' uinln = '14' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'GD' landk = 'WG' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GD' intca3 = 'GRD' intcn3 = '308' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GE' landk = 'GE' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GE' intca3 = 'GEO' intcn3 = '268' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GF' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GF' intca3 = 'GUF' intcn3 = '254' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GG' landk = 'GBG' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GG' intca3 = 'GGY' intcn3 = '831' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'GH' landk = 'GH' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GH' intca3 = 'GHA' intcn3 = '288' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GI' landk = 'GBZ' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GI' intca3 = 'GIB' intcn3 = '292' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GL' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'K' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GL' intca3 = 'GRL' intcn3 = '304' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GM' landk = 'WAG' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GM' intca3 = 'GMB' intcn3 = '270' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GN' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GN' intca3 = 'GIN' intcn3 = '324' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GP' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GP' intca3 = 'GLP' intcn3 = '312' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GQ' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GQ' intca3 = 'GNQ' intcn3 = '226' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GR' landk = 'GR' lnplz = '05' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'G' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'GR' intca3 = 'GRC' intcn3 = '300' xegld = 'X' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = 'X' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GS' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GS' intca3 = 'SGS' intcn3 = '239' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'GT' landk = 'GCA' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GT' intca3 = 'GTM' intcn3 = '320' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GU' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GU' intca3 = 'GUM' intcn3 = '316' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GW' landk = 'GNB' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'P' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GW' intca3 = 'GNB' intcn3 = '624' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'GY' landk = 'GUY' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'GY' intca3 = 'GUY' intcn3 = '328' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'HK' landk = 'HK' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'HK' intca3 = 'HKG' intcn3 = '344' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'12' prbkn = '1' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '03' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'HM' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'HM' intca3 = 'HMD' intcn3 = '334' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'HN' landk = 'HN' lnplz = '06' prplz = '5' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'HN' intca3 = 'HND' intcn3 = '340' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'HR' landk = 'HR' lnplz = '05' prplz = '4' addrs = '010' xplzs = 'X' xplpf = '' spras = '6' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'HR' intca3 = 'HRV' intcn3 = '191' xegld = 'X' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = 'X' pruin = '3' uinln = '13' lnst1 = '00' prst1 = '' lnst2 = '11' prst2 = '4' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'HT' landk = 'RH' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'HT' intca3 = 'HTI' intcn3 = '332' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'HU' landk = 'H' lnplz = '04' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'H' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'HU' intca3 = 'HUN' intcn3 = '348' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '17' prbkn = '1' lnblz = '08' prblz = '4' lnpsk = '00' prpsk = '' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'ID' landk = 'RI' lnplz = '05' prplz = '4' addrs = '027' xplzs = 'X' xplpf = '' spras = 'i' xland = 'I' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ID' intca3 = 'IDN' intcn3 = '360' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'IE' landk = 'IRL' lnplz = '00' prplz = '' addrs = '023' xplzs = '' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'IE' intca3 = 'IRL' intcn3 = '372' xegld = 'X' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '1' uinln = '11' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'IL' landk = 'IL' lnplz = '07' prplz = '2' addrs = '' xplzs = 'X' xplpf = '' spras = 'B' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'IL' intca3 = 'ISR' intcn3 = '376' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = 'X' pruin = '1' uinln = '11' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'IM' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'IM' intca3 = 'IMN' intcn3 = '833' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'IN' landk = 'IND' lnplz = '06' prplz = '4' addrs = '010' xplzs = 'X' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'IN' intca3 = 'IND' intcn3 = '356' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'IO' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'IO' intca3 = 'IOT' intcn3 = '086' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'IQ' landk = 'IRQ' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'IQ' intca3 = 'IRQ' intcn3 = '368' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'IR' landk = 'IR' lnplz = '05' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'IR' intca3 = 'IRN' intcn3 = '364' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'IS' landk = 'IS' lnplz = '03' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'b' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'IS' intca3 = 'ISL' intcn3 = '352' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'IT' landk = 'I' lnplz = '05' prplz = '4' addrs = '002' xplzs = 'X' xplpf = '' spras = 'I' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'IT' intca3 = 'ITA' intcn3 = '380' xegld = 'X' xskfn = '' xmwsn = '' lnbkn
= '12' prbkn = '1' lnblz = '10' prblz = '4' lnpsk = '00' prpsk = '' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '3' uinln = '13' lnst1 = '16' prst1 = '1' lnst2 = '11' prst2 = '4' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'JE' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'JE' intca3 = 'JEY' intcn3 = '832' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'JM' landk = 'JA' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'JM' intca3 = 'JAM' intcn3 = '388' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'JO' landk = 'JOR' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'JO' intca3 = 'JOR' intcn3 = '400' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'JP' landk = 'J' lnplz = '08' prplz = '3' addrs = '113' xplzs = 'X' xplpf = '' spras = 'J' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'JP' intca3 = 'JPN' intcn3 = '392' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '07' prbkn = '2' lnblz = '07' prblz = '4' lnpsk = '07' prpsk = '2' xprbk = 'X' bnkey = '1' lnbks = '07' prbks = '4' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'KE' landk = 'EAK' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KE' intca3 = 'KEN' intcn3 = '404' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KG' landk = 'KS' lnplz = '06' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'R' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KG' intca3 = 'KGZ' intcn3 = '417' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KH' landk = 'K' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KH' intca3 = 'KHM' intcn3 = '116' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KI' landk = 'KIR' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KI' intca3 = 'KIR' intcn3 = '296' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KM' landk = 'COM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KM' intca3 = 'COM' intcn3 = '174' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KN' landk = 'SCN' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KN' intca3 = 'KNA' intcn3 = '659' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KP' landk = 'KP' lnplz = '07' prplz = '5' addrs = '' xplzs = '' xplpf = '' spras = '3' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KP' intca3 = 'PRK' intcn3 = '408' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KR' landk = 'ROK' lnplz = '07' prplz = '9' addrs = '017' xplzs = 'X' xplpf = '' spras = '3' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KR' intca3 = 'KOR' intcn3 = '410' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = 'X' pruin = '' uinln = '00' lnst1 = '13' prst1 = '4' lnst2 = '10' prst2 = '4' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'KW' landk = 'KWT' lnplz = '05' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KW' intca3 = 'KWT' intcn3 = '414' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KY' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KY' intca3 = 'CYM' intcn3 = '136' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'KZ' landk = 'KZ' lnplz = '06' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'R' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'KZ' intca3 = 'KAZ' intcn3 = '398' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'12' prbkn = '4' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LA' landk = 'LAO' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LA' intca3 = 'LAO' intcn3 = '418' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LB' landk = 'RL' lnplz = '09' prplz = '9' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LB' intca3 = 'LBN' intcn3 = '422' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LC' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LC' intca3 = 'LCA' intcn3 = '662' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LI' landk = 'FL' lnplz = '04' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'D' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'LI' intca3 = 'LIE' intcn3 = '438' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '18' prbkn = '5' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '15' prbks = '5' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LK' landk = 'CL' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LK' intca3 = 'LKA' intcn3 = '144' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LR' landk = 'LB' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LR' intca3 = 'LBR' intcn3 = '430' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LS' landk = 'LS' lnplz = '03' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LS' intca3 = 'LSO' intcn3 = '426' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LT' landk = 'LT' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'X' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LT' intca3 = 'LTU' intcn3 = '440' xegld = 'X' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LU' landk = 'L' lnplz = '04' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'F' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'LU' intca3 = 'LUX' intcn3 = '442' xegld = 'X' xskfn = 'X' xmwsn = 'X'
lnbkn = '15' prbkn = '5' lnblz = '00' prblz = '' lnpsk = '15' prpsk = '5' xprbk = '' bnkey = '4' lnbks = '08' prbks = '5' xprso = '' pruin = '3' uinln = '10' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'LV' landk = 'LV' lnplz = '07' prplz = '1' addrs = '' xplzs = 'X' xplpf = '' spras = 'Y' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LV' intca3 = 'LVA' intcn3 = '428' xegld = 'X' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'LY' landk = 'LAR' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'LY' intca3 = 'LBY' intcn3 = '434' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MA' landk = 'MA' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MA' intca3 = 'MAR' intcn3 = '504' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MC' landk = 'MC' lnplz = '05' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'MC' intca3 = 'MCO' intcn3 = '492' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MD' landk = 'MD' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '4' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MD' intca3 = 'MDA' intcn3 = '498' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'ME' landk = 'MNE' lnplz = '05' prplz = '4' addrs = '' xplzs = '' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ME' intca3 = 'MNE' intcn3 = '499' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'MF' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'F' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'MF' intca3 = 'MAF' intcn3 = '663' xegld = 'X' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'MG' landk = 'RM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MG' intca3 = 'MDG' intcn3 = '450' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MH' landk = 'MH' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MH' intca3 = 'MHL' intcn3 = '584' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MK' landk = 'MK' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'MK' intca3 = 'MKD' intcn3 = '807' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'ML' landk = 'RMM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ML' intca3 = 'MLI' intcn3 = '466' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MM' landk = 'MYA' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MM' intca3 = 'MMR' intcn3 = '104' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MN' landk = 'MNG' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MN' intca3 = 'MNG' intcn3 = '496' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MO' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'P' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MO' intca3 = 'MAC' intcn3 = '446' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'MP' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MP' intca3 = 'MNP' intcn3 = '580' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'MQ' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MQ' intca3 = 'MTQ' intcn3 = '474' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MR' landk = 'RIM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MR' intca3 = 'MRT' intcn3 = '478' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MS' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MS' intca3 = 'MSR' intcn3 = '500' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MT' landk = 'M' lnplz = '08' prplz = '9' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MT' intca3 = 'MLT' intcn3 = '470' xegld = 'X' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MU' landk = 'MS' lnplz = '08' prplz = '9' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MU' intca3 = 'MUS' intcn3 = '480' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MV' landk = 'MV' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MV' intca3 = 'MDV' intcn3 = '462' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MW' landk = 'MW' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MW' intca3 = 'MWI' intcn3 = '454' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'MX' landk = 'MEX' lnplz = '05' prplz = '4' addrs = '010' xplzs = '' xplpf = '' spras = 'S' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MX' intca3 = 'MEX' intcn3 = '484' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '10' prbkn = '5' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '04' prbks = '6' xprso = 'X' pruin = '' uinln = '00' lnst1 = '13' prst1 = '1' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'MY' landk = 'MAL' lnplz = '05' prplz = '4' addrs = '010' xplzs = 'X' xplpf = '' spras = '7' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MY' intca3 = 'MYS' intcn3 = '458' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'MZ' landk = 'MOC' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'MZ' intca3 = 'MOZ' intcn3 = '508' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NA' landk = 'NAM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NA' intca3 = 'NAM' intcn3 = '516' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'17' prbkn = '2' lnblz = '06' prblz = '4' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NC' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NC' intca3 = 'NCL' intcn3 = '540' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NE' landk = 'RN' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NE' intca3 = 'NER' intcn3 = '562' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NF' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NF' intca3 = 'NFK' intcn3 = '574' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NG' landk = 'WAN' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NG' intca3 = 'NGA' intcn3 = '566' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NI' landk = 'NIC' lnplz = '09' prplz = '9' addrs = '' xplzs = '' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NI' intca3 = 'NIC' intcn3 = '558' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NL' landk = 'NL' lnplz = '06' prplz = '9' addrs = '003' xplzs = 'X' xplpf = 'X' spras = 'N' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NL' intca3 = 'NLD' intcn3 = '530' xegld = 'X' xskfn = '' xmwsn = ''
lnbkn = '10' prbkn = '4' lnblz = '00' prblz = '' lnpsk = '07' prpsk = '1' xprbk = 'X' bnkey = '4' lnbks = '11' prbks = '1' xprso = 'X' pruin = '3' uinln = '14' lnst1 = '00' prst1 = '' lnst2 = '09' prst2 = '4' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'NO' landk = 'N' lnplz = '04' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'O' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'NO' intca3 = 'NOR' intcn3 = '578' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '11' prbkn = '4' lnblz = '04' prblz = '' lnpsk = '11' prpsk = '2' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '' uinln = '00' lnst1 = '14' prst1 = '1' lnst2 = '09' prst2 = '9' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'NP' landk = 'NEP' lnplz = '06' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NP' intca3 = 'NPL' intcn3 = '524' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NR' landk = 'NAU' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NR' intca3 = 'NRU' intcn3 = '520' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NU' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NU' intca3 = 'NIU' intcn3 = '570' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'NZ' landk = 'NZ' lnplz = '04' prplz = '4' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'NZ' intca3 = 'NZL' intcn3 = '554' xegld = '' xskfn = 'X' xmwsn = 'X' lnbkn
= '14' prbkn = '2' lnblz = '02' prblz = '4' lnpsk = '00' prpsk = '' xprbk = 'X' bnkey = '4' lnbks = '06' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'OM' landk = 'OM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'OM' intca3 = 'OMN' intcn3 = '512' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PA' landk = 'PA' lnplz = '04' prplz = '9' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PA' intca3 = 'PAN' intcn3 = '591' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PE' landk = 'PE' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PE' intca3 = 'PER' intcn3 = '604' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '' uinln = '00' lnst1 = '11' prst1 = '2' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PF' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PF' intca3 = 'PYF' intcn3 = '258' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PG' landk = 'PNG' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PG' intca3 = 'PNG' intcn3 = '598' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PH' landk = 'PI' lnplz = '04' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PH' intca3 = 'PHL' intcn3 = '608' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '13' prst1 = '2' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PK' landk = 'PK' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PK' intca3 = 'PAK' intcn3 = '586' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PL' landk = 'PL' lnplz = '06' prplz = '9' addrs = '001' xplzs = 'X' xplpf = '' spras = 'L' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PL' intca3 = 'POL' intcn3 = '616' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '00' prbkn = '' lnblz = '11' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '13' prst1 = '7' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'PM' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PM' intca3 = 'SPM' intcn3 = '666' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PN' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PN' intca3 = 'PCN' intcn3 = '612' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'PR' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PR' intca3 = 'PRI' intcn3 = '630' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PS' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PS' intca3 = 'PSE' intcn3 = '275' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'PT' landk = 'P' lnplz = '04' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = 'P' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'PT' intca3 = 'PRT' intcn3 = '620' xegld = 'X' xskfn = '' xmwsn = '' lnbkn
= '11' prbkn = '2' lnblz = '08' prblz = '4' lnpsk = '00' prpsk = '' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '3' uinln = '11' lnst1 = '09' prst1 = '4' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'PW' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PW' intca3 = 'PLW' intcn3 = '585' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'PY' landk = 'PY' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'PY' intca3 = 'PRY' intcn3 = '600' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'QA' landk = 'Q' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'QA' intca3 = 'QAT' intcn3 = '634' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'RE' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'RE' intca3 = 'REU' intcn3 = '638' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'RO' landk = 'RO' lnplz = '06' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = '4' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'RO' intca3 = 'ROU' intcn3 = '642' xegld = 'X' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'RS' landk = 'SRB' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'd' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'RS' intca3 = 'SRB' intcn3 = '688' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'RU' landk = 'RUS' lnplz = '06' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'R' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'RU' intca3 = 'RUS' intcn3 = '643' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '18' prbkn = '4' lnblz = '09' prblz = '4' lnpsk = '00' prpsk = '' xprbk = 'X' bnkey = '4' lnbks = '15' prbks = '5' xprso = '' pruin = '' uinln = '00' lnst1 = '12' prst1 = '2' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'RW' landk = 'RWA' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'RW' intca3 = 'RWA' intcn3 = '646' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SA' landk = 'KSA' lnplz = '05' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SA' intca3 = 'SAU' intcn3 = '682' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SB' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SB' intca3 = 'SLB' intcn3 = '090' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SC' landk = 'SY' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SC' intca3 = 'SYC' intcn3 = '690' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SD' landk = 'SUD' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SD' intca3 = 'SDN' intcn3 = '736' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SE' landk = 'S' lnplz = '06' prplz = '9' addrs = '001' xplzs = 'X' xplpf = 'X' spras = 'V' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'SE' intca3 = 'SWE' intcn3 = '752' xegld = 'X' xskfn = '' xmwsn = ''
lnbkn = '11' prbkn = '1' lnblz = '04' prblz = '8' lnpsk = '11' prpsk = '1' xprbk = 'X' bnkey = '1' lnbks = '04' prbks = '8' xprso = 'X' pruin = '3' uinln = '14' lnst1 = '00' prst1 = '' lnst2 = '10' prst2 = '8' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'SG' landk = 'SGP' lnplz = '06' prplz = '4' addrs = '008' xplzs = 'X' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SG' intca3 = 'SGP' intcn3 = '702' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '10' prbkn = '5' lnblz = '10' prblz = '5' lnpsk = '10' prpsk = '5' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '16' prst1 = '5' lnst2 = '11' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'SH' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SH' intca3 = 'SHN' intcn3 = '654' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SI' landk = 'SLO' lnplz = '04' prplz = '4' addrs = '001' xplzs = 'X' xplpf = '' spras = '5' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'SI' intca3 = 'SVN' intcn3 = '705' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SJ' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'O' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SJ' intca3 = 'SJM' intcn3 = '744' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'SK' landk = 'SK' lnplz = '06' prplz = '9' addrs = '001' xplzs = 'X' xplpf = '' spras = 'Q' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'SK' intca3 = 'SVK' intcn3 = '703' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '18' prbkn = '5' lnblz = '04' prblz = '4' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '14' prst1 = '5' lnst2 = '10' prst2 = '5' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'SL' landk = 'WAL' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SL' intca3 = 'SLE' intcn3 = '694' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SM' landk = 'RSM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'I' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'SM' intca3 = 'SMR' intcn3 = '674' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SN' landk = 'SN' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SN' intca3 = 'SEN' intcn3 = '686' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SO' landk = 'SP' lnplz = '09' prplz = '9' addrs = '' xplzs = '' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SO' intca3 = 'SOM' intcn3 = '706' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SR' landk = 'SME' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'N' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SR' intca3 = 'SUR' intcn3 = '740' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SS' landk = 'SSD' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'SS' intca3 = 'SSD' intcn3 = '728' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'ST' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'P' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ST' intca3 = 'STP' intcn3 = '678' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SV' landk = 'ES' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SV' intca3 = 'SLV' intcn3 = '222' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SX' landk = 'NL' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'N' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SX' intca3 = 'SXM' intcn3 = '534' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'SY' landk = 'SYR' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SY' intca3 = 'SYR' intcn3 = '760' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'SZ' landk = 'SD' lnplz = '04' prplz = '9' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'SZ' intca3 = 'SWZ' intcn3 = '748' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TC' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TC' intca3 = 'TCA' intcn3 = '796' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TD' landk = 'TCH' lnplz = '05' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TD' intca3 = 'TCD' intcn3 = '148' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TF' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TF' intca3 = 'ATF' intcn3 = '260' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'TG' landk = 'TG' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TG' intca3 = 'TGO' intcn3 = '768' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TH' landk = 'TH' lnplz = '05' prplz = '4' addrs = '004' xplzs = '' xplpf = '' spras = '2' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TH' intca3 = 'THA' intcn3 = '764' xegld = '' xskfn = 'X' xmwsn = ''
lnbkn = '15' prbkn = '1' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '13' prst1 = '4' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'TJ' landk = 'TJ' lnplz = '06' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'R' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TJ' intca3 = 'TJK' intcn3 = '762' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TK' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TK' intca3 = 'TKL' intcn3 = '772' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'TL' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'P' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TL' intca3 = 'TLS' intcn3 = '626' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00' prst5
= '' )
 ( mandt = '001' land1 = 'TM' landk = 'TM' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'R' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TM' intca3 = 'TKM' intcn3 = '795' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TN' landk = 'TN' lnplz = '04' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TN' intca3 = 'TUN' intcn3 = '788' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TO' landk = 'TO' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TO' intca3 = 'TON' intcn3 = '776' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TP' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TP' intca3 = 'TMP' intcn3 = '626' xegld = '' xskfn = '' xmwsn = '' lnbkn = '00'
prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 = '00'
prst5 = '' )
 ( mandt = '001' land1 = 'TR' landk = 'TR' lnplz = '05' prplz = '4' addrs = '001' xplzs = '' xplpf = '' spras = 'T' xland = 'X' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'TR' intca3 = 'TUR' intcn3 = '792' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TT' landk = 'TT' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TT' intca3 = 'TTO' intcn3 = '780' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TV' landk = 'TUV' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TV' intca3 = 'TUV' intcn3 = '798' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TW' landk = 'RC' lnplz = '05' prplz = '6' addrs = '' xplzs = 'X' xplpf = '' spras = 'M' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TW' intca3 = 'TWN' intcn3 = '158' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'TZ' landk = 'EAT' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'TZ' intca3 = 'TZA' intcn3 = '834' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'UA' landk = 'UA' lnplz = '05' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = '8' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'UA' intca3 = 'UKR' intcn3 = '804' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'18' prbkn = '5' lnblz = '08' prblz = '4' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'UG' landk = 'EAU' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'UG' intca3 = 'UGA' intcn3 = '800' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'UM' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'UM' intca3 = 'UMI' intcn3 = '581' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'US' landk = 'USA' lnplz = '10' prplz = '1' addrs = '004' xplzs = 'X' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'US' intca3 = 'USA' intcn3 = '840' xegld = '' xskfn = 'X' xmwsn = ''
lnbkn = '17' prbkn = '6' lnblz = '09' prblz = '6' lnpsk = '10' prpsk = '6' xprbk = 'X' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '11' prst1 = '5' lnst2 = '10' prst2 = '5' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 =
'' lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'UY' landk = 'ROU' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'S' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'UY' intca3 = 'URY' intcn3 = '858' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'UZ' landk = 'UZ' lnplz = '06' prplz = '4' addrs = '' xplzs = 'X' xplpf = '' spras = 'R' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'UZ' intca3 = 'UZB' intcn3 = '860' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'VA' landk = 'V' lnplz = '00' prplz = '' addrs = '001' xplzs = 'X' xplpf = '' spras = 'I' xland = '' xaddr = '' nmfmt = '' xregs = '' xplst = '' intca = 'VA' intca3 = 'VAT' intcn3 = '336' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'VC' landk = 'WV' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'VC' intca3 = 'VCT' intcn3 = '670' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'VE' landk = 'YV' lnplz = '04' prplz = '4' addrs = '010' xplzs = '' xplpf = '' spras = 'S' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'VE' intca3 = 'VEN' intcn3 = '862' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = 'X' pruin = '' uinln = '00' lnst1 = '12' prst1 = '1' lnst2 = '11' prst2 = '2' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5
= '00' prst5 = '' )
 ( mandt = '001' land1 = 'VG' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'VG' intca3 = 'VGB' intcn3 = '092' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'VI' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'VI' intca3 = 'VIR' intcn3 = '850' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'VN' landk = 'VN' lnplz = '06' prplz = '4' addrs = '029' xplzs = 'X' xplpf = '' spras = '' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'VN' intca3 = 'VNM' intcn3 = '704' xegld = '' xskfn = '' xmwsn = '' lnbkn
= '00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'VU' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'VU' intca3 = 'VUT' intcn3 = '548' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'WF' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'WF' intca3 = 'WLF' intcn3 = '876' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'WS' landk = 'WS' lnplz = '00' prplz = '' addrs = '' xplzs = '' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'WS' intca3 = 'WSM' intcn3 = '882' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'YE' landk = 'ADN' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'A' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'YE' intca3 = 'YEM' intcn3 = '887' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'YT' landk = '' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'F' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'YT' intca3 = 'MYT' intcn3 = '175' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '00' prblz = '' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'ZA' landk = 'ZA' lnplz = '04' prplz = '4' addrs = '012' xplzs = 'X' xplpf = '' spras = 'E' xland = 'X' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ZA' intca3 = 'ZAF' intcn3 = '710' xegld = '' xskfn = '' xmwsn = ''
lnbkn = '17' prbkn = '2' lnblz = '06' prblz = '4' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = ''
lnst5 = '00' prst5 = '' )
 ( mandt = '001' land1 = 'ZM' landk = 'Z' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ZM' intca3 = 'ZMB' intcn3 = '894' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '4' lnbks = '11' prbks = '1' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )
 ( mandt = '001' land1 = 'ZW' landk = 'ZW' lnplz = '00' prplz = '' addrs = '' xplzs = 'X' xplpf = '' spras = 'E' xland = '' xaddr = 'X' nmfmt = '' xregs = '' xplst = '' intca = 'ZW' intca3 = 'ZWE' intcn3 = '716' xegld = '' xskfn = '' xmwsn = '' lnbkn =
'00' prbkn = '' lnblz = '15' prblz = '5' lnpsk = '00' prpsk = '' xprbk = '' bnkey = '1' lnbks = '00' prbks = '' xprso = '' pruin = '' uinln = '00' lnst1 = '00' prst1 = '' lnst2 = '00' prst2 = '' lnst3 = '00' prst3 = '' lnst4 = '00' prst4 = '' lnst5 =
'00' prst5 = '' )


    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt005.
*   insert the new table entries
    INSERT zt005 FROM TABLE @it_zt005.

*   check the result
    SELECT * FROM zt005 INTO TABLE @it_ZT005.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT005 table !' ).

* END OF DATA FILL FOR ZT005 ************************
************************************************************************
* DATA FILL FOR ZT006D  ****************************

    DATA : it_ZT006D TYPE TABLE OF zt006d.

*   fill internal table (itab)
    it_ZT006D = VALUE #(

  ( mandt = '001' dimid = 'AAAADL' leng = '0' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = '' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'ACBAC' leng = '-3' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '1' light = '0' mssie = 'C36' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'ACCEL' leng = '1' mass = '0' timex = '-2' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'MS2' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'CAPACI' leng = '-2' mass = '-1' timex = '4' ecurr = '2' ztemp = '0' molqu = '0' light = '0' mssie = 'F' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'CONDUC' leng = '-3' mass = '-1' timex = '3' ecurr = '2' ztemp = '0' molqu = '0' light = '0' mssie = 'D10' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'DENSI' leng = '-3' mass = '1' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'KGV' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'ECURR' leng = '0' mass = '0' timex = '0' ecurr = '1' ztemp = '0' molqu = '0' light = '0' mssie = 'A' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'ENERGY' leng = '2' mass = '1' timex = '-2' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'J' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'EVARA' leng = '-2' mass = '1' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = '' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'FORCE' leng = '1' mass = '1' timex = '-2' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'N' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'FREQU' leng = '0' mass = '0' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'HZ' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'HYDROL' leng = '3' mass = '0' timex = '-1' ecurr = '0' ztemp = '0' molqu = '-1' light = '0' mssie = 'LMS' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'LENGTH' leng = '1' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'M' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'LIGHT' leng = '0' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '1' mssie = 'CD' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MAGNFD' leng = '0' mass = '1' timex = '-2' ecurr = '-1' ztemp = '0' molqu = '0' light = '0' mssie = 'TES' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MAPER' leng = '-2' mass = '0' timex = '2' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'kgj' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MASFLO' leng = '0' mass = '1' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'KGS' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MASS' leng = '0' mass = '1' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'KG' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MASSBD' leng = '-2' mass = '1' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'KGF' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MOENER' leng = '2' mass = '1' timex = '-2' ecurr = '0' ztemp = '0' molqu = '1' light = '0' mssie = 'JMO' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MOLMAS' leng = '0' mass = '1' timex = '0' ecurr = '0' ztemp = '0' molqu = '-1' light = '0' mssie = 'KGM' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MOLQU' leng = '0' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '1' light = '0' mssie = 'MOL' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'MPROPO' leng = '0' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '11' mssie = 'KGK' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'PERMEA' leng = '-2' mass = '1' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '10' mssie = 'PMR' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'POINTS' leng = '0' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '9' mssie = 'P' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'POWER' leng = '2' mass = '1' timex = '-3' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'W' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'PRESS' leng = '-1' mass = '1' timex = '-2' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'PA' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'PROPOR' leng = '0' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '10' mssie = '1' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'RESIST' leng = '2' mass = '1' timex = '-3' ecurr = '-2' ztemp = '0' molqu = '0' light = '0' mssie = 'OHM' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'SPAEQU' leng = '0' mass = '-1' timex = '0' ecurr = '0' ztemp = '0' molqu = '1' light = '0' mssie = 'MOK' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'SPARAD' leng = '0' mass = '-1' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'BQK' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'SPEED' leng = '1' mass = '0' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'M/S' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'SPENER' leng = '2' mass = '0' timex = '-2' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'JKG' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'SPHCAP' leng = '2' mass = '0' timex = '-2' ecurr = '0' ztemp = '-1' molqu = '0' light = '0' mssie = 'JKK' temp_dep = 'X' press_dep = '' )
 ( mandt = '001' dimid = 'SPREST' leng = '3' mass = '1' timex = '-3' ecurr = '-2' ztemp = '0' molqu = '0' light = '0' mssie = 'OM' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'STEXKZ' leng = '0' mass = '1' timex = '-3' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'MPZ' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'SURFAC' leng = '2' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'M2' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'SURFTE' leng = '0' mass = '1' timex = '-2' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'NM' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'SURINV' leng = '-2' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'M2I' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'ZTEMP' leng = '0' mass = '0' timex = '0' ecurr = '0' ztemp = '1' molqu = '0' light = '0' mssie = 'K' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'ZTEMPRT' leng = '0' mass = '0' timex = '-1' ecurr = '0' ztemp = '1' molqu = '0' light = '0' mssie = 'KMS' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'THCOND' leng = '1' mass = '1' timex = '-3' ecurr = '0' ztemp = '-1' molqu = '0' light = '0' mssie = 'WMK' temp_dep = 'X' press_dep = '' )
 ( mandt = '001' dimid = 'TIME' leng = '0' mass = '0' timex = '1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'S' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'TKONZ' leng = '-3' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'TM3' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'VISDYN' leng = '-1' mass = '1' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'PAS' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'VISKIN' leng = '2' mass = '0' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'M2S' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'VOLFLO' leng = '3' mass = '0' timex = '-1' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'M3S' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'VOLTAG' leng = '2' mass = '1' timex = '-3' ecurr = '-1' ztemp = '0' molqu = '0' light = '0' mssie = 'V' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'VOLUME' leng = '3' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '0' mssie = 'M3' temp_dep = '' press_dep = '' )
 ( mandt = '001' dimid = 'VPROPO' leng = '0' mass = '0' timex = '0' ecurr = '0' ztemp = '0' molqu = '0' light = '12' mssie = 'KMK' temp_dep = '' press_dep = '' )


    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt006d.
*   insert the new table entries
    INSERT zt006d FROM TABLE @it_zt006d.

*   check the result
    SELECT * FROM zt006d INTO TABLE @it_ZT006D.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT006D table !' ).

* END OF DATA FILL FOR ZT006D ************************
************************************************************************
* DATA FILL FOR ZT006I  ****************************

    DATA : it_ZT006I TYPE TABLE OF zt006i.

*   fill internal table (itab)
    it_ZT006I = VALUE #(

 ( mandt = '001' isocode = '23' )
 ( mandt = '001' isocode = '28' )
 ( mandt = '001' isocode = '2J' )
 ( mandt = '001' isocode = '2M' )
 ( mandt = '001' isocode = '2X' )
 ( mandt = '001' isocode = '2Z' )
 ( mandt = '001' isocode = '3B' )
 ( mandt = '001' isocode = '3H' )
 ( mandt = '001' isocode = '4G' )
 ( mandt = '001' isocode = '4H' )
 ( mandt = '001' isocode = '4K' )
 ( mandt = '001' isocode = '4O' )
 ( mandt = '001' isocode = '4P' )
 ( mandt = '001' isocode = '4T' )
 ( mandt = '001' isocode = '59' )
 ( mandt = '001' isocode = '61' )
 ( mandt = '001' isocode = 'A18' )
 ( mandt = '001' isocode = 'A87' )
 ( mandt = '001' isocode = 'A93' )
 ( mandt = '001' isocode = 'A97' )
 ( mandt = '001' isocode = 'ACR' )
 ( mandt = '001' isocode = 'AMP' )
 ( mandt = '001' isocode = 'ANN' )
 ( mandt = '001' isocode = 'B0' )
 ( mandt = '001' isocode = 'B11' )
 ( mandt = '001' isocode = 'B15' )
 ( mandt = '001' isocode = 'B22' )
 ( mandt = '001' isocode = 'B25' )
 ( mandt = '001' isocode = 'B34' )
 ( mandt = '001' isocode = 'B42' )
 ( mandt = '001' isocode = 'B44' )
 ( mandt = '001' isocode = 'B45' )
 ( mandt = '001' isocode = 'B47' )
 ( mandt = '001' isocode = 'B49' )
 ( mandt = '001' isocode = 'B73' )
 ( mandt = '001' isocode = 'B75' )
 ( mandt = '001' isocode = 'B78' )
 ( mandt = '001' isocode = 'B84' )
 ( mandt = '001' isocode = 'B98' )
 ( mandt = '001' isocode = 'BAR' )
 ( mandt = '001' isocode = 'BG' )
 ( mandt = '001' isocode = 'BO' )
 ( mandt = '001' isocode = 'BX' )
 ( mandt = '001' isocode = 'C10' )
 ( mandt = '001' isocode = 'C15' )
 ( mandt = '001' isocode = 'C16' )
 ( mandt = '001' isocode = 'C18' )
 ( mandt = '001' isocode = 'C19' )
 ( mandt = '001' isocode = 'C22' )
 ( mandt = '001' isocode = 'C24' )
 ( mandt = '001' isocode = 'C26' )
 ( mandt = '001' isocode = 'C29' )
 ( mandt = '001' isocode = 'C31' )
 ( mandt = '001' isocode = 'C34' )
 ( mandt = '001' isocode = 'C36' )
 ( mandt = '001' isocode = 'C38' )
 ( mandt = '001' isocode = 'C39' )
 ( mandt = '001' isocode = 'C41' )
 ( mandt = '001' isocode = 'C45' )
 ( mandt = '001' isocode = 'C47' )
 ( mandt = '001' isocode = 'C55' )
 ( mandt = '001' isocode = 'C56' )
 ( mandt = '001' isocode = 'C60' )
 ( mandt = '001' isocode = 'C61' )
 ( mandt = '001' isocode = 'C62' )
 ( mandt = '001' isocode = 'C65' )
 ( mandt = '001' isocode = 'CA' )
 ( mandt = '001' isocode = 'CDL' )
 ( mandt = '001' isocode = 'CEL' )
 ( mandt = '001' isocode = 'CLT' )
 ( mandt = '001' isocode = 'CMK' )
 ( mandt = '001' isocode = 'CMQ' )
 ( mandt = '001' isocode = 'CMT' )
 ( mandt = '001' isocode = 'CR' )
 ( mandt = '001' isocode = 'CS' )
 ( mandt = '001' isocode = 'CT' )
 ( mandt = '001' isocode = 'D10' )
 ( mandt = '001' isocode = 'D33' )
 ( mandt = '001' isocode = 'D41' )
 ( mandt = '001' isocode = 'D46' )
 ( mandt = '001' isocode = 'D53' )
 ( mandt = '001' isocode = 'D87' )
 ( mandt = '001' isocode = 'DAY' )
 ( mandt = '001' isocode = 'DD' )
 ( mandt = '001' isocode = 'DMQ' )
 ( mandt = '001' isocode = 'DMT' )
 ( mandt = '001' isocode = 'DR' )
 ( mandt = '001' isocode = 'DZN' )
 ( mandt = '001' isocode = 'EA' )
 ( mandt = '001' isocode = 'FAH' )
 ( mandt = '001' isocode = 'FAR' )
 ( mandt = '001' isocode = 'FOT' )
 ( mandt = '001' isocode = 'FTK' )
 ( mandt = '001' isocode = 'FTQ' )
 ( mandt = '001' isocode = 'GE' )
 ( mandt = '001' isocode = 'GJ' )
 ( mandt = '001' isocode = 'GK' )
 ( mandt = '001' isocode = 'GL' )
 ( mandt = '001' isocode = 'GLL' )
 ( mandt = '001' isocode = 'GM' )
 ( mandt = '001' isocode = 'GP' )
 ( mandt = '001' isocode = 'GQ' )
 ( mandt = '001' isocode = 'GRM' )
 ( mandt = '001' isocode = 'GRO' )
 ( mandt = '001' isocode = 'GV' )
 ( mandt = '001' isocode = 'HAR' )
 ( mandt = '001' isocode = 'HLT' )
 ( mandt = '001' isocode = 'HTZ' )
 ( mandt = '001' isocode = 'HUR' )
 ( mandt = '001' isocode = 'IE' )
 ( mandt = '001' isocode = 'INH' )
 ( mandt = '001' isocode = 'INK' )
 ( mandt = '001' isocode = 'INQ' )
 ( mandt = '001' isocode = 'J2' )
 ( mandt = '001' isocode = 'JOU' )
 ( mandt = '001' isocode = 'KEL' )
 ( mandt = '001' isocode = 'KGM' )
 ( mandt = '001' isocode = 'KGS' )
 ( mandt = '001' isocode = 'KHZ' )
 ( mandt = '001' isocode = 'KJO' )
 ( mandt = '001' isocode = 'KMH' )
 ( mandt = '001' isocode = 'KMK' )
 ( mandt = '001' isocode = 'KMQ' )
 ( mandt = '001' isocode = 'KMT' )
 ( mandt = '001' isocode = 'KPA' )
 ( mandt = '001' isocode = 'KVA' )
 ( mandt = '001' isocode = 'KVT' )
 ( mandt = '001' isocode = 'KWH' )
 ( mandt = '001' isocode = 'KWT' )
 ( mandt = '001' isocode = 'L2' )
 ( mandt = '001' isocode = 'LBR' )
 ( mandt = '001' isocode = 'LTR' )
 ( mandt = '001' isocode = 'M1' )
 ( mandt = '001' isocode = 'MAW' )
 ( mandt = '001' isocode = 'MBR' )
 ( mandt = '001' isocode = 'MGM' )
 ( mandt = '001' isocode = 'MHZ' )
 ( mandt = '001' isocode = 'MIK' )
 ( mandt = '001' isocode = 'MIL' )
 ( mandt = '001' isocode = 'MIN' )
 ( mandt = '001' isocode = 'MLT' )
 ( mandt = '001' isocode = 'MMK' )
 ( mandt = '001' isocode = 'MMQ' )
 ( mandt = '001' isocode = 'MMT' )
 ( mandt = '001' isocode = 'MON' )
 ( mandt = '001' isocode = 'MPA' )
 ( mandt = '001' isocode = 'MQH' )
 ( mandt = '001' isocode = 'MQS' )
 ( mandt = '001' isocode = 'MSK' )
 ( mandt = '001' isocode = 'MTK' )
 ( mandt = '001' isocode = 'MTQ' )
 ( mandt = '001' isocode = 'MTR' )
 ( mandt = '001' isocode = 'MTS' )
 ( mandt = '001' isocode = 'MVA' )
 ( mandt = '001' isocode = 'MWH' )
 ( mandt = '001' isocode = 'NA' )
 ( mandt = '001' isocode = 'NEW' )
 ( mandt = '001' isocode = 'OHM' )
 ( mandt = '001' isocode = 'ONZ' )
 ( mandt = '001' isocode = 'OZA' )
 ( mandt = '001' isocode = 'P1' )
 ( mandt = '001' isocode = 'PA' )
 ( mandt = '001' isocode = 'PAL' )
 ( mandt = '001' isocode = 'PCE' )
 ( mandt = '001' isocode = 'PF' )
 ( mandt = '001' isocode = 'PK' )
 ( mandt = '001' isocode = 'PR' )
 ( mandt = '001' isocode = 'PT' )
 ( mandt = '001' isocode = 'QT' )
 ( mandt = '001' isocode = 'RO' )
 ( mandt = '001' isocode = 'S4' )
 ( mandt = '001' isocode = 'SEC' )
 ( mandt = '001' isocode = 'SMI' )
 ( mandt = '001' isocode = 'STN' )
 ( mandt = '001' isocode = 'TNE' )
 ( mandt = '001' isocode = 'VLT' )
 ( mandt = '001' isocode = 'WEE' )
 ( mandt = '001' isocode = 'WTT' )
 ( mandt = '001' isocode = 'YDK' )
 ( mandt = '001' isocode = 'YDQ' )
 ( mandt = '001' isocode = 'YRD' )

    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt006i.
*   insert the new table entries
    INSERT zt006i FROM TABLE @it_zt006i.

*   check the result
    SELECT * FROM zt006i INTO TABLE @it_ZT006I.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT006I table !' ).

* END OF DATA FILL FOR ZT006I ************************
************************************************************************
* DATA FILL FOR ZT006  ****************************

    DATA : it_ZT006 TYPE TABLE OF zt006.

*   fill internal table (itab)
    it_ZT006 = VALUE #(

 ( MANDT = '001' MSEHI = '%' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PROPOR' ZAEHL = '1' NENNR = '100' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'P1' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '%O' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PROPOR' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '1' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PROPOR' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '10' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '86400' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'DAY' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '22S' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VISKIN' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '2M' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '1' NENNR = '1' EXP10 = '-2' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '2M' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '2X' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '1' NENNR = '60' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '2X' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '4G' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '4G' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '4O' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'CAPACI' ZAEHL = '1' NENNR = '1' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '4O' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = '4T' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'CAPACI' ZAEHL = '1' NENNR = '1' EXP10 = '-12' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '4T' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'A' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ECURR' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'AMP' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'A87' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'RESIST' ZAEHL = '1' NENNR = '1' EXP10 = '9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'A87' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'A93' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1' EXP10 = '-3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'A93' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'ACR' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '1210000' NENNR = '299' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'B34' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B34' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'B45' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOLQU' ZAEHL = '1' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B45' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'B47' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'FORCE' ZAEHL = '1' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B47' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'B73' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'FORCE' ZAEHL = '1' NENNR = '1' EXP10 = '6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B73' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'B75' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'RESIST' ZAEHL = '1' NENNR = '1' EXP10 = '6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B75' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'B78' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLTAG' ZAEHL = '1' NENNR = '1' EXP10 = '6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B78' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'B84' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ECURR' ZAEHL = '1' NENNR = '1' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B84' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'BAG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'BG' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'BAR' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '100000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'BAR' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'BOT' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'BO' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'BQK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPARAD' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'C10' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'CAPACI' ZAEHL = '1' NENNR = '1' EXP10 = '-3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C10' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'C36' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ACBAC' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '3' ISOCODE = 'C36' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'C38' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ACBAC' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '3' ISOCODE = 'C38' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'C39' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ECURR' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C39' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'C3S' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLFLO' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '2J' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'C41' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'CAPACI' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C41' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'C56' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '1' NENNR = '1' EXP10 = '6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C56' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'CCM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'CMQ' ZPRIMARY = 'X'
TEMP_VALUE = '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'CD' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LIGHT' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'CDL' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'CDM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'DMQ' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'CM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '1' NENNR = '100' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'CMT' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'CM2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '1' NENNR = '10000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'CMK' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'CMH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '1' NENNR = '360000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'CS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'CS' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'CTL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '100000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'D10' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'CONDUC' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '3' ISOCODE = 'D10' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'D41' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'D41' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'D46' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'POWER' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'D46' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'DEG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '99' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '1' ISOCODE = 'DD' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'DM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = 'X' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '1' NENNR = '10' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'DMT' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'DR' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'DR' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'DZ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'DZN' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'EA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'EA' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'EE' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'EML' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'F' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'CAPACI' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'FAR' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'FA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TEMP' ZAEHL = '5' NENNR = '9' EXP10 = '0' ADDKO = '255.372222' EXPON = '0' DECAN = '0' ISOCODE = 'FAH' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'FT' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '381' NENNR = '1250' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'FT2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '250' NENNR = '2691' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'FT3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '28316736' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'G' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASS' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'GRM' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'G/L' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GAU' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '99' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GC' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TEMP' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '273.150000' EXPON = '0' DECAN = '0' ISOCODE = 'CEL' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GHG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '100' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GJ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ENERGY' ZAEHL = '1' NENNR = '1' EXP10 = '9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GKG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GLI' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'GL' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GLL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '3785344' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GLM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '473168' NENNR = '201168' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = ''
TEMP_VALUE = '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOLMAS' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GM2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASSBD' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GPH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLFLO' ZAEHL = '3785344' NENNR = '3600' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = ''
TEMP_VALUE = '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GQ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'GQ' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GRO' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'GRO' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'GW' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'H' KZEX3 = '' KZEX6 = '' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '3600' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'HAR' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '10000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'HL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '10' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'HLT' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'HPA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '100' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'A97' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'HZ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'FREQU' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'HTZ' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'IN' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '127' NENNR = '5000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'INH' ZPRIMARY = 'X' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'IN2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '125' NENNR = '193752' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'IN3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '16387' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'J' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ENERGY' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'JOU' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'JHR' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '31536000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'ANN' ZPRIMARY = 'X' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'JKG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPENER' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'JKK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPHCAP' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B11' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'JMO' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOENER' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'K' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TEMP' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KEL' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ECURR' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B22' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KAN' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'CA' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KAR' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'CT' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KBK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPARAD' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASS' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KGM' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KGF' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASSBD' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '28' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KGK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KGM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOLMAS' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KGS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASFLO' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KGS' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KGV' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KMQ' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KGW' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KHZ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'FREQU' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KHZ' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KI' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'BX' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KJ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ENERGY' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KJO' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KJK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPENER' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KJM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOENER' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KMT' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KM2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '1000000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KMH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '10' NENNR = '36' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KMH' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KMK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KMN' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TEMPRT' ZAEHL = '1' NENNR = '60' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KMS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TEMPRT' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KOH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'RESIST' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B49' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KPA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '1' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KPA' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KT' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASS' ZAEHL = '1000000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KV' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLTAG' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KVT' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KVA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'POWER' ZAEHL = '1' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KVA' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KW' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'POWER' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KWT' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KWH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '99' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ENERGY' ZAEHL = '3600' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'KWH' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'KWK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'L' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'LTR' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'L2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLFLO' ZAEHL = '1' NENNR = '60000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'L2' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'LB' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASS' ZAEHL = '453592' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'LE' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = 'X' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C62' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'LHK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '1' NENNR = '1' EXP10 = '-8' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'LMS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'HYDROL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'LPH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLFLO' ZAEHL = '1' NENNR = '3600000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '2' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MTR' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M%' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '100' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M%O' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M/S' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MTS' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MTK' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M2I' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURINV' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M2S' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VISKIN' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'S4' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MTQ' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M3D' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLFLO' ZAEHL = '1' NENNR = '86400' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'M3S' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLFLO' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MQS' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ECURR' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '4K' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MBA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '100' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MBR' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MBZ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'STEXKZ' ZAEHL = '100000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MEJ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ENERGY' ZAEHL = '1000000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASS' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MGM' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MGF' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASSBD' ZAEHL = '1' NENNR = '100' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MGG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MGK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MGL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'M1' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MGQ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'GP' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MGW' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'POWER' ZAEHL = '1000000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MAW' ZPRIMARY = 'X' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MHZ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'FREQU' ZAEHL = '1000000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MHZ' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MI' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '201168' NENNR = '125' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'SMI' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MI2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '774400000' NENNR = '299' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = ''
TEMP_VALUE = '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MIM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '4H' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MIN' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '60' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MIN' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MIS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B98' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MJ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ENERGY' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C15' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'ML' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MLT' ZPRIMARY = 'X' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MLK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MLW' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MMT' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MM2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '1' NENNR = '1000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MMK' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MMA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '1' NENNR = '31536' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MMG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPAEQU' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MMH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '1' NENNR = '3600000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MMK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPAEQU' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'D87' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MMO' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOLQU' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C18' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MMQ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MMQ' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MMS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C16' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MNM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFTE' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MOK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPAEQU' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C19' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MOL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOLQU' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C34' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MON' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '2592000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MON' ZPRIMARY = 'X' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MPA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '1000000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MPA' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MPB' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MPG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURINV' ZAEHL = '201168' NENNR = '473168' EXP10 = '6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = ''
TEMP_VALUE = '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MPM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MPS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VISDYN' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C24' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MPT' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '-12' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MPZ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'STEXKZ' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MQH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLFLO' ZAEHL = '1' NENNR = '3600' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MQH' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C26' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MS2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ACCEL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MSK' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MTE' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAGNFD' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C29' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MTS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPEED' ZAEHL = '1' NENNR = '3600' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MTS' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MV' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLTAG' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '2Z' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MVA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'POWER' ZAEHL = '1' NENNR = '1' EXP10 = '6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MVA' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MW' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'POWER' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C31' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'MWH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ENERGY' ZAEHL = '3600' NENNR = '1' EXP10 = '6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'N' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'FORCE' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'NEW' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'NAM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '1' NENNR = '1000000' EXP10 = '-3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C45' ZPRIMARY = ''
TEMP_VALUE = '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'NM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFTE' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'NS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '1' NENNR = '1000000' EXP10 = '-3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C47' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'OCM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPREST' ZAEHL = '1' NENNR = '100' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C60' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'OHM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'RESIST' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'OHM' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'OM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPREST' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C61' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'OZ' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASS' ZAEHL = '56699' NENNR = '2000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'ONZ' ZPRIMARY = ''
TEMP_VALUE = '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'OZA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '29573' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'P' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'POINTS' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'PAL' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PAA' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'PR' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PAK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'PK' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PAL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'PF' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PAS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VISDYN' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'C65' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PMI' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'FREQU' ZAEHL = '1' NENNR = '60' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PMR' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PERMEA' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '3' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PPB' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PROPOR' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PPM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PROPOR' ZAEHL = '1' NENNR = '1' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '59' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PPT' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PROPOR' ZAEHL = '1' NENNR = '1' EXP10 = '-12' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PRM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PERMEA' ZAEHL = '1' NENNR = '6000000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '3' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PRS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'IE' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PS' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '1' NENNR = '1' EXP10 = '-12' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'PT' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '473168' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'QT' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '946336' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'RHO' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '23' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'ROL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'RO' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'S' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'SEC' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'ST' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'PCE' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'STD' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '3600' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '1' ISOCODE = 'HUR' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'TAG' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '86400' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'DAY' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'TC3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TKONZ' ZAEHL = '1000000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'TES' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAGNFD' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'D33' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'TH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'MIL' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'TM3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TKONZ' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'TO' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '3' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASS' ZAEHL = '1000' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'TNE' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'TON' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MASS' ZAEHL = '113398' NENNR = '125' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'STN' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'TST' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '12' NENNR = '17' EXP10 = '0' ADDKO = '9.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'UGL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'V' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLTAG' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'VLT' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'V%' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VPROPO' ZAEHL = '1' NENNR = '100' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'V%O' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VPROPO' ZAEHL = '1' NENNR = '1000' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'V01' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'CONDUC' ZAEHL = '1' NENNR = '1' EXP10 = '-4' ADDKO = '0.000000' EXPON = '0' DECAN = '3' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'V02' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'ACBAC' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '3' ISOCODE = 'C36' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'VAL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = 'X' KZ1EH = '' KZ2EH = '' DIMID = 'AAAADL' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'VPB' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'VPM' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'VPT' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '-12' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'W' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'POWER' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'WTT' ZPRIMARY = 'X' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'WCH' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'TIME' ZAEHL = '604800' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'WEE' ZPRIMARY = 'X' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'WMK' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'THCOND' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'D53' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'WTL' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'EVARA' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'YD' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'LENGTH' ZAEHL = '1143' NENNR = '1250' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'YD2' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SURFAC' ZAEHL = '250' NENNR = '299' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'YD3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'VOLUME' ZAEHL = '764551872' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'bbl' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '884813557' NENNR = '1' EXP10 = '-5' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'bft' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '372589453' NENNR = '1' EXP10 = '-4' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'B0' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'bgl' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '278716254' NENNR = '1' EXP10 = '-3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'btl' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPENER' ZAEHL = '2326' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'gj3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '1' NENNR = '1' EXP10 = '6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'gjm' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '1' NENNR = '1' EXP10 = '9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'gjt' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPENER' ZAEHL = '110231131' NENNR = '1' EXP10 = '-2' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'jm3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'kgb' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = 'X' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '838641437' NENNR = '1' EXP10 = '-8' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'kgj' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAPER' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'kgm' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAPER' ZAEHL = '947817120' NENNR = '1' EXP10 = '-18' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'kgs' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '372397870' NENNR = '1' EXP10 = '-7' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'kgt' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '110231131' NENNR = '1' EXP10 = '-11' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'kml' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOLMAS' ZAEHL = '1' NENNR = '1' EXP10 = '-3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'lbb' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAPER' ZAEHL = '429922614' NENNR = '1' EXP10 = '-12' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'lbg' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '119826420' NENNR = '1' EXP10 = '-6' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = 'GE' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'lbl' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MOLMAS' ZAEHL = '1' NENNR = '1' EXP10 = '-3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'lbm' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAPER' ZAEHL = '429922614' NENNR = '1' EXP10 = '-18' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE
= '0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'lbs' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '168916832' NENNR = '1' EXP10 = '-7' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'lbt' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '5' NENNR = '1' EXP10 = '-4' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'mbb' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'PRESS' ZAEHL = '884813557' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'mbt' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'SPENER' ZAEHL = '1163' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'tbl' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '838641437' NENNR = '1' EXP10 = '-5' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'tbt' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAPER' ZAEHL = '947817120' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'tgl' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '239652841' NENNR = '1' EXP10 = '-3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE =
'0' TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'tjl' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAPER' ZAEHL = '1' NENNR = '1' EXP10 = '3' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'tm3' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'DENSI' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'tt' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MPROPO' ZAEHL = '1' NENNR = '1' EXP10 = '0' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )
 ( MANDT = '001' MSEHI = 'ttj' KZEX3 = 'X' KZEX6 = 'X' ANDEC = '0' KZKEH = '' KZWOB = '' KZ1EH = '' KZ2EH = '' DIMID = 'MAPER' ZAEHL = '1' NENNR = '1' EXP10 = '-9' ADDKO = '0.000000' EXPON = '0' DECAN = '0' ISOCODE = '' ZPRIMARY = '' TEMP_VALUE = '0'
TEMP_UNIT = '' FAMUNIT = '' PRESS_VAL = '0' PRESS_UNIT = '' )


    ).

*   Delete the possible entries in the database table - in case it was already filled
    DELETE FROM zt006.
*   insert the new table entries
    INSERT zt006 FROM TABLE @it_zt006.

*   check the result
    SELECT * FROM zt006 INTO TABLE @it_ZT006.
    Out->write( sy-dbcnt ).
    Out->write( 'Data inserted successfully for ZT006 table !' ).

* END OF DATA FILL FOR ZT006 ************************
************************************************************************

  ENDMETHOD.

ENDCLASS.