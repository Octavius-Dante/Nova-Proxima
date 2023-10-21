@AbapCatalog.sqlViewName: 'ZCDS_TEST_22'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unit Conversion'
define view ZCDS_609879_22 


as select from spfli 
{

    carrid,
    connid,

// Unit conversion fucntion simple example
    
    @Semantics.quantity.unitOfMeasure: 'DISTID'
    UNIT_CONVERSION( quantity    => distance,
                     source_unit => distid, 
                     target_unit => cast('MI' as abap.unit)
                    ) as distance_conv,
                    
    @Semantics.unitOfMeasure: true
    cast('MI' as abap.unit) as distid

}


/*
as select from saplane
{
      @EndUserText.label: 'Plane Type'
      key planetype as PlaneType,

      @EndUserText.label: 'Tank Cap'
      tankcap   as TankCapacity,

      @EndUserText.label: 'Tank Cap (UOM)'
      cap_unit  as CapacityUnit,

      @EndUserText.label: 'Tank Cap (in Cubic Meters)'
      unit_conversion(
        quantity    => tankcap,
        source_unit => cap_unit,
        target_unit => cast('M3' as abap.unit)
      )         as TankCapacityInM3,

      @EndUserText.label: 'Tank Cap (in Cubic Yard)'
      unit_conversion(
        quantity    => tankcap,
        source_unit => cap_unit,
        target_unit => cast('YD3' as abap.unit)
      )         as TankCapacityInYD3
}
*/
// Unit type M3 & YD3 is not available in the system so this cds wont generate output 