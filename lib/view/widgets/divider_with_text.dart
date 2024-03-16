import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              thickness: 1.0,
              color: Colors.blueGrey,
              endIndent: 7.5,
            ),
          ),
          Text(
            "OR",
            style: TextStyle(color: Colors.blueGrey),
          ),
          Expanded(
            child: Divider(
              thickness: 1.0,
              color: Colors.blueGrey,
              indent: 7.5,
            ),
          ),
        ],
      ),
    );
  }
}
