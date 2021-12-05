import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:eco_rewards/src/constants/colors.dart';
import 'package:eco_rewards/src/components/shared/back_button.dart';

import 'package:eco_rewards/src/models/home/claim_screen_model.dart';

class QRCodeScannerScreen extends StatelessWidget {
  // TODO: Change it to real API
  static const _getClaimDetailsApi =
      'https://run.mocky.io/v3/07a4c1f2-9185-4362-a676-e2d664908136';
  // 'https://example.com/transaction/$id' (QRCODE)

  final qrKey = GlobalKey(debugLabel: 'QRView');

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
        body: _buildScanner(context),
      );

  Widget _buildScanner(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: (controller) async =>
            _setupScanner(context, controller),
        overlay: QrScannerOverlayShape(
          borderColor: AppColors.primarySwatch.shade400,
          borderRadius: 0.0,
          borderLength: 20.0,
          borderWidth: 6.0,
          cutOutSize: 250.0,
        ),
      );

  SnackBar _buildSnackbar(BuildContext context) => SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Row(children: const [
          Icon(
            Ionicons.checkmark_outline,
            color: Colors.white,
          ),
          SizedBox(width: 20.0),
          Text(
            'Scanned successfully. Retrieving information...',
            style: TextStyle(color: Colors.white),
          ),
        ]),
      );

  Future<void> _setupScanner(
      BuildContext context, QRViewController controller) async {
    controller.scannedDataStream.listen((barcode) async {
      if (barcode.code == null) return;

      final transactionId = int.tryParse(barcode.code!);
      if (transactionId == null) return;

      if (barcode.code == null) return;

      final id = int.tryParse(barcode.code!);
      if (id == null) return;

      final model = _getClaimDetails(transactionId);

      controller.pauseCamera();
      ScaffoldMessenger.of(context).showSnackBar(_buildSnackbar(context));

      await Navigator.popAndPushNamed(
        context,
        '/claim',
        arguments: await model,
      );
    });
  }

  Future<ClaimScreenModel?> _getClaimDetails(int transactionId) async {
    final response = await http.get(Uri.parse(_getClaimDetailsApi));
    final data = json.decode(response.body);

    return ClaimScreenModel.fromResponse(data);
  }
}
