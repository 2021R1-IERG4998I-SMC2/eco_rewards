import 'package:flutter/material.dart';

class ElevatedRaisedButton extends StatelessWidget {
  ElevatedRaisedButton({required this.onPressed, required this.title});

  final GestureTapCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 200,
      height: 60,
      child: ElevatedButton(
        //shape: const StadiumBorder(),
        onPressed: onPressed,
        //color: Theme.of(context).accentColor,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
