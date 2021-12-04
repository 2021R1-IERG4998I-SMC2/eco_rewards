import 'dart:convert';
import 'dart:io';

import 'package:eco_rewards/src/models/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:eco_rewards/src/constants/colors.dart';
import 'package:eco_rewards/src/components/shared/back_button.dart';

class QRCodeScannerScreen extends StatelessWidget {
  static const fetchBalanceApi =
      "https://run.mocky.io/v3/fbec42c7-a54f-4a3d-b331-a4150c1dadeb";

  final qrKey = GlobalKey(debugLabel: 'QRView');

  final client = HttpClient();

  QRCodeScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Scan to Claim EcoPoints',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: const FluroBackButton(color: Colors.white),
        ),
        body: buildScanner(context),
      );

  Widget buildScanner(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: (controller) async {
          controller.scannedDataStream.listen((barcode) async {
            if (barcode.code == null) return;

            final transactionId = int.tryParse(barcode.code!);
            if (transactionId == null) return;

            controller.pauseCamera();

            final model = getTransactionDetails(transactionId);

            await Navigator.popAndPushNamed(
              context,
              '/claim',
              arguments: await model,
            );
          });
        },
        overlay: QrScannerOverlayShape(
          borderColor: AppColors.primarySwatch.shade400,
          borderRadius: 0.0,
          borderLength: 20.0,
          borderWidth: 6.0,
          cutOutSize: 250.0,
        ),
      );

  Future<TransactionDetailsModel?> getTransactionDetails(
      int transactionId) async {
    return await client
        .getUrl(Uri.parse(fetchBalanceApi))
        .then((request) async {
      return request.close();
    }).then((response) async {
      if (response.statusCode == 200) {
        final responseBody =
            await response.transform(const Utf8Decoder()).join();

        return TransactionDetailsModel.fromResponse(json.decode(responseBody));
      }
    });
  }
}
