import 'package:flutter/material.dart';

class ClaimParticularItem extends StatelessWidget {
  static const contentMargin = 20.0;

  final String label;
  final String value;

  const ClaimParticularItem(this.label, this.value, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              children: [
                Text(
                  label.toUpperCase(),
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                Expanded(
                    child: Text(
                  value,
                  textAlign: TextAlign.right,
                )),
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade600,
            height: 1.0,
          ),
        ],
      );
}
