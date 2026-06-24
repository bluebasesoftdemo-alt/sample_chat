import 'package:flutter/material.dart';
import 'package:sample_chat/features/home/data/model/user_list_model.dart';

import '../../../../core/utils/logger.dart';
import '../../domain/usecase/userlist_usecase.dart';

class UserListProvider extends ChangeNotifier {
  final UserListUseCase userlistUseCase;
  bool _isLoading = false;
  String _error = '';

  bool get isLoading => _isLoading;

  String get error => _error;
  bool result = false;
  UserListModel userListModel = UserListModel();

  UserListProvider({required this.userlistUseCase});

  Future<bool> execute(String userid, String usertoken) async {
    _isLoading = true;
    //notifyListeners();
    try {
      userListModel = await userlistUseCase.call(userid, usertoken);
      Log.i("LoginProvider :: LoginRespnonse : $userListModel");
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
