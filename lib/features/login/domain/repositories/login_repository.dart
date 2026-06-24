import '../../data/model/login_response.dart';

abstract class LoginRepository {
  Future<LoginResponse> getLoginResult(
    String username,
    String email,
    bool revoke,
  );
}
