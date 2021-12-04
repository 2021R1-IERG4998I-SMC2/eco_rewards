import 'package:flutter/material.dart';

import 'package:eco_rewards/src/components/home/app_bar.dart';

class ExploreTab extends StatelessWidget {
  final _balance = ValueNotifier<int?>(null);

  ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        strokeWidth: 3.0,
        edgeOffset: MediaQuery.of(context).size.height / 2 - 30.0,
        onRefresh: () async {
          // TODO: Call web API to fetch latest EcoPoints
          _balance.value = (_balance.value ?? 0) + 1;
        },
        child: CustomScrollView(
          slivers: [
            ValueListenableBuilder(
              valueListenable: _balance,
              builder: (context, int? balance, child) =>
                  HomeSliverAppBar(_balance),
            ),
          ],
        ),
      );
}
