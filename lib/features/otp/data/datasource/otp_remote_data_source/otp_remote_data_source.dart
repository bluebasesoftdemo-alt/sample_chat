import '../../../../login/domain/model/login_response.dart';

abstract class OtpRemoteDataSource {
  Future<OtpResponse> validateOtp(String phone, String code, String purpose);
}
