import 'package:flutter/material.dart';

import 'log_in.dart';
import 'sign_up.dart';

class TabsBar extends StatelessWidget {
  const TabsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: const TabBar(
            tabs: [
              Tab(text: "Sign Up"),
              Tab(text: "Log In"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SignUp(),
            LogIn(),
          ],
        ),
      ),
    );
  }
}
