import 'package:dio/dio.dart';

import '../../../../../core/utils/logger.dart';
import '../../model/login_response.dart';
import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<LoginResponse> fetchLoginResult(
    String username,
    String email,
    bool revoke,
  ) async {
    Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2/realtime_chat/", headers: {"Content-Type": "application/json"},
      //receiveTimeout: Duration(seconds: 1),
      //connectTimeout: Duration(seconds: 1),
    ),);
    try {
      Log.i('Received Data :: LoginScreen :: UserName : $username :: UserEamail : $email :: Revoke : $revoke');
      final loginresponse = await dio.post('log_register.php', data: {"username": username, "email": email, "revoke": revoke},);
      Log.i('LoginRemoteDataSourceImpl :: Http : Status Code : ${loginresponse.statusCode}',);
      if (loginresponse.statusCode == 200) {
        dynamic response = loginresponse.data;
        Log.i('LoginRemoteDataSourceImpl :: Http : Response Data : $response');
        Map<String, dynamic> data = Map<String, dynamic>.from(response);
        LoginResponse mLoginResponse = LoginResponse.fromJson(data);
        return mLoginResponse;
      } else {
        Log.i('LoginRemoteDataSourceImpl :: Unable to load the data');
        throw Exception();
      }
    } catch (e) {
      Log.i(
        'LoginRemoteDataSourceImpl :: Something Went Wrong!  ${e.toString()}',
      );
      throw Exception('Some thing Went Wrong! : ${e.toString()}');
    }
  }
}
