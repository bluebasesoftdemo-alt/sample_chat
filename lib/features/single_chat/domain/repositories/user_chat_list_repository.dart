import '../../data/model/user_chat_list_model.dart';

abstract class UserChatListRepository {
  Future<UserChatListModel> getUserChatListResult(int to_user_id, int from_user_id,);
}
