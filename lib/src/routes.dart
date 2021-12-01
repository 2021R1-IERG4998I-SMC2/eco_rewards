import 'package:fluro/fluro.dart';

import 'services.dart';
import 'screens/root/index.dart';
import 'screens/root/claim_screen.dart';
import 'screens/root/qrcode_scanner_screen.dart';

class Routes {
  static void setup() {
    services.get<FluroRouter>()
      ..define(
        '/',
        handler: Handler(handlerFunc: (context, params) => const HomeScreen()),
      )
      ..define(
        '/claim/:transactionId',
        handler: Handler(
            handlerFunc: (context, params) =>
                ClaimScreen(transactionId: params['transactionId']![0])),
        transitionType: TransitionType.inFromRight,
      )
      ..define(
        '/qrcode-scanner',
        handler:
            Handler(handlerFunc: (context, params) => QRCodeScannerScreen()),
        transitionType: TransitionType.inFromRight,
      );
  }
}
