class UserRespo {
  bool? success;
  String? message;
  String? token;
  String? name;
  String? refreshToken;

  UserRespo(
      {this.success, this.message, this.token, this.name, this.refreshToken});

  UserRespo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    name = json['name'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    data['name'] = this.name;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}