class UserModel {
  User? user;

  UserModel({this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
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
  num? credit;
  bool? verify;
  num? rate;
  num? minimumRate;
  num? minimunAcceptanceRate;
  int? numberOfRatedUsers;
  int? finishedOrders;
  num? totalDebt;
  bool? isSpecial;
  int? fixoEarnings;
  int? additionalWorkFixoEarnings;
  int? sparePartsFixoEarnings;
  List<MainService>? mainService;
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
  Country? country;
  City? city;
  String? commecrialImage;
  String? commecrialEndDate;
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
  bool? fixoCompany;
  String? createdAt;
  String? updatedAt;
  int? id;

  User({
    this.geoLocation,
    this.isCompany,
    this.deleted,
    this.tokens,
    this.activated,
    this.rules,
    this.image,
    this.language,
    this.notification,
    this.socialMediaType,
    this.credit,
    this.verify,
    this.rate,
    this.minimumRate,
    this.minimunAcceptanceRate,
    this.numberOfRatedUsers,
    this.finishedOrders,
    this.totalDebt,
    this.isSpecial,
    this.fixoEarnings,
    this.additionalWorkFixoEarnings,
    this.sparePartsFixoEarnings,
    this.mainService,
    this.status,
    this.userState,
    this.appRateDate,
    this.gracePeriod,
    this.companyName,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.nationality,
    this.country,
    this.city,
    this.commecrialImage,
    this.commecrialEndDate,
    this.frontIdImage,
    this.backIdImage,
    this.idEndDate,
    this.passportImage,
    this.passportEndDate,
    this.stay,
    this.stayEndDate,
    this.bankAccountUserName,
    this.bankAccount,
    this.bankName,
    this.ibanAccount,
    this.personalImage,
    this.type,
    this.fixoCompany,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    geoLocation = json['geoLocation'] != null ? GeoLocation.fromJson(json['geoLocation']) : null;
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
      rules = <Null>[];
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
    minimumRate = json['minimumRate'];
    minimunAcceptanceRate = json['minimunAcceptanceRate'];
    numberOfRatedUsers = json['numberOfRatedUsers'];
    finishedOrders = json['finishedOrders'];
    totalDebt = json['totalDebt'];
    isSpecial = json['isSpecial'];
    fixoEarnings = json['fixoEarnings'];
    additionalWorkFixoEarnings = json['additionalWorkFixoEarnings'];
    sparePartsFixoEarnings = json['sparePartsFixoEarnings'];
    if (json['mainService'] != null) {
      mainService = <MainService>[];
      json['mainService'].forEach((v) {
        mainService!.add(MainService.fromJson(v));
      });
    }
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
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    commecrialImage = json['commecrialImage'];
    commecrialEndDate = json['commecrialEndDate'];
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
    fixoCompany = json['fixoCompany'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (geoLocation != null) {
      data['geoLocation'] = geoLocation!.toJson();
    }
    data['isCompany'] = isCompany;
    data['deleted'] = deleted;
    if (tokens != null) {
      data['tokens'] = tokens!.map((v) => v.toJson()).toList();
    }
    data['activated'] = activated;
    if (rules != null) {
      data['rules'] = rules!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    data['language'] = language;
    data['notification'] = notification;
    data['socialMediaType'] = socialMediaType;
    data['credit'] = credit;
    data['verify'] = verify;
    data['rate'] = rate;
    data['minimumRate'] = minimumRate;
    data['minimunAcceptanceRate'] = minimunAcceptanceRate;
    data['numberOfRatedUsers'] = numberOfRatedUsers;
    data['finishedOrders'] = finishedOrders;
    data['totalDebt'] = totalDebt;
    data['isSpecial'] = isSpecial;
    data['fixoEarnings'] = fixoEarnings;
    data['additionalWorkFixoEarnings'] = additionalWorkFixoEarnings;
    data['sparePartsFixoEarnings'] = sparePartsFixoEarnings;
    if (mainService != null) {
      data['mainService'] = mainService!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['userState'] = userState;
    data['appRateDate'] = appRateDate;
    data['gracePeriod'] = gracePeriod;
    data['companyName'] = companyName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['nationality'] = nationality;
    if (country != null) {
      data['country'] = country?.toJson();
    }
    data['city'] = city?.toJson();
    data['commecrialImage'] = commecrialImage;
    data['commecrialEndDate'] = commecrialEndDate;
    data['frontIdImage'] = frontIdImage;
    data['backIdImage'] = backIdImage;
    data['idEndDate'] = idEndDate;
    data['passportImage'] = passportImage;
    data['passportEndDate'] = passportEndDate;
    data['stay'] = stay;
    data['stayEndDate'] = stayEndDate;
    data['bankAccountUserName'] = bankAccountUserName;
    data['bankAccount'] = bankAccount;
    data['bankName'] = bankName;
    data['ibanAccount'] = ibanAccount;
    data['personalImage'] = personalImage;
    data['type'] = type;
    data['fixoCompany'] = fixoCompany;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class MainService {
  bool? openForCompany;
  int? warrantyTime;
  List<WorkingTime>? workingTime;
  bool? deleted;
  String? name;
  String? description;
  String? icon;
  String? createdAt;
  String? updatedAt;
  int? searchTime;
  int? startSearchDistance;
  int? endSearchDistance;
  int? increaseSearchDistanceBy;
  int? waitingTime;
  int? adminWaitingTime;
  int? id;

  MainService({
    this.openForCompany,
    this.warrantyTime,
    this.workingTime,
    this.deleted,
    this.name,
    this.description,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.searchTime,
    this.startSearchDistance,
    this.endSearchDistance,
    this.increaseSearchDistanceBy,
    this.waitingTime,
    this.adminWaitingTime,
    this.id,
  });

  MainService.fromJson(Map<String, dynamic> json) {
    openForCompany = json['openForCompany'];
    warrantyTime = json['warrantyTime'];
    if (json['workingTime'] != null) {
      workingTime = <WorkingTime>[];
      json['workingTime'].forEach((v) {
        workingTime!.add(WorkingTime.fromJson(v));
      });
    }
    deleted = json['deleted'];
    name = json['name'];
    description = json['description'];
    icon = json['icon'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    searchTime = json['searchTime'];
    startSearchDistance = json['startSearchDistance'];
    endSearchDistance = json['endSearchDistance'];
    increaseSearchDistanceBy = json['increaseSearchDistanceBy'];
    waitingTime = json['waitingTime'];
    adminWaitingTime = json['adminWaitingTime'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['openForCompany'] = openForCompany;
    data['warrantyTime'] = warrantyTime;
    if (workingTime != null) {
      data['workingTime'] = workingTime!.map((v) => v.toJson()).toList();
    }
    data['deleted'] = deleted;
    data['name'] = name;
    data['description'] = description;
    data['icon'] = icon;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['searchTime'] = searchTime;
    data['startSearchDistance'] = startSearchDistance;
    data['endSearchDistance'] = endSearchDistance;
    data['increaseSearchDistanceBy'] = increaseSearchDistanceBy;
    data['waitingTime'] = waitingTime;
    data['adminWaitingTime'] = adminWaitingTime;
    data['id'] = id;
    return data;
  }
}

class WorkingTime {
  String? sId;
  int? day;
  int? from;
  int? to;
  bool? active;
  int? technicalArriveTime;

  WorkingTime({
    this.sId,
    this.day,
    this.from,
    this.to,
    this.active,
    this.technicalArriveTime,
  });

  WorkingTime.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    active = json['active'];
    technicalArriveTime = json['technicalArriveTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['day'] = day;
    data['from'] = from;
    data['to'] = to;
    data['active'] = active;
    data['technicalArriveTime'] = technicalArriveTime;
    return data;
  }
}

class City {
  bool? deleted;
  String? name;
  Country? country;
  String? createdAt;
  String? updatedAt;
  int? id;

  City({
    this.deleted,
    this.name,
    this.country,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  City.fromJson(Map<String, dynamic> json) {
    deleted = json['deleted'];
    name = json['name'];
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deleted'] = deleted;
    data['name'] = name;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}

class Country {
  bool? deleted;
  String? countryCode;
  String? countryKey;
  String? name;
  String? currency;
  String? logo;
  String? createdAt;
  String? updatedAt;
  int? id;

  Country({
    this.deleted,
    this.countryCode,
    this.countryKey,
    this.name,
    this.currency,
    this.logo,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  Country.fromJson(Map<String, dynamic> json) {
    deleted = json['deleted'];
    countryCode = json['countryCode'];
    countryKey = json['countryKey'];
    name = json['name'];
    currency = json['currency'];
    logo = json['logo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deleted'] = deleted;
    data['countryCode'] = countryCode;
    data['countryKey'] = countryKey;
    data['name'] = name;
    data['currency'] = currency;
    data['logo'] = logo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
