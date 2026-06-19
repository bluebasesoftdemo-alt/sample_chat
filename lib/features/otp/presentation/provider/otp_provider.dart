import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../../../core/utils/local_data_store.dart';
import '../../../../core/utils/logger.dart';
import '../../data/model/otp_response.dart';
import '../../domain/usecase/otp_usecase.dart';

class OtpProvider extends ChangeNotifier {
  OtpUseCase otpUseCase;
  String? _smsCode;
  bool _isLoading = false;
  OtpResponse otpResponse = OtpResponse();

  OtpProvider({required this.otpUseCase});

  String? get smsCode => _smsCode;

  void update(String code) {
    _smsCode = code;
    notifyListeners();
  }

  Future<bool> execute(String email) async {
    _isLoading = true;
    bool status = false;
    notifyListeners();
    try {
      otpResponse = await otpUseCase.call(email, _smsCode!);
      Log.i("OTPProvider :: OTPRespnonse : $otpResponse");
      if (otpResponse.status!) {
        HiveService.instance.setUserEmail(email);
        HiveService.instance.setUserToken(otpResponse.token);
        HiveService.instance.setUserProfile(otpResponse.profile);
        HiveService.instance.setUserName(otpResponse.name);
        HiveService.instance.setUserId(otpResponse.user_id);
        status = true;
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return status;
  }
}
