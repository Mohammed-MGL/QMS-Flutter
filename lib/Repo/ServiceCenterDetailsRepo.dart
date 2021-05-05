import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../Model/ServiceCenterDetailsModel.dart';

class ServiceCenterDetailsRepo {
  String baseUrl = "192.168.1.2:8000";
  // testurl = 'http://127.0.0.1:8000/API/Service_Center_detail/';

  Future<ServiceCenterDetailsModel> fetch_service_center(int serv) async {
    final urlExtention = '/API/ServiceCenterDetails/$serv';
     final response =
        await http.get((Uri.http(baseUrl, urlExtention,)));
    if (response.statusCode == 200) {
      ServiceCenterDetailsModel rs =
          ServiceCenterDetailsModel.fromJson(convert.jsonDecode(response.body));
      return rs;
    } else
      return null;
  }
}
