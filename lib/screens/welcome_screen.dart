
import 'package:anketa/screens_contents/welcome_screen_content.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: WelcomeContent(),
      ),
    );
  }
}


