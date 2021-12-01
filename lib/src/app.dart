import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'constants/theme.dart';
import 'services.dart';

class EcoRewardsApp extends StatelessWidget {
  const EcoRewardsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Eco Rewards',
        theme: appTheme,
        onGenerateRoute: services.get<FluroRouter>().generator,
      );
}
