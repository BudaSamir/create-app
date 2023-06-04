import '../user_model.dart';

class LoginModel {
  String? type;
  String? message;
  String? accessToken;
 // print("data1");
  LoginModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    accessToken = json['token'];
    //data = LoginData.fromJson(json['user']);
    print("data");
  }
}
