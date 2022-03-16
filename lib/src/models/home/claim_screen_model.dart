class ClaimScreenModel {
  final int id;
  final String merchantId;
  final double purchaseTotal;
  final int equivalentPoints;
  final DateTime purchaseDate;

  const ClaimScreenModel(
    this.id,
    this.merchantId,
    this.purchaseTotal,
    this.equivalentPoints,
    this.purchaseDate,
  );

  factory ClaimScreenModel.fromResponse(Map response) => ClaimScreenModel(
        response["id"],
        response["merchantId"],
        response["purchaseTotal"],
        response["equivalentPoints"],
        DateTime.parse(response["purchaseDate"]),
      );
}
