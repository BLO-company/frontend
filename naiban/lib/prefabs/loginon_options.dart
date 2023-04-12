import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/_providers.dart';
import '../themes/my_theme.dart';
import '../services/_services.dart';
import '../widgets/_widgets.dart';

class LogInOnOptions extends StatelessWidget {
  final bool logInOn;

  const LogInOnOptions(this.logInOn, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Buttons(logInOn),
        const SizedBox(height: 107),
        _ChangePage(logInOn),
        const SizedBox(height: 64),
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  final bool logInOn; // true = In / false = on

  const _Buttons(this.logInOn);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
          logInOn ? 'Iniciar con Correo' : 'Registrate con Correo',
          onTap: () {
            final prov = Provider.of<LogInOnProvider>(context, listen: false);
            prov.turnMail();
          },
        ),
        const SizedBox(height: 24),
        const Button(
          'Continuar con Google',
          secundary: true,
          icon: FontAwesomeIcons.google,
          onTap: GoogleSignInService.signInWithGoogle,
        ),
        const SizedBox(height: 24),
        const Button(
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

    return GestureDetector(
      onTap: () {
        final prov = Provider.of<LogInOnProvider>(context, listen: false);
        prov.turnInOn();
      },
      child: Row(
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
      ),
    );
  }
}
