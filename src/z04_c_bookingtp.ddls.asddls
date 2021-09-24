@AbapCatalog.sqlViewName: 'Z04CBOOKTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'exercise 5.2'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true

@ObjectModel: {
  semanticKey: ['AirlineID','ConnectionNumber','FlightDate','BookingNumber'],
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true
}


define view Z04_C_BOOKINGTP as select from DS4_I_BOOKINGTP
association [1] to Z04_C_CUSTOMERTP as _Customer
    on $projection.CustomerGuid = _Customer.CustomerGuid {
    key DS4_I_BOOKINGTP.BookingGuid,
    DS4_I_BOOKINGTP.AirlineID,
    DS4_I_BOOKINGTP.ConnectionNumber,
    DS4_I_BOOKINGTP.FlightDate,
    DS4_I_BOOKINGTP.BookingNumber,
    DS4_I_BOOKINGTP.BookingDate,
    DS4_I_BOOKINGTP.Class,
    DS4_I_BOOKINGTP.ForeignCurrencyPayment,
    DS4_I_BOOKINGTP.ForeignCurrency,
    DS4_I_BOOKINGTP.AgencyNumber,
    DS4_I_BOOKINGTP.CustomerGuid,
    DS4_I_BOOKINGTP.IsCancelled,
    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
    _Customer
}
