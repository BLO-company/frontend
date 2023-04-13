import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  final accessToken =
      'pk.eyJ1IjoicG95aXRvIiwiYSI6ImNrZ29kbng5eTBld28yem5xZWg2dGR1a3IifQ.HCda_dGsucRdDzGMBdqLKw';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters
        .addAll({'access_token': accessToken, 'language': 'es', 'limit': 7});

    super.onRequest(options, handler);
  }
}
