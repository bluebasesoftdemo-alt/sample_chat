import '../../data/model/user_chat_list_model.dart';

abstract class UserChatListRepository {
  Future<UserChatListModel> getUserChatListResult(
    String to_user_id,
    String from_user_id,
  );
}
