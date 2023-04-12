import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api'
      : 'http://localhost:3000/api';
  // static String apiUrl = 'http://zajin.hazlodigital.mx/api';

  static String socketUrl =
      Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';
  // static String socketUrl = 'http://zajin.hazlodigital.mx';
}
