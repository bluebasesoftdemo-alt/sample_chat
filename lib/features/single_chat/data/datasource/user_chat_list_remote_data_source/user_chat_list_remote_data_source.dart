import '../../model/user_chat_list_model.dart';

abstract class UserChatListRemoteDataSource {
  Future<UserChatListModel> fetchUserChatList(int to_user_id, int from_user_id,);
}
