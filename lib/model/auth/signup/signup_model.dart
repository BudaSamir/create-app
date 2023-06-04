//This model is use for documents

import '../main_service_model.dart';

class SignupModel {
  User? user;

  SignupModel({this.user});

  SignupModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }


}

class User {
  GeoLocation? geoLocation;
  bool? isCompany;
  bool? deleted;
  List<dynamic>? tokens;
  bool? activated;
  List<dynamic>? rules;
  String? image;
  String? language;
  bool? notification;
  String? socialMediaType;
  int? credit;
  bool? verify;
  int? rate;
  int? numberOfRatedUsers;
  int? finishedOrders;
  int? totalDebt;
  bool? isSpecial;
  int? fixoEarnings;
  int? additionalWorkFixoEarnings;
  int? sparePartsFixoEarnings;
  List<int>? mainService;
  String? status;
  String? userState;
  String? appRateDate;
  int? gracePeriod;
  String? companyName;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  int? nationality;
  int? country;
  int? city;
  String? frontIdImage;
  String? backIdImage;
  String? idEndDate;
  String? passportImage;
  String? passportEndDate;
  String? stay;
  String? stayEndDate;
  String? bankAccountUserName;
  String? bankAccount;
  String? bankName;
  String? ibanAccount;
  String? personalImage;
  String? type;
  String? workId;
  String? shareCode;
  String? createdAt;
  String? updatedAt;
  int? id;



  User.fromJson(Map<String, dynamic> json) {
    geoLocation = json['geoLocation'] != null
        ? GeoLocation.fromJson(json['geoLocation'])
        : null;
    isCompany = json['isCompany'];
    deleted = json['deleted'];
    if (json['tokens'] != null) {
      tokens = [];
      json['tokens'].forEach((v) {
        tokens!.add(v);
      });
    }
    activated = json['activated'];
    if (json['rules'] != null) {
      rules = [];
      json['rules'].forEach((v) {
        rules!.add(v);
      });
    }
    image = json['image'];
    language = json['language'];
    notification = json['notification'];
    socialMediaType = json['socialMediaType'];
    credit = json['credit'];
    verify = json['verify'];
    rate = json['rate'];
    numberOfRatedUsers = json['numberOfRatedUsers'];
    finishedOrders = json['finishedOrders'];
    totalDebt = json['totalDebt'];
    isSpecial = json['isSpecial'];
    fixoEarnings = json['fixoEarnings'];
    additionalWorkFixoEarnings = json['additionalWorkFixoEarnings'];
    sparePartsFixoEarnings = json['sparePartsFixoEarnings'];
    mainService = json['mainService'].cast<int>();
    status = json['status'];
    userState = json['userState'];
    appRateDate = json['appRateDate'];
    gracePeriod = json['gracePeriod'];
    companyName = json['companyName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    nationality = json['nationality'];
    country = json['country'];
    city = json['city'];
    frontIdImage = json['frontIdImage'];
    backIdImage = json['backIdImage'];
    idEndDate = json['idEndDate'];
    passportImage = json['passportImage'];
    passportEndDate = json['passportEndDate'];
    stay = json['stay'];
    stayEndDate = json['stayEndDate'];
    bankAccountUserName = json['bankAccountUserName'];
    bankAccount = json['bankAccount'];
    bankName = json['bankName'];
    ibanAccount = json['ibanAccount'];
    personalImage = json['personalImage'];
    type = json['type'];
    workId = json['workId'];
    shareCode = json['shareCode'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

}

class GeoLocation {
  String? type;
  List<double>? coordinates;

  GeoLocation({this.type, this.coordinates});

  GeoLocation.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

}