import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

class UserWalletModel {
  // TODO: Change it to real API
  static const _getBalanceApi =
      "https://run.mocky.io/v3/2fccfd8b-9596-4f72-bdfb-d9913dee7a0b";
  //'https://example.com/user/${id}/balance';

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
