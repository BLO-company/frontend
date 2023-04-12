import 'package:flutter/material.dart';

import '../themes/my_theme.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Historial',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppTheme.white3,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: const [
            Register('Lunes 11 de Abril', '32', '14'),
            Divider(color: AppTheme.white3),
            Register('Viernes 8 de Abril', '24', '8'),
          ],
        ),
      ],
    );
  }
}

class Register extends StatelessWidget {
  final String date, time, km;

  const Register(this.date, this.time, this.km, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.access_time_filled_rounded,
                color: AppTheme.white3, size: 20),
            const SizedBox(width: 8),
            Text(
              '$time min',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.white3),
            ),
            const SizedBox(width: 24),
            const Icon(Icons.route_rounded, color: AppTheme.white3, size: 20),
            const SizedBox(width: 8),
            Text(
              '$km km',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.white3),
            )
          ],
        )
      ],
    );
  }
}
