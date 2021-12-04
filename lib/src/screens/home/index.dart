import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:eco_rewards/src/components/home/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: CustomScrollView(
          slivers: [HomeSliverAppBar()],
        ),
      );
}
