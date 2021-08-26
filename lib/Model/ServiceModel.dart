class ServiceModel {
  
  int id;
  String scname;
  int uid;
  String name;
  int queueCount;
  int waitingTime;
  int queueCountInSC;
  int waitingTimeInCS;
  bool isInQ;
  bool isInCenter;
  bool isServing;
  String empName;
  String empDeskNumber;

  ServiceModel(
      {this.id,
      this.scname,
      this.uid,
      this.name,
      this.queueCount,
      this.waitingTime,
      this.queueCountInSC,
      this.waitingTimeInCS,
      this.isInQ,
      this.isInCenter,
      this.isServing,
      this.empName,
      this.empDeskNumber});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scname = json['scname'];
    uid = json['uid'];
    name = json['name'];
    queueCount = json['queueCount'];
    waitingTime = json['waitingTime'];
    queueCountInSC = json['queueCountInSC'];
    waitingTimeInCS = json['waitingTimeInCS'];
    isInQ = json['is_inQ'];
    isInCenter = json['is_InCenter'];
    isServing = json['is_serving'];
    empName = json['empName'];
    empDeskNumber = json['empDesk_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scname'] = this.scname;
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['queueCount'] = this.queueCount;
    data['waitingTime'] = this.waitingTime;
    data['queueCountInSC'] = this.queueCountInSC;
    data['waitingTimeInCS'] = this.waitingTimeInCS;
    data['is_inQ'] = this.isInQ;
    data['is_InCenter'] = this.isInCenter;
    data['is_serving'] = this.isServing;
    data['empName'] = this.empName;
    data['empDesk_number'] = this.empDeskNumber;
    return data;
  }
}