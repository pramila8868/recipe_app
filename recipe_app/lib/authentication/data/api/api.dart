import 'package:dio/dio.dart';
import 'package:recipe_app/authentication/data/Repository/repository.dart';

import '../../../common/interceptor/customInterceptor.dart';
import '../../../common/Dio/url.dart';

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: Globals().baseUrl));
//final tokenDio = Dio(BaseOptions(baseUrl: "https://api-dev.revelarena.com"));
  // String baseUrl = "https://api-dev.revelarena.com";
  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
        baseUrl: Globals().baseUrl,
        receiveTimeout:
            const Duration(seconds: 15), //Durati15000, // 15 seconds
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15)));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}










  //  SignUpRepository repoistort = SignUpRepository() ;
  //  SignUpRepository().

