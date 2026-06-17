class OtpResponse {
  bool? addressverified;
  bool? isnewuser;
  String? message;
  bool? requiresprofilecompletion;
  bool? success;
  String? userid;

  OtpResponse({this.addressverified, this.isnewuser, this.message, this.requiresprofilecompletion, this.success, this.userid});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    addressverified = json['address_verified'];
    isnewuser = json['is_new_user'];
    message = json['message'];
    requiresprofilecompletion = json['requires_profile_completion'];
    success = json['success'];
    userid = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['address_verified'] = addressverified;
    data['is_new_user'] = isnewuser;
    data['message'] = message;
    data['requires_profile_completion'] = requiresprofilecompletion;
    data['success'] = success;
    data['user_id'] = userid;
    return data;
  }
}

