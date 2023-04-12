import 'package:flutter/material.dart';
// import 'package:naiban/themes/my_theme.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/user.jpg'),
        ),
        SizedBox(height: 16),
        Text(
          'Felipe Calderón',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 8),
        Text(
          '125 min',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
