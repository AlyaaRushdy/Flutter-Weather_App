import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      heightFactor: 1.5,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.blueGrey,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
