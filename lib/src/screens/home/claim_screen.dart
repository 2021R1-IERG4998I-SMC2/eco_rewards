import 'package:flutter/material.dart';

import 'package:eco_rewards/src/components/shared/back_button.dart';

class ClaimScreen extends StatelessWidget {
  final String transactionId;

  const ClaimScreen({Key? key, required this.transactionId}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Transaction Deails'),
          leading: const FluroBackButton(),
        ),
        body: Text(transactionId),
      );
}
