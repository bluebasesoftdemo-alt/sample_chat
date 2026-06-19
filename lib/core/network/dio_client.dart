import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
//http://demo5361327.mockable.io/product
class DioClient {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "http://172.30.4.85:8000/api/medical/",
    receiveTimeout: Duration(seconds: 1),
    connectTimeout: Duration(seconds: 1),
  ));
  DioClient(){
    /*dio.interceptors.add(RetryInterceptor(
        dio: dio,
        retries: 3,
        logPrint: print,
        retryDelays: [
          Duration(seconds: 1),
          Duration(seconds: 1),
          Duration(seconds: 1),
       ],
      retryEvaluator: (error,retryAttempt){
          if (kDebugMode) {
            print('Retry Attempt $retryAttempt for the error ${error.message}');
          }
          return DioExceptionType.connectionTimeout == true || error.response!.statusCode == 500;
    }
    ));*/
  }
}