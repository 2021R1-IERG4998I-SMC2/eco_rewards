import 'package:eco_rewards/src/models/transaction_details.dart';
import 'package:flutter/material.dart';

import 'package:eco_rewards/src/components/shared/back_button.dart';

class ClaimScreen extends StatelessWidget {
  final TransactionDetailsModel model;

  const ClaimScreen(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Claim Your EcoPoints'),
          leading: const FluroBackButton(color: Colors.white),
        ),
        body: Text(model.merchantName),
      );
}
