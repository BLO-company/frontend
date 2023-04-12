import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final double height, width;
  final Color color;
  final Widget child;

  const Box(
    this.child, {
    super.key,
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
