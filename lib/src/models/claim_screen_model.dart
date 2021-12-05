class ClaimScreenModel {
  final int id;
  final String merchantName;
  final double purchaseTotal;
  final int equivalentPoints;
  final DateTime purchaseDate;

  const ClaimScreenModel(
    this.id,
    this.merchantName,
    this.purchaseTotal,
    this.equivalentPoints,
    this.purchaseDate,
  );

  factory ClaimScreenModel.fromResponse(Map response) => ClaimScreenModel(
        response["id"],
        response["merchantName"],
        response["purchaseTotal"],
        response["equivalentPoints"],
        DateTime.parse(response["purchaseDate"]),
      );
}
