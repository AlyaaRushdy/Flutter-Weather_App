import 'package:flutter/material.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          "There's No Result 😔 Try Searching From The Above Search Icon 🔍",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
