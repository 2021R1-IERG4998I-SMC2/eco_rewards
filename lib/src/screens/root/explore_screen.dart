import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final String transactionId;

  const ExploreScreen({Key? key, required this.transactionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Text(transactionId),
      );
}
