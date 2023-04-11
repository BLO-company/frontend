import 'package:flutter/material.dart';

import '../themes/my_theme.dart';
import '../widgets/_widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Stack(
        children: const [
          _Image(),
          _Data(),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          left: -350,
          top: 100,
          child: SizedBox(
            height: 500,
            width: 800,
            child: Image(
              image: AssetImage('assets/images/car_front.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class _Data extends StatelessWidget {
  const _Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'NAIBAN',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.white,
                ),
              ),
              Text(
                'El vehículo que necesitas, cuando lo necesitas.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: AppTheme.white2,
                ),
              ),
              SizedBox(height: 32),
              Button('Vamos'),
            ],
          ),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
