import '../../domain/repositories/otp_repository.dart';
import '../datasource/otp_remote_data_source/otp_remote_data_source_impl.dart';
import '../model/otp_response.dart';

class OtpRepositoryImpl extends OtpRepository {
  OtpRemoteDataSourceImpl otpRemoteDataSourceImpl;

  OtpRepositoryImpl({required this.otpRemoteDataSourceImpl});

  @override
  Future<OtpResponse> verifyOtp(String email, String code) async {
    return otpRemoteDataSourceImpl.validateOtp(email, code);
  }
}
