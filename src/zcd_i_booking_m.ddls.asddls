@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCD_I_BOOKING_M
  as select from ztb_booking_m as Booking
  association        to parent ZCD_I_TRAVEL_M as _Travel     on  $projection.travel_id = _Travel.travel_id
  composition [0..*] of ZCD_I_BOOKSUPPL_M     as _BookSupplement
  association [1..1] to /DMO/I_Customer       as _Customer   on  $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier        as _Carrier    on  $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection     as _Connection on  $projection.carrier_id    = _Connection.AirlineID
                                                             and $projection.connection_id = _Connection.ConnectionID
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      currency_code,
      booking_status,
      last_changed_at,
      /* Associations */
      _Travel,
      _BookSupplement,
      _Customer,
      _Carrier,
      _Connection
}
