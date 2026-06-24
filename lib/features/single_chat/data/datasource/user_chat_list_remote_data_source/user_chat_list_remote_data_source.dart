import '../../model/user_chat_list_model.dart';

abstract class UserChatListRemoteDataSource {
  Future<UserChatListModel> fetchUserChatList(
    String to_user_id,
    String from_user_id,
  );
}
