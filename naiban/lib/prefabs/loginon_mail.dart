import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:naiban/providers/_providers.dart';
import 'package:provider/provider.dart';

import '../widgets/_widgets.dart';

class LogInOnMail extends StatelessWidget {
  final bool logInOn;

  const LogInOnMail(this.logInOn, {super.key});

  @override
  Widget build(BuildContext context) {
    void error(String msg) => errorAlert(context, msg);

    final logInOnProv = Provider.of<LogInOnProvider>(context, listen: false);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _Inputs(logInOn),
          const SizedBox(height: 107),
          Button(
            'Registrate',
            onTap: () async {
              final verifyForm = await logInOnProv.verifyRegisterForm();

              if (verifyForm['status'] == false) {
                return error(verifyForm['msg']);
              }
            },
          ),
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}

class _Inputs extends StatelessWidget {
  final bool logInOn; // true = In / false = On

  const _Inputs(this.logInOn);

  @override
  Widget build(BuildContext context) {
    final logInOnProv = Provider.of<LogInOnProvider>(context, listen: false);

    return Column(
      children: [
        Input(
          hintText: 'Correo',
          textInputType: TextInputType.emailAddress,
          ctrl: logInOnProv.email,
        ),
        const SizedBox(height: 24),
        Input(
          hintText: 'Contraseña',
          obscureText: true,
          ctrl: logInOnProv.password,
        ),
        const SizedBox(height: 24),
        Visibility(
          visible: !logInOn,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Input(
            hintText: 'Verificar Contraseña',
            obscureText: true,
            ctrl: logInOnProv.passwordVerify,
          ),
        ),
      ],
    );
  }
}
