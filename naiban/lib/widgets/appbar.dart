import 'package:flutter/material.dart';
import 'package:naiban/themes/my_theme.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32, left: 32, right: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.settings, size: 35, color: AppTheme.white3),
          Text('NAIBAN',
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.white3)),
          Icon(Icons.notifications, size: 35, color: AppTheme.white3),
        ],
      ),
    );
  }
}
