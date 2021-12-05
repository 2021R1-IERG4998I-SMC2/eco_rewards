import 'package:flutter/material.dart';

import 'package:eco_rewards/src/components/home/app_bar.dart';
import 'package:eco_rewards/src/models/shared/user_wallet_model.dart';
import 'package:eco_rewards/src/services.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: services.get<UserWalletModel>().refreshBalance(),
      builder: (context, _) => RefreshIndicator(
            strokeWidth: 3.0,
            edgeOffset: MediaQuery.of(context).size.height / 2 - 30.0,
            onRefresh: services.get<UserWalletModel>().refreshBalance,
            child: const CustomScrollView(
              slivers: [HomeSliverAppBar()],
            ),
          ));
}
