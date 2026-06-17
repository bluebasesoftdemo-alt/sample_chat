import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../core/utils/logger.dart';
import '../../data/model/otp_response.dart';
import '../../domain/usecase/otp_usecase.dart';

class OtpProvider extends ChangeNotifier {
  OtpUseCase otpUseCase;
  String? _appSignature;
  String? _smsCode;
  String? _error;
  bool _isVerifying = false;
  bool _isLoading = false;
  bool _isComplete = false;
  bool _resendStatus = false;
  final int codeLength;
  final int maxSeconds;
  int remainingSeconds;
  OtpResponse otpResponse = OtpResponse();

  bool get canResend => remainingSeconds == 0;

  OtpProvider({
    required this.otpUseCase,
    this.codeLength = 6,
    this.maxSeconds = 60 * 2,
  }) : remainingSeconds = 0;

  String? get appSignature => _appSignature;

  bool get isVerifying => _isVerifying;

  bool get isLoading => _isLoading;

  bool get isComplete => _isComplete;

  bool get resendStatus => _resendStatus;

  String? get smsCode => _smsCode;

  String? get error => _error;
  Timer? _timer;

  void listen() async {
    _appSignature = await SmsAutoFill().getAppSignature;
    print('AppSignature Code : $_appSignature');
    SmsAutoFill().listenForCode();
  }

  void update(String code) {
    _isComplete = code.length == codeLength;
    _smsCode = code;
    print(_isComplete);
    notifyListeners();
  }

  void start() {
    if (_timer != null) return;
    remainingSeconds = maxSeconds;
    notifyListeners();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        notifyListeners();
      } else {
        timer.cancel();
        _timer = null;
        _resendStatus = true;
        notifyListeners();
      }
    });
  }

  void resend() {
    if (!canResend) return;
    //onResend();
    start();
  }

  @override
  void dispose() {
    _timer?.cancel();
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  Future<String> execute(String phone, String code, String purpose) async {
    _isLoading = true;
    notifyListeners();
    try {
      otpResponse =
          (await otpUseCase.call(phone, code, purpose)) as OtpResponse;
      Log.i(
        'OtpScreen ::  Registered User Status : ${otpResponse.is_new_user!}',
      );
      if (otpResponse.is_new_user! == true &&
          otpResponse.flow_completed! == false) {
        //NewUser = true and ProfileComplete = false
        // PrefUtils().setMobileno(phone);
        // PrefUtils().setUuid(otpResponse.user_id);
        return 'addProfile';
      } else if (otpResponse.is_new_user! == false &&
          otpResponse.flow_completed! == true) {
        //NewUser = false[oldUser] ProfileCompleted = true
        //  PrefUtils().setMobileno(phone);
        //    PrefUtils().setUuid(otpResponse.user_id);
        return 'landing';
      } else {
        //NewUser = false and ProfileCompleted = false
        //  PrefUtils().setMobileno(phone);
        //  PrefUtils().setUuid(otpResponse.user_id);
        return 'addProfile';
      }
      /* if(otpResponse.is_new_user! && otpResponse.flow_completed!){
        Log.i('OtpScreen :: NewUser');
        PrefUtils().setMobileno(phone);
        PrefUtils().setUuid(otpResponse.user_id);
      }else{
        Log.i('OtpScreen :: Old User');
        PrefUtils().setMobileno(phone);
        PrefUtils().setUuid(otpResponse.user_id);
      }*/
      // return otpResponse.is_new_user! && otpResponse.flow_completed!;
      // success logic here
    } catch (e) {
      _error = e.toString();
      throw Exception();
      // handle errors
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
