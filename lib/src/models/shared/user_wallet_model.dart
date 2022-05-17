import 'dart:convert';

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
  final _balance = BehaviorSubject<num?>.seeded(null);

  Stream<num?> get balanceStream => _balance.stream;
  num? get balance => _balance.value;

  void updateBalance(num newBalance) {
    _balance.add(newBalance);
  }

  Future<void> getWallet() async{
    prefs = await SharedPreferences.getInstance();
    wallet = prefs.getString('wallet');

    //debugPrint('movieTitle: $wallet');
    _getBalanceApi =
        'http://52.206.120.192:3000/getBalance?wallet=$wallet';
        //'https://eth-api-johnyuen97-gmailcom.vercel.app/getBalance?wallet=0x61824bF5Fcb2564897500A0dA0E752e3A7cAc492'; //0x61824bF5Fcb2564897500A0dA0E752e3A7cAc492

    //'http://3.235.209.53:3000/getBalance?wallet=' + wallet;
  }

  Future<void> refreshBalance() async {
    await getWallet();
    final response = await http.get(Uri.parse(_getBalanceApi));
    final data = json.decode(response.body);

    _balance.add(data['balance']);
  }
}
