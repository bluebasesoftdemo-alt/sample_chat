import 'package:sample_chat/features/home/data/model/user_list_model.dart';

abstract class UserListRemoteDataSource {
  Future<UserListModel> fetchUserList(int userid, String usertoken);
}
