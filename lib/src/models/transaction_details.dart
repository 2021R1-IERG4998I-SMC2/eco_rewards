class TransactionDetailModel {
  const TransactionDetailModel(
    this.id,
    this.merchantName,
    this.transactionAmount,
    this.transactedOn,
  );

  final int id;
  final String merchantName;
  final double transactionAmount;
  final DateTime transactedOn;
}
