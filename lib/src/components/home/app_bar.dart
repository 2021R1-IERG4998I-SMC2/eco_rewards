import 'package:eco_rewards/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../shared/action_button.dart';

class HomeSliverAppBar extends StatelessWidget {
  final contentMargin = 20.0;

  const HomeSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverAppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: contentMargin, bottom: 15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: '300',
                    style: TextStyle(
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
            ]),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            'assets/images/home/appbar_background.png',
            fit: BoxFit.cover,
          ),
        ),
        expandedHeight: 200.0,
        actions: [
          buildSearchButton(context),
          Container(
            margin: EdgeInsets.only(right: contentMargin),
            child: buildScanButton(context),
          )
        ],
      );

  Widget buildSearchButton(BuildContext context) => ActionButton(
        icon: Ionicons.search_outline,
        onPressed: () async => await Navigator.pushNamed(context, '/search'),
      );

  Widget buildScanButton(BuildContext context) => ActionButton(
        icon: Ionicons.barcode_outline,
        onPressed: () async =>
            await Navigator.pushNamed(context, '/qrcode-scanner'),
      );
}
