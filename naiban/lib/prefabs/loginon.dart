import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../prefabs/_prefabs.dart';
import '../providers/_providers.dart';

class LoginLogon extends StatelessWidget {
  const LoginLogon({super.key});

  @override
  Widget build(BuildContext context) {
    final logInOnProv = Provider.of<LogInOnProvider>(context);
    bool logInOn = logInOnProv.inOn; // true = In / false = On
    bool mail = logInOnProv.mail; // true = Yes / false = No

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(logInOn),
          const SizedBox(height: 56),
          mail ? LogInOnMail(logInOn) : LogInOnOptions(logInOn),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final bool logInOn; // true = In / false = out

  const _Title(this.logInOn);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            logInOn ? 'Bienvenido de Vuelta' : 'Primero lo Primero',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
          ),
          const Text(
            'Registrate o inicia sesión para comenzar.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
