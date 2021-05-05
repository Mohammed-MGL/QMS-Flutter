import 'dart:convert' as convert;
import '../Model/ServiceCentersModel.dart';
import 'package:http/http.dart' as http;

class ServiceCentersRepo {
  String baseUrl = "192.168.1.2:8000";

  Future<ServiceCentersModel> getAllServiceCenters(int pagenum) async {
    final urlExtention = '/API/allServiceCenter/';

    final response =
        await http.get((Uri.http(baseUrl, urlExtention, {"page": "$pagenum"})));
    if (response.statusCode == 200) {
      ServiceCentersModel rs =
          ServiceCentersModel.fromJson(convert.jsonDecode(response.body));
      return rs;
    } else {
      //Fixs
      return null;
    }
  }

  Future<ServiceCentersModel> searchForServiceCenters(String serviceWord, int pagenum) async {

    final urlExtention = '/API/search/ServiceCenter/$serviceWord';
    final response =
        await http.get((Uri.http(baseUrl, urlExtention, {"page": "$pagenum"})));
    if (response.statusCode == 200) {
      ServiceCentersModel rs =
          ServiceCentersModel.fromJson(convert.jsonDecode(response.body));
      return rs;
    } else {
      //Fixs
      return null;
    }
  }
}
