import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app.dart';
import 'src/routes.dart';
import 'src/services.dart';

void enableTransparentNotificationBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

void main() {
  enableTransparentNotificationBar();

  Services.setup();
  Routes.setup();

  runApp(const EcoRewardsApp());
}
