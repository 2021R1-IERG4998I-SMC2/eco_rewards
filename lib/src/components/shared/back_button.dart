import 'package:flutter/material.dart';

class FluroBackButton extends StatelessWidget {
  final Color color;

  const FluroBackButton({Key? key, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: color,
        ),
        onPressed: () => Navigator.pop(context),
      );
}
