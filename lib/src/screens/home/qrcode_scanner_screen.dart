import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:eco_rewards/src/constants/colors.dart';
import 'package:eco_rewards/src/components/shared/back_button.dart';

class QRCodeScannerScreen extends StatelessWidget {
  final qrKey = GlobalKey(debugLabel: 'QRView');

  QRCodeScannerScreen({Key? key}) : super(key: key);

  final appBarTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Claim Your EcoPoints'),
          centerTitle: true,
          titleTextStyle: appBarTextStyle,
          toolbarTextStyle: appBarTextStyle,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: FluroBackButton(color: appBarTextStyle.color!),
        ),
        body: buildScanner(context),
      );

  Widget buildScanner(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: (controller) async {
          controller.scannedDataStream.listen((barcode) async {
            controller.pauseCamera();

            final transactionId = Uri.encodeComponent(barcode.code ?? "null");
            await Navigator.popAndPushNamed(context, '/claim/$transactionId');
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
}
