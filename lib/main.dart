import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/routes.dart';
import 'src/services.dart';

void main() {
  Services.setup();
  Routes.setup();

  runApp(const EcoRewardsApp());
}
