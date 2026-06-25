import 'package:sample_chat/features/home/data/model/user_list_model.dart';

import '../../domain/repositories/userlist_repository.dart';
import '../datasource/user_list_remote_data_source/user_list_remote_data_source_impl.dart';

class UserListRepositoryImpl extends UserListRepository {
  UserListRemoteDataSourceImpl userlistRemoteDataSourceImpl;

  UserListRepositoryImpl({required this.userlistRemoteDataSourceImpl});

  @override
  Future<UserListModel> getUserListResult(int userid, String usertoken) {
    // TODO: implement getLoginResult
    return userlistRemoteDataSourceImpl.fetchUserList(userid, usertoken);
  }
}
