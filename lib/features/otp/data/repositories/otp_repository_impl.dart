import '../../../login/domain/model/login_response.dart';
import '../../domain/repositories/otp_repository.dart';
import '../datasource/otp_remote_data_source/otp_remote_data_source_impl.dart';

class OtpRepositoryImpl extends OtpRepository {
  OtpRemoteDataSourceImpl otpRemoteDataSourceImpl;

  OtpRepositoryImpl({required this.otpRemoteDataSourceImpl});

  @override
  Future<OtpResponse> verifyOtp(
    String phone,
    String code,
    String purpose,
  ) async {
    return otpRemoteDataSourceImpl.validateOtp(phone, code, purpose);
  }
}
