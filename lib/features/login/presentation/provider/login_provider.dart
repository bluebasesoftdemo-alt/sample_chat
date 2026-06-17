import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../core/utils/logger.dart';
import '../../data/model/login_response.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  bool _isLoading = false;
  String _error = '';

  bool get isLoading => _isLoading;

  String get error => _error;
  bool result = false;
  LoginResponse loginResponse = LoginResponse();

  LoginProvider({required this.loginUseCase});

  Future<bool> execute(String username, String email) async {
    _isLoading = true;
    notifyListeners();
    try {
      loginResponse = await loginUseCase.call(username, email);
      Log.i("LoginProvider :: LoginRespnonse : $loginResponse");
      loginResponse.status == true ? result = true : result = false;
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
