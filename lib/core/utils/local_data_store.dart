import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  HiveService._();

  static final HiveService instance = HiveService._();

  late Box box;

  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('appBox');
  }

  //UserId
  Future<void> setUserId(dynamic value) async {
    await box.put('kUserId', value);
  }

  dynamic getUserId() {
    return box.get('kUserId');
  }

  //Email
  Future<void> setUserEmail(dynamic value) async {
    await box.put('kUserEmail', value);
  }

  dynamic getUserEmail(String key) {
    return box.get('kUserEmail');
  }

  //UserName
  Future<void> setUserName(dynamic value) async {
    await box.put('kUserName', value);
  }

  dynamic getUserName(String key) {
    return box.get('kUserName');
  }

  //UserProfile
  Future<void> setUserProfile(dynamic value) async {
    await box.put('kUserProfile', value);
  }

  dynamic getUserProfile(String key) {
    return box.get('kUserProfile');
  }

  //UserToken
  Future<void> setUserToken(dynamic value) async {
    await box.put('kUserToken', value);
  }

  dynamic getUserToken(String key) {
    return box.get('kUserToken');
  }

  // Delete
  Future<void> removeData(String key) async {
    await box.delete(key);
  }
}

/*
class PrefUtils {
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  //Partial Clear
  void clearPartialPreferencesData() async {
    setUserid('');
    setUserEmail('');
    setUserName('');
    setUserProfile('');
    setUserToken('');
  }

  //1.OtpProvider Set the UUID
  Future<void> setUuid(String? value) {
    return _sharedPreferences!.setString('kUuid', value!);
  }

  String getUuid() {
    try {
      return _sharedPreferences!.getString('kUuid') ?? '';
    } catch (e) {
      return '';
    }
  }

  //2.Address Remote DataSource set teh DeviceId
  Future<void> setDeviceId(String? value) {
    return _sharedPreferences!.setString('Did', value!);
  }

  String getDeviceId() {
    try {
      return _sharedPreferences!.getString('Did') ?? '';
    } catch (e) {
      return '';
    }
  }

  // 3. OtpProvider Set the Mobile
  Future<void> setUserid(String value) {
    return _sharedPreferences!.setString('kUserId', value);
  }

  String getUserid() {
    try {
      return _sharedPreferences!.getString('kUserId') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setUserEmail(String value) {
    return _sharedPreferences!.setString('kUserEmail', value);
  }

  String getUserEmail() {
    try {
      return _sharedPreferences!.getString('kUserEmail') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setUserName(String value) {
    return _sharedPreferences!.setString('kUserName', value);
  }

  String getUserName() {
    try {
      return _sharedPreferences!.getString('kUserName') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setUserProfile(String value) {
    return _sharedPreferences!.setString('kProfileUrl', value);
  }

  String getUserProfile() {
    try {
      return _sharedPreferences!.getString('kProfileUrl') ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> setUserToken(String value) {
    return _sharedPreferences!.setString('kUserToken', value);
  }

  String getUserToken() {
    try {
      return _sharedPreferences!.getString('kUserToken') ?? '';
    } catch (e) {
      return '';
    }
  }
}
*/
