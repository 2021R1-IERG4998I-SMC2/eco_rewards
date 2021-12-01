import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fluro/fluro.dart';

import 'package:eco_rewards/src/constants/colors.dart';
import 'package:eco_rewards/src/services.dart';

class QRCodeScannerScreen extends StatelessWidget {
  final qrKey = GlobalKey(debugLabel: 'QRView');

  QRCodeScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildScanner(context),
      );

  Widget buildScanner(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: (controller) => controller.scannedDataStream.listen(
            (barcode) => services
                .get<FluroRouter>()
                .navigateTo(context, '/claim/${barcode.code}')),
        overlay: QrScannerOverlayShape(
          borderColor: AppColors.primarySwatch.shade400,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 150,
        ),
      );
}
