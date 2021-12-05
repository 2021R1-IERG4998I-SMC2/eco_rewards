import 'package:flutter/material.dart';

import 'package:eco_rewards/src/components/home/app_bar.dart';
import 'package:eco_rewards/src/models/shared/user_wallet_model.dart';
import 'package:eco_rewards/src/services.dart';

class ExplorePage extends StatelessWidget {
  static const sectionSpacing = 40.0;
  static const contentMargin = 20.0;

  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: services.get<UserWalletModel>().refreshBalance(),
      builder: (context, _) => RefreshIndicator(
            strokeWidth: 3.0,
            edgeOffset: MediaQuery.of(context).size.height / 2 - 30.0,
            onRefresh: services.get<UserWalletModel>().refreshBalance,
            child: CustomScrollView(
              slivers: [
                const HomeSliverAppBar(),
                SliverToBoxAdapter(child: _buildFeaturedStores()),
                SliverToBoxAdapter(child: _buildPromotions()),
              ],
            ),
          ));

  Widget _buildFeaturedStores() => Container(
        margin: const EdgeInsets.only(
          top: sectionSpacing,
          left: contentMargin,
          right: contentMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Featured Stores',
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Featured stores will come very soon!',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      );

  Widget _buildPromotions() => Container(
        margin: const EdgeInsets.only(
          top: sectionSpacing,
          left: contentMargin,
          right: contentMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Promotions',
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Campaigns will come very soon!',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      );
}
