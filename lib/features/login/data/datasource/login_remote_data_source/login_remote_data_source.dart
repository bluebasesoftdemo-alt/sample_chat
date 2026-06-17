import '../../model/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> fetchLoginResult(String username, String email);
}
