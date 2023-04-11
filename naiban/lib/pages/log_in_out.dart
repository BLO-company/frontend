import 'package:flutter/material.dart';

import '../prefabs/_prefabs.dart';
import '../widgets/_widgets.dart';

class LogInOutPage extends StatelessWidget {
  const LogInOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: const [
          LoginImage(),
          Positioned(bottom: 0, child: LoginLogon(logInOn: true)),
        ],
      ),
    );
  }
}
