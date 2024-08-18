@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Consumption View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCD_C_BOOKSUPPL_P
  as projection on ZCD_I_BOOKSUPPL_M
{
  key travel_id                   as TravelID,
  key booking_id                  as BookingID,
  key booking_supplement_id       as BookingSupplementID,
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,
      currency_code               as CurrencyCode,
      last_changed_at             as LastChangedAt,
      /* Associations */
      _Travel: redirected to ZCD_C_TRAVEL__P,
      _Booking: redirected to parent ZCD_C_BOOKING_P,
      _SupplementText
}
