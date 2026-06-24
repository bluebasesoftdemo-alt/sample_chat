import 'package:sample_chat/features/home/data/model/user_list_model.dart';

abstract class UserListRepository {
  Future<UserListModel> getUserListResult(String userid, String usertoken);
}
