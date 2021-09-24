@AbapCatalog.sqlViewName: 'Z04CCUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'exercise 5'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Search.searchable: true
@Metadata.allowExtensions: true

@ObjectModel: {
    transactionalProcessingDelegated: true,
    compositionRoot: true,  
    semanticKey: ['CustomerNumber'],
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true
}

define view Z04_C_CUSTOMERTP as select from DS4_I_CUSTOMERTP
    association[*] to Z04_C_BOOKINGTP as _Booking 
        on $projection.CustomerGuid = _Booking.CustomerGuid {
    key CustomerGuid,
    CustomerNumber,
    Form,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    CustomerName,
    Street,
    PostCode,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    City,
    Country,
    Email,
    Telephone,
    Discount,
    @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
    _Booking
}
