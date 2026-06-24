import 'package:sample_chat/features/single_chat/data/model/user_chat_list_model.dart';

import '../../domain/repositories/user_chat_list_repository.dart';
import '../datasource/user_chat_list_remote_data_source/user_chat_list_remote_data_source_impl.dart';

class UserChatListRepositoryImpl extends UserChatListRepository {
  UserChatListRemoteDataSourceImpl userchatlistRemoteDataSourceImpl;

  UserChatListRepositoryImpl({required this.userchatlistRemoteDataSourceImpl});

  @override
  Future<UserChatListModel> getUserChatListResult(
    String to_user_id,
    String from_user_id,
  ) {
    // TODO: implement getUserChatListResult
    return userchatlistRemoteDataSourceImpl.fetchUserChatList(
      to_user_id,
      from_user_id,
    );
  }
}
