class ServiceModel {
  int id;
  String name;
  int queueCount;
  String waitingTime;
  bool isInQ;

  ServiceModel(
      {this.id, this.name, this.queueCount, this.waitingTime, this.isInQ});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    queueCount = json['queueCount'];
    waitingTime = json['waitingTime'];
    isInQ = json['is_inQ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['queueCount'] = this.queueCount;
    data['waitingTime'] = this.waitingTime;
    data['is_inQ'] = this.isInQ;
    return data;
  }
}
