import '../../../login/domain/model/login_response.dart';
import '../repositories/otp_repository.dart';

class OtpUseCase {
  OtpRepository otpRepository;

  OtpUseCase({required this.otpRepository});

  Future<OtpResponse> call(String phone, String code, String purpose) async {
    return await otpRepository.verifyOtp(phone, code, purpose);
  }
}
