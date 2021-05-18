class ReservationModel {
  bool next;
  int total;
  int page;
  List<Results> results;

  ReservationModel({this.next, this.total, this.page, this.results});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    total = json['total'];
    page = json['page'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    data['total'] = this.total;
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int id;
  Service service;

  Results({this.id, this.service});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service =
        json['Service'] != null ? new Service.fromJson(json['Service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.service != null) {
      data['Service'] = this.service.toJson();
    }
    return data;
  }
}

class Service {
  int id;
  String name;
  ServiceCenter serviceCenter;
  Qdetails qdetails;

  Service({this.id, this.name, this.serviceCenter, this.qdetails});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    serviceCenter = json['Service_center'] != null
        ? new ServiceCenter.fromJson(json['Service_center'])
        : null;
    qdetails = json['Qdetails'] != null
        ? new Qdetails.fromJson(json['Qdetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.serviceCenter != null) {
      data['Service_center'] = this.serviceCenter.toJson();
    }
    if (this.qdetails != null) {
      data['Qdetails'] = this.qdetails.toJson();
    }
    return data;
  }
}

class ServiceCenter {
  String name;
  String icon;

  ServiceCenter({this.name, this.icon});

  ServiceCenter.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['Icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['Icon'] = this.icon;
    return data;
  }
}

class Qdetails {
  int customersNum;
  String waitingtime;

  Qdetails({this.customersNum, this.waitingtime});

  Qdetails.fromJson(Map<String, dynamic> json) {
    customersNum = json['customersNum'];
    waitingtime = json['waitingtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customersNum'] = this.customersNum;
    data['waitingtime'] = this.waitingtime;
    return data;
  }
}
