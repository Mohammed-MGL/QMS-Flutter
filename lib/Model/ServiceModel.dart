class ServiceModel {
  String serviceName;
  int queueCount;
  String waitingTime;
  bool isInQ;

  ServiceModel(
      {this.serviceName, this.queueCount, this.waitingTime, this.isInQ});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    serviceName = json['serviceName'];
    queueCount = json['queueCount'];
    waitingTime = json['waitingTime'];
    isInQ = json['is_inQ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceName'] = this.serviceName;
    data['queueCount'] = this.queueCount;
    data['waitingTime'] = this.waitingTime;
    data['is_inQ'] = this.isInQ;
    return data;
  }
}
