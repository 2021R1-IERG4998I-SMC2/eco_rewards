import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/home/appbar_background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            actions: [buildScanButton(context)]),
        body: null,
      );

  Widget buildScanButton(BuildContext context) => IconButton(
        icon: const Icon(Ionicons.qr_code),
        onPressed: () async =>
            await Navigator.pushNamed(context, '/qrcode-scanner'),
      );
}
