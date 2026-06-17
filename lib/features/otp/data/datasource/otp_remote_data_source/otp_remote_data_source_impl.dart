import 'package:dio/dio.dart';

import '../../../../../core/utils/logger.dart';
import '../../../../login/domain/model/login_response.dart';
import 'otp_remote_data_source.dart';

class OtpRemoteDataSourceImpl extends OtpRemoteDataSource {
  @override
  Future<OtpResponse> validateOtp(
    String phone,
    String code,
    String purpose,
  ) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://34.135.150.3:8000/auth/",
        receiveTimeout: Duration(seconds: 2),
        connectTimeout: Duration(seconds: 2),
      ),
    );
    // DioClient dioClient = DioClient();
    final otpresponse = await dio.post(
      'verify-otp',
      data: {
        "phone_number": phone,
        "otp_code": code,
        "purpose": "authentication",
      },
    );
    try {
      if (otpresponse.statusCode == 200) {
        Log.i(
          'OtpRemoteDataSourceImpl :: Http Status : ${otpresponse.statusCode}',
        );
        dynamic res = otpresponse.data;
        Log.i('OtpRemoteDataSourceImpl :: Response Data: $res');
        Map<String, dynamic> data = Map<String, dynamic>.from(res);
        OtpResponse otpResponse = OtpResponse.fromJson(data);
        return otpResponse;
      } else {
        Log.i('OtpRemoteDataSourceImpl :: Unable to Load the Data');
        throw Exception('Unable to Load the Data');
      }
    } catch (e) {
      Log.i('OtpRemoteDataSourceImpl :: Something Went Wrong');
      throw Exception('Something Went Wrong!');
    }
  }
}
