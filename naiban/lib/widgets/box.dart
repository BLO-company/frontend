import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final double height, width;
  final Color color;
  final Widget child;
  final bool padding;

  const Box(
    this.child, {
    super.key,
    required this.height,
    required this.width,
    required this.color,
    this.padding = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding ? 16 : 0),
        color: color,
        child: child,
      ),
    );
  }
}
