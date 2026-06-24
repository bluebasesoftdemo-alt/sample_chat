import 'package:sample_chat/features/home/data/model/user_list_model.dart';

import '../repositories/userlist_repository.dart';

class UserListUseCase {
  UserListRepository userlistRepository;

  UserListUseCase({required this.userlistRepository});

  Future<UserListModel> call(String userid, String usertoken) {
    return userlistRepository.getUserListResult(userid, usertoken);
  }
}
