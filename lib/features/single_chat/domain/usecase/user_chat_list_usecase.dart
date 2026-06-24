import '../../data/model/user_chat_list_model.dart';
import '../repositories/user_chat_list_repository.dart';

class UserChatListUseCase {
  UserChatListRepository userchatlistRepository;

  UserChatListUseCase({required this.userchatlistRepository});

  Future<UserChatListModel> call(String userid, String usertoken) {
    return userchatlistRepository.getUserChatListResult(userid, usertoken);
  }
}
