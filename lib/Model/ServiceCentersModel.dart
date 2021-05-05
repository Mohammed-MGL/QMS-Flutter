class ServiceCentersModel {
  bool next;
  int total;
  int page;
  List<Results> results;

  ServiceCentersModel({this.next, this.total, this.page, this.results});

  ServiceCentersModel.fromJson(Map<String, dynamic> json) {
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
  String name;
  String location;
  String icon;
  bool isOnline;
  String image;

  Results(
      {this.id,
      this.name,
      this.location,
      this.icon,
      this.isOnline,
      this.image});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    icon = json['Icon'];
    isOnline = json['is_online'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['Icon'] = this.icon;
    data['is_online'] = this.isOnline;
    data['Image'] = this.image;
    return data;
  }
}
