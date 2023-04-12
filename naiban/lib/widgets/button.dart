import 'package:flutter/material.dart';

import 'package:naiban/themes/my_theme.dart';

class Button extends StatelessWidget {
  final bool secundary;
  final String text;
  final IconData? icon;
  final Function()? onTap;
  final double width;

  const Button(this.text,
      {Key? key,
      this.secundary = false,
      this.icon,
      this.onTap,
      this.width = .9})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width * width,
        decoration: BoxDecoration(
          color: secundary ? AppTheme.white2 : AppTheme.green,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, size: 30),
            if (icon != null) const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
