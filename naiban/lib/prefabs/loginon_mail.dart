import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../pages/_pages.dart';
import '../providers/_providers.dart';
import '../transitions/_transitions.dart';
import '../widgets/_widgets.dart';

class LogInOnMail extends StatelessWidget {
  final bool logInOn;

  const LogInOnMail(this.logInOn, {super.key});

  @override
  Widget build(BuildContext context) {
    void error(String msg) => errorAlert(context, msg);
    void goToHome() => instantTransition(context, const HomePage());

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
              final verifyForm = logInOn
                  ? await logInOnProv.verifyLogInForm()
                  : await logInOnProv.verifyRegisterForm();

              // log('$verifyForm');

              if (verifyForm['status'] == false) {
                return error(verifyForm['msg']);
              }

              goToHome();
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
