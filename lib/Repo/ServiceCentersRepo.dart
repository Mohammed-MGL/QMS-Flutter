import 'dart:convert' as convert;
import 'package:qms/Repo/Storage.dart';

import '../Model/ServiceCentersModel.dart';
import 'package:http/http.dart' as http;

class ServiceCentersRepo {
  Storage storage = Storage();
  String baseUrl = "192.168.1.2:8000";

  Future<List> getAllServiceCenters(int pagenum) async {
    final urlExtention = '/API/allServiceCenter/';
    String token = await storage.readToken();
    final response = await http.get(
      (Uri.http(baseUrl, urlExtention, {"page": "$pagenum"})),
      headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      ServiceCentersModel rs =
          ServiceCentersModel.fromJson(convert.jsonDecode(response.body));
      dynamic returnList = [1, rs];

      return returnList;
    } else if (response.statusCode == 401) {
      storage.deleteToken();
      dynamic returnList = [2];

      return returnList;
    }
  }

  Future<List> searchForServiceCenters(String serviceWord, int pagenum) async {
    final urlExtention = '/API/search/ServiceCenter/$serviceWord';
    String token = await storage.readToken();

    final response = await http.get(
      (Uri.http(baseUrl, urlExtention, {"page": "$pagenum"})),
      headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      ServiceCentersModel rs =
          ServiceCentersModel.fromJson(convert.jsonDecode(response.body));
      print("getAllServiceCenters<<  ${rs.results.length} >>");

      dynamic returnList = [1, rs];

      return returnList;
    } else if (response.statusCode == 401) {
      storage.deleteToken();
      dynamic returnList = [2];

      return returnList;
    }
  }
}
