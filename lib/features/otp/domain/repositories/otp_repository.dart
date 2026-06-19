import '../../data/model/otp_response.dart';

abstract class OtpRepository {
  Future<OtpResponse> verifyOtp(String phone, String code);
}
