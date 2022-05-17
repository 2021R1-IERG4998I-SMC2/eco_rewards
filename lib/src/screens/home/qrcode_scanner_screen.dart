import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:eco_rewards/src/constants/colors.dart';
import 'package:eco_rewards/src/components/shared/back_button.dart';

import 'package:eco_rewards/src/models/home/claim_screen_model.dart';

class QRCodeScannerScreen extends StatefulWidget {
  // TODO: Change it to real API
  //'http://52.206.120.192:3000/getClaimDetails?transId=1000';
  //    'https://run.mocky.io/v3/07a4c1f2-9185-4362-a676-e2d664908136';
  // 'https://example.com/transaction/$id' (QRCODE)

  const QRCodeScannerScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final qrKey = GlobalKey(debugLabel: 'QRView');
  late final _getClaimDetailsApi;
  bool _isSnackBarActive = false;

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

  void _showSnackBar(BuildContext context, IconData icon, String message) {
    if (_isSnackBarActive) return;

    _isSnackBarActive = true;
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 800),
            content: Row(children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 20.0),
              Text(message, style: const TextStyle(color: Colors.white)),
            ]),
          ),
        )
        .closed
        .then((reason) => _isSnackBarActive = false);
  }

  Future<void> _setupScanner(
      BuildContext context, QRViewController controller) async {
    controller.scannedDataStream.listen((barcode) async {
      if (barcode.code == null) return;

      final int? receiptId = int.tryParse(barcode.code!);
      if (receiptId == null) {
        _showSnackBar(
          context,
          Ionicons.alert_outline,
          'The QR Code is not valid, please check.',
        );
        return;
      }
      String id = barcode.code.toString();
      _getClaimDetailsApi = 'http://52.206.120.192:3000/getDetails?transId=$id';
      final model = _getClaimDetails(receiptId);

      controller.pauseCamera();
      _showSnackBar(
        context,
        Ionicons.checkmark_outline,
        'Scanned successfully. Retrieving information...',
      );


      await Navigator.popAndPushNamed(
        context,
        '/claim',
        arguments: await model,
      );
    });
  }

  Future<ClaimScreenModel?> _getClaimDetails(int transactionId) async {
    final response =
        await http.get(Uri.parse(_getClaimDetailsApi));
    final data = json.decode(response.body);

    return ClaimScreenModel.fromResponse(data);
  }
}
