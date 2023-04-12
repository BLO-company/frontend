import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/_providers.dart';
import '../themes/my_theme.dart';
import '../prefabs/_prefabs.dart';
import '../widgets/_widgets.dart';

class LogInOnPage extends StatelessWidget {
  const LogInOnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: const [
          LoginImage(),
          _BackIcon(),
          Positioned(
            bottom: 0,
            child: LoginLogon(),
          ),
        ],
      ),
    );
  }
}

class _BackIcon extends StatelessWidget {
  const _BackIcon();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LogInOnProvider>(context);

    return Visibility(
      visible: prov.mail,
      child: Positioned(
        left: -10,
        top: 20,
        child: GestureDetector(
          onTap: prov.turnMail,
          child: const Icon(
            Icons.arrow_left_rounded,
            size: 100,
            color: AppTheme.dark,
          ),
        ),
      ),
    );
  }
}
