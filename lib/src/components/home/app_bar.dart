import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:eco_rewards/src/constants/colors.dart';
import 'package:eco_rewards/src/models/shared/user_wallet_model.dart';
import 'package:eco_rewards/src/services.dart';

import '../shared/action_button.dart';

class HomeSliverAppBar extends StatelessWidget {
  static const contentMargin = 20.0;

  const HomeSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverAppBar(
        floating: true,
        stretch: true,
        elevation: 10.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(left: contentMargin, bottom: 15.0),
            child: _buildBalanceDisplay(context),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const [
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
          ],
          background: Image.asset(
            'assets/images/home/appbar_background.png',
            fit: BoxFit.cover,
          ),
        ),
        expandedHeight: 200.0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: contentMargin),
            child: _buildScanButton(context),
          )
        ],
      );

  Widget _buildScanButton(BuildContext context) => ActionButton(
        icon: Ionicons.barcode_outline,
        onPressed: () async =>
            await Navigator.pushNamed(context, '/qrcode-scanner'),
      );

  Widget _buildBalanceDisplay(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "EcoPoints Balance",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Color(0xffeeeeee),
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.3,
                )
              ],
            ),
          ),
          StreamBuilder(
            stream: services.get<UserWalletModel>().balanceStream,
            builder: (context, AsyncSnapshot<num?> snapshot) => RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: snapshot.data != null ? snapshot.data.toString() : "-",
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Color(0xffeeeeee),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.3,
                      )
                    ],
                  ),
                ),
                WidgetSpan(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Ionicons.leaf,
                      size: 20.0,
                      color: AppColors.primarySwatch.shade400,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      );
}
