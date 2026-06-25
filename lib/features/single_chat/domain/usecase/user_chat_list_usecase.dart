import '../../data/model/user_chat_list_model.dart';
import '../repositories/user_chat_list_repository.dart';

class UserChatListUseCase {
  UserChatListRepository userchatlistRepository;

  UserChatListUseCase({required this.userchatlistRepository});

  Future<UserChatListModel> call(int to_userid, int from_user_id) {
    return userchatlistRepository.getUserChatListResult(to_userid, from_user_id);
  }
}
