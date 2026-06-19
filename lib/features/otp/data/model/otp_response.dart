class OtpResponse {
  String? message;
  bool? status;
  String? user_id;
  String? name;
  String? profile;
  String? token;

  OtpResponse({this.message, this.status, this.user_id});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    user_id = json['user_id'];
    name = json['name'];
    profile = json['profile'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['user_id'] = user_id;
    data['name'] = name;
    data['profile'] = profile;
    data['token'] = token;
    return data;
  }
}
