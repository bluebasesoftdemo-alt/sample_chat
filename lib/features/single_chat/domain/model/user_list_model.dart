/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Message {
  int? userid;
  String? username;
  String? userprofile;
  String? userloginstatus;
  int? countstatus;

  Message({
    this.userid,
    this.username,
    this.userprofile,
    this.userloginstatus,
    this.countstatus,
  });

  Message.fromJson(Map<String, dynamic> json) {
    userid = json['user_id'];
    username = json['user_name'];
    userprofile = json['user_profile'];
    userloginstatus = json['user_login_status'];
    countstatus = json['count_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userid;
    data['user_name'] = username;
    data['user_profile'] = userprofile;
    data['user_login_status'] = userloginstatus;
    data['count_status'] = countstatus;
    return data;
  }
}

class UserListModel {
  bool? status;
  List<Message?>? message;

  UserListModel({this.status, this.message});

  UserListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['message'] != null) {
      message = <Message>[];
      json['message'].forEach((v) {
        message!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message != null
        ? message!.map((v) => v?.toJson()).toList()
        : null;
    return data;
  }
}
