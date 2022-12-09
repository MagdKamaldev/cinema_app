class LoginModel {
  String? token;
  String? message;

  LoginModel({this.token, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['jwt'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jwt'] = token;
    data['message'] = message;
    return data;
  }
}
