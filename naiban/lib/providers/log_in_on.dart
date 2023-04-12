import 'package:flutter/material.dart'
    show ChangeNotifier, TextEditingController;

import '../services/_services.dart';

class LogInOnProvider extends ChangeNotifier {
  bool _mail = false;
  bool _inOn = false;
  bool _platicando = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordVerify = TextEditingController();

  bool get mail => _mail;
  bool get inOn => _inOn;
  bool get platicando => _platicando;

  set platicando(bool i) {
    _platicando = i;
    notifyListeners();
  }

  turnMail() {
    if (_mail) {
      email.text = '';
      password.text = '';
      passwordVerify.text = '';
    }

    _mail = !_mail;
    notifyListeners();
  }

  turnInOn() {
    _inOn = !_inOn;
    notifyListeners();
  }

  // Validar formulario de registro y realizar el registro
  Future<Map<String, dynamic>> verifyRegisterForm() async {
    // Verificar que no esté vacio el formulario
    if (password.text.isEmpty || email.text.isEmpty) {
      return {
        'status': false,
        'msg': 'Favor de llenar los campos',
      };
    }

    // Verificar el correo electronico
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(email.text.trim())) {
      return {
        'status': false,
        'msg': 'No es un correo valido.',
      };
    }

    // Verificar la contraseña //? falta verificar la calidad de ls misma
    if (password.text.length < 8) {
      return {
        'status': false,
        'msg': 'La contraseña tiene que tener minimo 8 digitos.',
      };
    }

    // Verificar las contraseñas
    if (password.text != passwordVerify.text) {
      return {
        'status': false,
        'msg': 'Las contraseñas no coinciden',
      };
    }

    platicando = true;

    // Registrar cuenta
    final registerOk =
        await authService.register(email.text.trim(), password.text.trim());

    platicando = false;

    if (registerOk == true) {
      return {
        'status': registerOk,
        'msg': 'Correcto',
      };
    }

    return {
      'status': false,
      'msg': registerOk,
    };
  }

  // Validar formulario de LogIn y realizar inicio de sesión
  Future<Map<String, dynamic>> verifyLogInForm() async {
    // Verificar que no esté vacio el formulario
    if (password.text.isEmpty || email.text.isEmpty) {
      return {
        'status': false,
        'msg': 'Favor de llenar los campos',
      };
    }

    // Verificar el correo electronico
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(email.text.trim())) {
      return {
        'status': false,
        'msg': 'No es un correo valido.',
      };
    }

    // Verificar la contraseña
    if (password.text.length < 8) {
      return {
        'status': false,
        'msg': 'Credenciales no validas',
      };
    }

    platicando = true;

    // Iniciar Sesión
    final loginOk =
        await authService.login(email.text.trim(), password.text.trim());

    platicando = false;

    return {
      'status': loginOk,
      'msg': loginOk ? 'Correcto' : 'Credenciales no validas'
    };
  }
}
