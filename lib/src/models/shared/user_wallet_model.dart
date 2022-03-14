import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserWalletModel {
  var prefs;
  late String wallet;
  var _getBalanceApi;
  //static const _getBalanceApi =
      //'https://eth-api-johnyuen97-gmailcom.vercel.app/getBalance?wallet=0x61824bF5Fcb2564897500A0dA0E752e3A7cAc492';

  var userId = 0;
  final _balance = BehaviorSubject<int?>.seeded(null);

  Stream<int?> get balanceStream => _balance.stream;
  int? get balance => _balance.value;

  void updateBalance(int newBalance) {
    _balance.add(newBalance);
  }

  Future<void> getWallet() async{
    prefs = await SharedPreferences.getInstance();
    wallet = prefs.getString('wallet');

    //debugPrint('movieTitle: $wallet');
    _getBalanceApi =
        'http://3.235.209.53:3000/getBalance?wallet=$wallet';
        //'https://eth-api-johnyuen97-gmailcom.vercel.app/getBalance?wallet=0x61824bF5Fcb2564897500A0dA0E752e3A7cAc492'; //0x61824bF5Fcb2564897500A0dA0E752e3A7cAc492

    //'http://3.235.209.53:3000/getBalance?wallet=' + wallet;
  }

  Future<void> refreshBalance() async {
    //debugPrint('HERE1');
    await getWallet();
    //debugPrint('HERE After ' + _getBalanceApi);
    final response = await http.get(Uri.parse(_getBalanceApi));
    //debugPrint('HERE2');
    final data = json.decode(response.body);

    //debugPrint('api1: '+ response.body);
    _balance.add(data['balance']);
    //debugPrint('api2: '+ data['balance']);
  }
}
