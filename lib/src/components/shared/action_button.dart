import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const ActionButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 5.0),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            minimumSize: MaterialStateProperty.all(const Size(42.0, 42.0)),
          ),
          child: Icon(icon, size: 22.0),
          onPressed: onPressed,
        ),
      );
}
