import '../../../login/domain/model/login_response.dart';

abstract class OtpRepository {
  Future<OtpResponse> verifyOtp(String phone, String code, String purpose);
}
