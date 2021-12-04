import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:eco_rewards/src/constants/colors.dart';
import 'package:eco_rewards/src/components/shared/back_button.dart';

class QRCodeScannerScreen extends StatelessWidget {
  final qrKey = GlobalKey(debugLabel: 'QRView');

  QRCodeScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Claim EcoPoints',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: const FluroBackButton(color: Colors.white),
          // backgroundColor: Colors.transparent,
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
          borderRadius: 0,
          borderLength: 20,
          borderWidth: 6,
          cutOutSize: 250,
        ),
      );
}
