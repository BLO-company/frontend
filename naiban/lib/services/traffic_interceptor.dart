import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoicG95aXRvIiwiYSI6ImNsZ2Vzb3lwazBscnEzZHJuOWk4bTh3aHYifQ.GHoH34Gewz06g5THZDTvww';

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });

    super.onRequest(options, handler);
  }
}
