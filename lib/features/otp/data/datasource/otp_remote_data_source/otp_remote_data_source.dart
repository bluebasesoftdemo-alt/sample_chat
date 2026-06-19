import '../../model/otp_response.dart';

abstract class OtpRemoteDataSource {
  Future<OtpResponse> validateOtp(String email, String code);
}
