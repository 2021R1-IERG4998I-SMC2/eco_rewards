import 'package:fluro/fluro.dart';

import 'services.dart';

import 'models/transaction_details.dart';

import 'screens/home/index.dart';
import 'screens/home/claim_screen.dart';
import 'screens/home/qrcode_scanner_screen.dart';
import 'screens/settings/index.dart';

class Routes {
  static void setup() {
    services.get<FluroRouter>()
      ..define(
        '/',
        handler: Handler(handlerFunc: (context, params) => HomeScreen()),
      )
      ..define(
        '/qrcode-scanner',
        handler:
            Handler(handlerFunc: (context, params) => QRCodeScannerScreen()),
        transitionType: TransitionType.inFromRight,
      )
      ..define(
        '/claim',
        handler: Handler(handlerFunc: (context, params) {
          {
            final model =
                context?.settings?.arguments as TransactionDetailsModel;
            return ClaimScreen(model);
          }
        }),
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
