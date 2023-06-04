class ForgetPasswordModel {
  String? phone;
  int? code;
  String? type;
  int? country;

  ForgetPasswordModel({this.phone, this.code, this.type, this.country});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    code = json['code'];
    type = json['type'];
    country = json['country'];
  }

}