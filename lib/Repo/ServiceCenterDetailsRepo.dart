import 'package:http/http.dart' as http;
import 'package:qms/Model/SCDetailsByName.dart';
import 'package:qms/Repo/Storage.dart';
import 'dart:convert' as convert;

import '../Model/ServiceCenterDetailsModel.dart';

class ServiceCenterDetailsRepo {
  Storage storage = Storage();

  String baseUrl = "192.168.108.98:8000";
  // testurl = 'http://127.0.0.1:8000/API/Service_Center_detail/';

  Future<List> fetch_service_center(int serv) async {
    final urlExtention = '/API/ServiceCenterDetails/$serv';
    String token = await storage.readToken();

    final response = await http.get(
      (Uri.http(
        baseUrl,
        urlExtention,
      )),
      headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      ServiceCenterDetailsModel rs =
          ServiceCenterDetailsModel.fromJson(convert.jsonDecode(response.body));
      dynamic returnList = [1, rs];

      return returnList;
    } else if (response.statusCode == 401) {
      storage.deleteToken();
      dynamic returnList = [2];

      return returnList;
    }
    else if (response.statusCode == 404){
      dynamic returnList = [3];
            return returnList;


    }
  }

  // Future<List> fetch_service_centerByName(String scName) async {
  //   final urlExtention = '/API/ServiceCenterDetailsByName/$scName';
  //   String token = await storage.readToken();

  //   final response = await http.get(
  //     (Uri.http(
  //       baseUrl,
  //       urlExtention,
  //     )),
  //     headers: <String, String>{
  //       "Accept": "application/json",
  //       "Content-Type": "application/x-www-form-urlencoded",
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     SCDetailsByName rs =
  //         SCDetailsByName.fromJson(convert.jsonDecode(response.body));
  //     dynamic returnList = [1, rs];

  //     return returnList;
  //   } else if (response.statusCode == 401) {
  //     storage.deleteToken();
  //     dynamic returnList = [2];

  //     return returnList;
  //   }
  // }
}
