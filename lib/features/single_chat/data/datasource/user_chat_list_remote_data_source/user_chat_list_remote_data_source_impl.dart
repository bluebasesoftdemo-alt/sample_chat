import 'package:dio/dio.dart';
import 'package:sample_chat/features/single_chat/data/datasource/user_chat_list_remote_data_source/user_chat_list_remote_data_source.dart';
import 'package:sample_chat/features/single_chat/data/model/user_chat_list_model.dart';

import '../../../../../core/utils/logger.dart';

class UserChatListRemoteDataSourceImpl extends UserChatListRemoteDataSource {
  @override
  Future<UserChatListModel> fetchUserChatList(
    int to_user_id,
    int from_user_id,
  ) async {
    // TODO: implement fetchUserList
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2/realtime_chat/",
        headers: {"Content-Type": "application/json"},
        //receiveTimeout: Duration(seconds: 1),
        // connectTimeout: Duration(seconds: 1),
      ),
    );
    try {
      final userchatlistresponse = await dio.post(
        'get_user_chat.php',
        data: {"to_user_id": to_user_id, "from_user_id": from_user_id},
      );
      Log.i(userchatlistresponse.statusCode);
      if (userchatlistresponse.statusCode == 200) {
        Log.i(
          'UserChatListRemoteDataSourceImpl :: Http : Status Code : ${userchatlistresponse.statusCode}',
        );
        dynamic response = userchatlistresponse.data;
        Log.i(
          'UserChatListRemoteDataSourceImpl :: Http : Response Data : $response',
        );
        Map<String, dynamic> data = Map<String, dynamic>.from(response);
        UserChatListModel mLoginResponse = UserChatListModel.fromJson(data);
        return mLoginResponse;
      } else {
        Log.i('UserChatListRemoteDataSourceImpl :: Unable to load the data');
        throw Exception();
      }
    } catch (e) {
      Log.i(
        'UserChatListRemoteDataSourceImpl :: Something Went Wrong!  ${e.toString()}',
      );
      throw Exception('Some thing Went Wrong! : ${e.toString()}');
    }
  }
}
