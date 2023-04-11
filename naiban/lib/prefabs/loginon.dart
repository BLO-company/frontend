import 'package:flutter/material.dart';
import 'package:naiban/themes/my_theme.dart';
import 'package:naiban/widgets/_widgets.dart';

class LoginLogon extends StatelessWidget {
  final bool logInOn; // true = In / false = out

  const LoginLogon({super.key, required this.logInOn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Title(logInOn),
                  const SizedBox(height: 56),
                  _Buttons(logInOn),
                  const SizedBox(height: 107),
                ],
              ),
            ],
          ),
        ),
        _ChangePage(logInOn),
        const SizedBox(height: 64),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final bool logInOn; // true = In / false = out

  const _Title(this.logInOn);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Primero lo Primero',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
        ),
        Text(
          'Registrate o inicia sesión para comenzar.',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  final bool logInOn; // true = In / false = out

  const _Buttons(this.logInOn);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Button('Registrate con Correo'),
        SizedBox(height: 24),
        Button(
          'Continuar con Google',
          secundary: true,
          icon: Icons.g_mobiledata,
        ),
        SizedBox(height: 24),
        Button(
          'Continuar con Apple',
          secundary: true,
          icon: Icons.apple,
        ),
      ],
    );
  }
}

class _ChangePage extends StatelessWidget {
  final bool logInOn; // true = In / false = out

  const _ChangePage(this.logInOn);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 16,
      color: AppTheme.dark,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          logInOn ? '¿No tienes Cuenta?' : '¿Ya tienes cuenta?',
          style: style,
        ),
        const SizedBox(width: 8),
        Text(
          logInOn ? 'Crea una' : 'Inicia sesión',
          style: style.copyWith(color: AppTheme.green),
        ),
      ],
    );
  }
}
