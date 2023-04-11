import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:widget_mask/widget_mask.dart';

import '../themes/my_theme.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -320,
      right: -200,
      child: Transform.rotate(
        angle: math.pi / 3,
        child: WidgetMask(
          blendMode: BlendMode.srcATop,
          childSaveLayer: true,
          mask: Stack(
            children: [
              Positioned(
                bottom: 10,
                right: -150,
                child: SizedBox(
                  height: 450,
                  width: 550,
                  child: Transform.rotate(
                    angle: -math.pi / 3,
                    child: Image.asset(
                      'assets/images/car_front.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          child: Container(
            height: 550,
            width: 550,
            decoration: BoxDecoration(
              color: AppTheme.dark,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),
      ),
    );
  }
}
