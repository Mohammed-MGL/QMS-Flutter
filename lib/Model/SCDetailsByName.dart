// class SCDetailsByName {
//   bool isFound;
//   ServiceCenter serviceCenter;
//   WorkTime workTime;
//   List<Services> services;

//   SCDetailsByName(
//       {this.isFound, this.serviceCenter, this.workTime, this.services});

//   SCDetailsByName.fromJson(Map<String, dynamic> json) {
//     isFound = json['is_found'];
//     serviceCenter = json['service_center'] != null
//         ? new ServiceCenter.fromJson(json['service_center'])
//         : null;
//     workTime = json['work_time'] != null
//         ? new WorkTime.fromJson(json['work_time'])
//         : null;
//     if (json['services'] != null) {
//       services = new List<Services>();
//       json['services'].forEach((v) {
//         services.add(new Services.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['is_found'] = this.isFound;
//     if (this.serviceCenter != null) {
//       data['service_center'] = this.serviceCenter.toJson();
//     }
//     if (this.workTime != null) {
//       data['work_time'] = this.workTime.toJson();
//     }
//     if (this.services != null) {
//       data['services'] = this.services.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ServiceCenter {
//   int id;
//   String name;
//   String location;
//   String phone;
//   String image;
//   String icon;
//   bool isOnline;
//   String mapLocations;

//   ServiceCenter(
//       {this.id,
//       this.name,
//       this.location,
//       this.phone,
//       this.image,
//       this.icon,
//       this.isOnline,
//       this.mapLocations});

//   ServiceCenter.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     location = json['location'];
//     phone = json['phone'];
//     image = json['Image'];
//     icon = json['Icon'];
//     isOnline = json['is_online'];
//     mapLocations = json['mapLocations'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['location'] = this.location;
//     data['phone'] = this.phone;
//     data['Image'] = this.image;
//     data['Icon'] = this.icon;
//     data['is_online'] = this.isOnline;
//     data['mapLocations'] = this.mapLocations;
//     return data;
//   }
// }

// class WorkTime {
//   String saturday;
//   String sunday;
//   String monday;
//   String tuesday;
//   String wednesday;
//   String thursday;
//   String friday;

//   WorkTime(
//       {this.saturday,
//       this.sunday,
//       this.monday,
//       this.tuesday,
//       this.wednesday,
//       this.thursday,
//       this.friday});

//   WorkTime.fromJson(Map<String, dynamic> json) {
//     saturday = json['Saturday'];
//     sunday = json['Sunday'];
//     monday = json['Monday'];
//     tuesday = json['Tuesday'];
//     wednesday = json['Wednesday'];
//     thursday = json['Thursday'];
//     friday = json['Friday'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Saturday'] = this.saturday;
//     data['Sunday'] = this.sunday;
//     data['Monday'] = this.monday;
//     data['Tuesday'] = this.tuesday;
//     data['Wednesday'] = this.wednesday;
//     data['Thursday'] = this.thursday;
//     data['Friday'] = this.friday;
//     return data;
//   }
// }

// class Services {
//   int id;
//   String name;
//   bool iSActive;
//   Qdetails qdetails;

//   Services({this.id, this.name, this.iSActive, this.qdetails});

//   Services.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     iSActive = json['IS_Active'];
//     qdetails = json['Qdetails'] != null
//         ? new Qdetails.fromJson(json['Qdetails'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['IS_Active'] = this.iSActive;
//     if (this.qdetails != null) {
//       data['Qdetails'] = this.qdetails.toJson();
//     }
//     return data;
//   }
// }

// class Qdetails {
//   int customersNum;
//   String waitingtime;

//   Qdetails({this.customersNum, this.waitingtime});

//   Qdetails.fromJson(Map<String, dynamic> json) {
//     customersNum = json['customersNum'];
//     waitingtime = json['waitingtime'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['customersNum'] = this.customersNum;
//     data['waitingtime'] = this.waitingtime;
//     return data;
//   }
// }
