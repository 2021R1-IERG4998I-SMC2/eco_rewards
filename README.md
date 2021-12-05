# eco_rewards

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Purchase flow

1. User purchases goods in real store, for HK$300.
2. Merchant creates receipt, upload the below to the blockchain:
{
  transactionId: blockchain-generated
  merchantName:
  transactionAmount: 300
  transactedOn
}
3. The QRCode (transactionId) will be printed on the receipt
4. User uses app to scan qrcode, claim 300 ecopoints to his own wallet
