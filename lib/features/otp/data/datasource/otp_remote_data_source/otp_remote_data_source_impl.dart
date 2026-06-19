import 'package:dio/dio.dart';

import '../../../../../core/utils/logger.dart';
import '../../model/otp_response.dart';
import 'otp_remote_data_source.dart';

class OtpRemoteDataSourceImpl extends OtpRemoteDataSource {
  @override
  Future<OtpResponse> validateOtp(String email, String code) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2/realtime_chat/",
        headers: {"Content-Type": "application/json"},
        /* receiveTimeout: Duration(seconds: 2),
        connectTimeout: Duration(seconds: 2),*/
      ),
    );
    // DioClient dioClient = DioClient();
    try {
      final otpresponse = await dio.post(
        'verify_otp.php',
        data: {"email": email, "otp_code": code},
      );
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
