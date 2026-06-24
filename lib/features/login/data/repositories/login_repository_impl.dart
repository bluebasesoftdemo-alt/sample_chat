import '../../domain/repositories/login_repository.dart';
import '../datasource/login_remote_data_source/login_remote_data_source_impl.dart';
import '../model/login_response.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRemoteDataSourceImpl loginRemoteDataSourceImpl;

  LoginRepositoryImpl({required this.loginRemoteDataSourceImpl});

  @override
  Future<LoginResponse> getLoginResult(
    String username,
    String email,
    bool revoke,
  ) {
    return loginRemoteDataSourceImpl.fetchLoginResult(username, email, revoke);
  }
}
