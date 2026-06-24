import 'package:flutter/material.dart';

import '../../../../core/utils/logger.dart';
import '../../data/model/user_chat_list_model.dart';
import '../../domain/usecase/user_chat_list_usecase.dart';

class UserChatListProvider extends ChangeNotifier {
  final UserChatListUseCase userchatlistUseCase;
  bool _isLoading = false;
  String _error = '';

  bool get isLoading => _isLoading;

  String get error => _error;
  bool result = false;
  UserChatListModel userchatListModel = UserChatListModel();

  UserChatListProvider({required this.userchatlistUseCase});

  Future<bool> execute(String to_user_id, String from_user_id) async {
    _isLoading = true;
    //notifyListeners();
    try {
      userchatListModel = await userchatlistUseCase.call(
        to_user_id,
        from_user_id,
      );
      Log.i("LoginProvider :: LoginRespnonse : $userchatListModel");
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
