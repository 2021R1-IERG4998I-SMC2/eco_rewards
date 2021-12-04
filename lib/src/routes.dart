import 'package:fluro/fluro.dart';

import 'services.dart';
import 'screens/home/index.dart';
import 'screens/home/claim_screen.dart';
import 'screens/home/qrcode_scanner_screen.dart';
import 'screens/search/index.dart';
import 'screens/search/results.dart';

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
        '/search',
        handler:
            Handler(handlerFunc: (context, params) => const SearchScreen()),
        transitionType: TransitionType.inFromRight,
      )
      ..define(
        '/search/:keywords',
        handler: Handler(
            handlerFunc: (context, params) =>
                SearchResultsScreen(keywords: params["keywords"]![0])),
        transitionType: TransitionType.inFromRight,
      );
  }
}
