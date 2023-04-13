import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../global/environment.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      final signInWithGoogleEndpoint =
          Uri.parse('${Environment.apiUrl}/login/google');

      /*final session =*/ await http
          .post(signInWithGoogleEndpoint, body: {'token': googleKey.idToken});

      // Recibir el Token por parte del servidor para posteriormente
      // guardarlo en el SecureStorage y poder mantener la sesión

      return account;
    } catch (e) {
      log('Error en Google');
      log('$e');
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
