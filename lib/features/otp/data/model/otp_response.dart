class OtpResponse {
  String? message;
  bool? success;
  String? user_id;
  bool? is_new_user;
  bool? flow_completed;
  OtpResponse({this.message, this.success, this.user_id, this.is_new_user , this.flow_completed});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    user_id = json['user_id'];
    is_new_user = json['is_new_user'];
    flow_completed = json['flow_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['success'] = success;
    data['user_id'] = user_id;
    data['is_new_user'] = is_new_user;
    data['flow_completed'] = flow_completed;
    return data;
  }
}

