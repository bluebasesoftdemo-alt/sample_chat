import '../../data/model/login_response.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<LoginResponse> call(String username, String email, bool revoke) {
    return loginRepository.getLoginResult(username, email, revoke);
  }
}
