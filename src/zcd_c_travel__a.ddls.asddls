@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approver Consumption Travel'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZCD_C_TRAVEL__A
  provider contract transactional_query
  as projection on ZCD_I_TRAVEL_M
{
  key travel_id          as TravelID,
      agency_id          as AgencyID,
      _Agency.Name       as AgencyName,
      customer_id        as CustomerID,
      _Customer.LastName as CustomerName,
      begin_date         as BeginDate,
      end_date           as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'      
      booking_fee        as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'      
      total_price        as TotalPrice,
      currency_code      as CurrencyCode,
      overall_status     as TravelStatus,
      description        as Description,
      last_changed_at    as LastChangedAt,
      /* Associations */
      _Booking: redirected to composition child ZCD_C_BOOKING_A,
      _Agency,
      _Customer
}
