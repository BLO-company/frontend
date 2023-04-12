import 'package:flutter/material.dart';
import 'package:naiban/themes/my_theme.dart';
import 'package:naiban/widgets/button.dart';

class FastReservation extends StatelessWidget {
  const FastReservation({super.key});

  @override
  Widget build(BuildContext context) {
    // Image.asset('assets/images/car_hor.png'),

    return Stack(
      children: [
        Positioned(
          top: -65,
          left: -30,
          child: SizedBox(
            height: 300,
            width: 400,
            child: Image.asset('assets/images/car_hor.png', fit: BoxFit.cover),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Reservación Rápida',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppTheme.white3),
            ),
            _CarInfo(),
          ],
        ),
      ],
    );
  }
}

class _CarInfo extends StatelessWidget {
  const _CarInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Tesla Modelo S',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.white,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.location_on_rounded,
                        size: 20, color: AppTheme.white3),
                    SizedBox(width: 4),
                    Text('150m', style: TextStyle(color: AppTheme.white3)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(Icons.battery_4_bar_rounded,
                        size: 20, color: AppTheme.white3),
                    SizedBox(width: 4),
                    Text('60%', style: TextStyle(color: AppTheme.white3)),
                  ],
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('\$',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.white,
                    )),
                Text('4',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.white,
                    )),
                Text('.21',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.white,
                    )),
                Text('/min',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.white,
                    )),
              ],
            ),
            const Button(
              'Reservar',
              width: .35,
            ),
          ],
        ),
      ],
    );
  }
}
