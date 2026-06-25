import 'package:dio/dio.dart';
import 'package:sample_chat/features/home/data/datasource/user_list_remote_data_source/user_list_remote_data_source.dart';
import 'package:sample_chat/features/home/data/model/user_list_model.dart';

import '../../../../../core/utils/logger.dart';

class UserListRemoteDataSourceImpl extends UserListRemoteDataSource {
  @override
  Future<UserListModel> fetchUserList(int userid, String usertoken) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://10.0.2.2/realtime_chat/",
        headers: {"Content-Type": "application/json"},
        //receiveTimeout: Duration(seconds: 1),
        // connectTimeout: Duration(seconds: 1),
      ),
    );
    try {
      final userlistresponse = await dio.post(
        'get_user.php',
        data: {"user_id": userid, "user_token": usertoken},
      );
      Log.i(userlistresponse.statusCode);
      if (userlistresponse.statusCode == 200) {
        Log.i(
          'UserListRemoteDataSourceImpl :: Http : Status Code : ${userlistresponse.statusCode}',
        );
        dynamic response = userlistresponse.data;
        Log.i(
          'UserListRemoteDataSourceImpl :: Http : Response Data : $response',
        );
        Map<String, dynamic> data = Map<String, dynamic>.from(response);
        UserListModel mLoginResponse = UserListModel.fromJson(data);
        return mLoginResponse;
      } else {
        Log.i('UserListRemoteDataSourceImpl :: Unable to load the data');
        throw Exception();
      }
    } catch (e) {
      Log.i(
        'UserListRemoteDataSourceImpl :: Something Went Wrong!  ${e.toString()}',
      );
      throw Exception('Some thing Went Wrong! : ${e.toString()}');
    }
  }
}
