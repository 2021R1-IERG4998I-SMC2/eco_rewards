import 'package:fluro/fluro.dart';

import 'services.dart';
import 'screens/home/index.dart';
import 'screens/home/claim_screen.dart';
import 'screens/home/qrcode_scanner_screen.dart';
import 'screens/settings/index.dart';

class Routes {
  static void setup() {
    services.get<FluroRouter>()
      ..define(
        '/',
        handler: Handler(handlerFunc: (context, params) => const HomeScreen()),
      )
      ..define(
        '/qrcode-scanner',
        handler:
            Handler(handlerFunc: (context, params) => QRCodeScannerScreen()),
        transitionType: TransitionType.inFromRight,
      )
      ..define(
        '/claim/:transactionId',
        handler: Handler(
            handlerFunc: (context, params) =>
                ClaimScreen(transactionId: params["transactionId"]![0])),
        transitionType: TransitionType.inFromRight,
      )
      ..define(
        '/settings',
        handler:
            Handler(handlerFunc: (context, params) => const SettingsScreen()),
        transitionType: TransitionType.inFromRight,
      );
  }
}
