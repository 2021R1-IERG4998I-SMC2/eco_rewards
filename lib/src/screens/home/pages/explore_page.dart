import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:eco_rewards/src/components/home/app_bar.dart';

class ExplorePage extends StatelessWidget {
  static const _getBalanceApi =
      "https://run.mocky.io/v3/2fccfd8b-9596-4f72-bdfb-d9913dee7a0b";

  final client = HttpClient();
  final _balance = ValueNotifier<int?>(null);

  ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _getBalance(),
      builder: (context, AsyncSnapshot<int?> snapshot) {
        _balance.value = snapshot.data;
        return RefreshIndicator(
          strokeWidth: 3.0,
          edgeOffset: MediaQuery.of(context).size.height / 2 - 30.0,
          onRefresh: () async {
            _balance.value = await _getBalance();
          },
          child: CustomScrollView(
            slivers: [HomeSliverAppBar(_balance)],
          ),
        );
      });

  Future<int> _getBalance() async {
    // TODO: Change it to real API
    return await client
        .getUrl(Uri.parse(_getBalanceApi))
        .then((request) async => await request.close())
        .then((response) async {
      final responseBody = await response.transform(const Utf8Decoder()).join();
      final data = json.decode(responseBody);

      return data["balance"];
    });
  }
}
