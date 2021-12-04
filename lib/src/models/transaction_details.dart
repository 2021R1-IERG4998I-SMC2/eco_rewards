class TransactionDetailsModel {
  final int id;
  final String merchantName;
  final double transactionAmount;
  final DateTime transactedOn;

  const TransactionDetailsModel(
    this.id,
    this.merchantName,
    this.transactionAmount,
    this.transactedOn,
  );

  factory TransactionDetailsModel.fromResponse(Map response) =>
      TransactionDetailsModel(
        response["id"],
        response["merchantName"],
        response["transactionAmount"],
        DateTime.parse(response["transactedOn"]),
      );
}
