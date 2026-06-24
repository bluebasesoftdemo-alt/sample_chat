import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../core/utils/logger.dart';
import '../../data/model/login_response.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  bool _isLoading = false;
  String _error = '';
  String _message = '';

  bool get isLoading => _isLoading;

  String get error => _error;

  String get message => _message;
  bool result = false;
  LoginResponse _loginResponse = LoginResponse();

  LoginResponse get loginResponse => _loginResponse;

  LoginProvider({required this.loginUseCase});

  Future<bool> execute(String username, String email, bool revoke) async {
    _isLoading = true;
    notifyListeners();
    try {
      _loginResponse = await loginUseCase.call(username, email, revoke);
      Log.i("LoginProvider :: LoginRespnonse : $loginResponse");
      _loginResponse.status == true ? result = true : result = false;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return result;
  }
}
