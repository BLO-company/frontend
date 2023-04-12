import 'package:flutter/material.dart';

void instantTransition(BuildContext context, Widget page,
        {bool replace = true}) =>
    replace
        ? Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => page,
              transitionDuration: const Duration(microseconds: 0),
            ),
          )
        : Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => page,
              transitionDuration: const Duration(microseconds: 0),
            ),
          );
