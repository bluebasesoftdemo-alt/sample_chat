import '../../data/model/otp_response.dart';
import '../repositories/otp_repository.dart';

class OtpUseCase {
  OtpRepository otpRepository;

  OtpUseCase({required this.otpRepository});

  Future<OtpResponse> call(String email, String code) async {
    return await otpRepository.verifyOtp(email, code);
  }
}
