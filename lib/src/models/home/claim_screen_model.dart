class ClaimScreenModel {
  final int id;
  final int merchantId;
  final int price;
  final int tokens;

  const ClaimScreenModel(
    this.id,
    this.merchantId,
    this.price,
    this.tokens,
  );

  factory ClaimScreenModel.fromResponse(Map response) => ClaimScreenModel(
        response["id"],
        response["merchantId"],
        response["price"],
        response["tokens"],
      );
}
