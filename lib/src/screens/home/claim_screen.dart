import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'package:eco_rewards/src/constants/colors.dart';

import 'package:eco_rewards/src/components/shared/back_button.dart';
import 'package:eco_rewards/src/components/home/claim_particular_item.dart';

import 'package:eco_rewards/src/models/home/claim_screen_model.dart';
import 'package:eco_rewards/src/models/shared/user_wallet_model.dart';

import 'package:eco_rewards/src/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClaimScreen extends StatelessWidget {
  // TODO: Change it to real API

  var _claimEcoPointsApi;
  //'= 3.235.209.53:3000/getrewards?wallet=0x61824bF5Fcb2564897500A0dA0E752e3A7cAc492&tokens=669&transId=1000'
      //'https://run.mocky.io/v3/d7bdab3a-5387-432d-8080-869a972ca91a';
  // 'https://example.com/claim';

  static const contentMargin = 20.0;

  static final currencyFormat = NumberFormat.currency(name: 'HKD ');
  static final dateFormat = DateFormat('yyyy-MM-dd kk:mm:ss');

  final ClaimScreenModel model;
  var prefs;
  var wallet;

  ClaimScreen(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(),
        body: _buildClaimDetails(context),
      );

  PreferredSizeWidget _buildAppBar() => AppBar(
        centerTitle: true,
        title: const Text(
          'VERIFY & CONFIRM',
        ),
        bottom: _buildClaimSummary(),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.primarySwatch.shade600,
                    AppColors.primarySwatch.shade800,
                  ],
                  begin: const FractionalOffset(0.0, 0.5),
                  end: const FractionalOffset(0.5, 1.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        leading: const FluroBackButton(color: Colors.white),
      );

  PreferredSizeWidget _buildClaimSummary() => PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Column(children: [
          Text(
            '${model.equivalentPoints} EcoPoints',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 13.0),
          const Text(
            'will be transferred to',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 13.0),
          const Text(
            'Your Personal Wallet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 30.0),
        ]),
      );

  Widget _buildClaimDetails(BuildContext context) => Container(
        margin: const EdgeInsets.only(
          left: contentMargin,
          right: contentMargin,
          bottom: contentMargin,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(children: [
                ClaimParticularItem(
                  'From',
                  model.merchantId,
                ),
                const ClaimParticularItem(
                  'To',
                  'Your Personal Wallet',
                ),
                ClaimParticularItem(
                  'Purchase total',
                  currencyFormat.format(model.purchaseTotal),
                ),
                ClaimParticularItem(
                  'Purchase date',
                  dateFormat.format(model.purchaseDate),
                ),
                const SizedBox(height: 15.0),
                Text(
                  '* The claim of EcoPoints is irrevocable.\nPlease confirm the above matches your printed receipt.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey.shade600,
                  ),
                ),
              ]),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Claim ${model.equivalentPoints} EcoPoints'.toUpperCase(),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                onPressed: () async {
                  final balance = await _claimEcoPoints(model);

                  services.get<UserWalletModel>().updateBalance(balance);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      );

  Future<void> getWallet() async{
    prefs = await SharedPreferences.getInstance();
    wallet = prefs.getString('wallet');

    //debugPrint('movieTitle: $wallet');
    _claimEcoPointsApi =
    '= 3.235.209.53:3000/getrewards?wallet=$wallet&tokens=669&transId=1000';
    //'https://eth-api-johnyuen97-gmailcom.vercel.app/getBalance?wallet=0x61824bF5Fcb2564897500A0dA0E752e3A7cAc492'; //0x61824bF5Fcb2564897500A0dA0E752e3A7cAc492

    //'http://3.235.209.53:3000/getBalance?wallet=' + wallet;
  }

  Future<int> _claimEcoPoints(ClaimScreenModel model) async {
    await getWallet();
    final response = await http.post(
      Uri.parse(_claimEcoPointsApi),
      body: json.encode(<String, dynamic>{
        'userId': 0,
        'transactionId': model.id,
      }),
    );

    final data = json.decode(response.body);

    return data['balance'];
  }
}
