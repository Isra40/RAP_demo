@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZRAP100_C_TRAVELTP_99
  provider contract TRANSACTIONAL_QUERY
  as projection on ZRAP100_R_TRAVELTP_99
{
  key TravelId,
  AgencyId,
  CustomerId,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  @Semantics.currencyCode: true
  CurrencyCode,
  Description,
  OverallStatus,
  Attachment,
  MimeType,
  FileName,
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
