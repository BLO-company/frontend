import 'package:flutter/material.dart';
import 'package:naiban/prefabs/_prefabs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FeedScreen(),
    );
  }
}
