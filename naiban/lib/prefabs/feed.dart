import 'package:flutter/material.dart';
import 'package:naiban/pages/_pages.dart';

import '../themes/my_theme.dart';
import '../prefabs/_prefabs.dart';
import '../widgets/_widgets.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyAppBar(),
        SizedBox(height: 48),
        Principal(),
        SizedBox(height: 16),
        Secondary(),
        SizedBox(height: 16),
        Tertiary(),
      ],
    );
  }
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Box(
      const FastReservation(),
      height: size.height * .292656587,
      width: 364,
      color: AppTheme.dark,
    );
  }
}

class Secondary extends StatelessWidget {
  const Secondary({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Box(
          const UserInfo(),
          height: size.height * .22462203,
          width: 174,
          color: AppTheme.white2,
        ),
        const SizedBox(width: 16),
        Box(
          const MapPage(),
          height: size.height * .22462203,
          width: 174,
          color: AppTheme.white2,
          padding: false,
        ),
      ],
    );
  }
}

class Tertiary extends StatelessWidget {
  const Tertiary({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Box(
      const History(),
      height: size.height * .22462203,
      width: 364,
      color: AppTheme.white2,
    );
  }
}
