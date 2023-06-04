class MainServiceModel {
  List<MainServiceData>? mainServiceData;


  MainServiceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      mainServiceData = <MainServiceData>[];
      json['data'].forEach((v) {
        mainServiceData!.add(new MainServiceData.fromJson(v));
      });
    }
  }

}

class MainServiceData {
  bool? openForCompany;
  int? warrantyTime;
  List<WorkingTime>? workingTime;
  bool? deleted;
  Name? name;
  Name? description;
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



  MainServiceData.fromJson(Map<String, dynamic> json) {
    openForCompany = json['openForCompany'];
    warrantyTime = json['warrantyTime'];
    if (json['workingTime'] != null) {
      workingTime = <WorkingTime>[];
      json['workingTime'].forEach((v) {
        workingTime!.add(new WorkingTime.fromJson(v));
      });
    }
    deleted = json['deleted'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
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


}

class WorkingTime {
  String? sId;
  int? day;
  int? from;
  int? to;
  bool? active;
  int? technicalArriveTime;



  WorkingTime.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    active = json['active'];
    technicalArriveTime = json['technicalArriveTime'];
  }

}

class Name {
  String? en;
  String? ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}