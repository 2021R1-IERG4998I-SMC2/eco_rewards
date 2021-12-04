import 'package:flutter/material.dart';

class ClaimScreen extends StatelessWidget {
  final String transactionId;

  const ClaimScreen({Key? key, required this.transactionId}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Text(transactionId),
      );
}
