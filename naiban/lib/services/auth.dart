/// Maneja la autenticación y la conexión con el BackEnd referente a las,
/// credenciales.
///

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../global/environment.dart';
import '../models/_models.dart';
import '../responses/_responses.dart';

class _AuthService {
  late User user;
  late int code;

  final _storage = const FlutterSecureStorage();

  // Conseguir el toque que se necesitará para todas las interacciónes con el
  // backend
  Future<String> getToken() async {
    const temp = FlutterSecureStorage();
    final token = await temp.read(key: 'token');

    return token ?? '';
  }

  /// Cerrar sesión
  Future<void> deleteToken() async {
    const temp = FlutterSecureStorage();
    await temp.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    final uri = Uri.parse('${Environment.apiUrl}/login/');

    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final resBody = logInResponseFromMap(resp.body);
      user = resBody.user;

      await _saveToken(resBody.token);

      return true;
    }

    return false;
  }

  Future register(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    final uri = Uri.parse('${Environment.apiUrl}/login/new');

    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final registerResponse = registerResponseFromMap(resp.body);
      user = registerResponse.user;
      code = registerResponse.code;

      return true;
    }

    final respBody = jsonDecode(resp.body);
    return respBody['msg'] ?? 'Error desconocido, intentelo más tarde.';
  }

  Future<bool> verifyEmail(String email) async {
    final data = {
      'email': email,
    };

    final uri = Uri.parse('${Environment.apiUrl}/login/verify');

    final resp = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final resBody = logInResponseFromMap(resp.body);
      user = resBody.user;

      await _saveToken(resBody.token);

      return true;
    }

    return false;
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');

    log('$token');

    if (token == null) return false;

    final uri = Uri.parse('${Environment.apiUrl}/login/renew');

    final resp = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'x-token': token,
      },
    );

    if (resp.statusCode == 200) {
      final loginResponse = logInResponseFromMap(resp.body);
      user = loginResponse.user;

      await _saveToken(loginResponse.token);

      return true;
    }

    logOut();
    return false;
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logOut() async {
    await _storage.delete(key: 'token');
  }
}

final authService = _AuthService();
