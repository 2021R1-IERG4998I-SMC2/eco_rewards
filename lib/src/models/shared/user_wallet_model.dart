import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

class UserWalletModel {
  static const _getBalanceApi =
      'https://src-johnyuen97-gmailcom.vercel.app/getBalance';

  var userId = 0;
  final _balance = BehaviorSubject<int?>.seeded(null);

  Stream<int?> get balanceStream => _balance.stream;
  int? get balance => _balance.value;

  void updateBalance(int newBalance) {
    _balance.add(newBalance);
  }

  Future<void> refreshBalance() async {
    final response = await http.get(Uri.parse(_getBalanceApi));
    final data = json.decode(response.body);

    _balance.add(data['balance']);
  }
}
