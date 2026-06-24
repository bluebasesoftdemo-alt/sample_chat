/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class UserChatListModel {
  bool? status;
  List<UserChat?>? userchat;

  UserChatListModel({this.status, this.userchat});

  UserChatListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['user_chat'] != null) {
      userchat = <UserChat>[];
      json['user_chat'].forEach((v) {
        userchat!.add(UserChat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['user_chat'] = userchat != null
        ? userchat!.map((v) => v?.toJson()).toList()
        : null;
    return data;
  }
}

class UserChat {
  String? fromusername;
  String? tousername;
  String? privatechatmessage;
  String? timestamp;
  String? status;
  int? touserid;
  int? fromuserid;

  UserChat({
    this.fromusername,
    this.tousername,
    this.privatechatmessage,
    this.timestamp,
    this.status,
    this.touserid,
    this.fromuserid,
  });

  UserChat.fromJson(Map<String, dynamic> json) {
    fromusername = json['from_user_name'];
    tousername = json['to_user_name'];
    privatechatmessage = json['private_chat_message'];
    timestamp = json['timestamp'];
    status = json['status'];
    touserid = json['to_user_id'];
    fromuserid = json['from_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['from_user_name'] = fromusername;
    data['to_user_name'] = tousername;
    data['private_chat_message'] = privatechatmessage;
    data['timestamp'] = timestamp;
    data['status'] = status;
    data['to_user_id'] = touserid;
    data['from_user_id'] = fromuserid;
    return data;
  }
}
