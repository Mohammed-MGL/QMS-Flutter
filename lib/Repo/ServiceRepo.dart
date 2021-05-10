import 'package:http/http.dart' as http;
import 'package:qms/Model/ServiceModel.dart';
import 'package:qms/Repo/Storage.dart';
import 'dart:convert' as convert;


class ServiceRepo {
  Storage storage = Storage();

  String baseUrl = "192.168.137.1:8000";

  Future<List> getServiceDetails(int serviceID) async {
    final urlExtention = 'API/ServiceDetails/$serviceID';
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
      ServiceModel rs =
          ServiceModel.fromJson(convert.jsonDecode(response.body));
      dynamic returnList = [1, rs];

      return returnList;
    } else if (response.statusCode == 401) {
      storage.deleteToken();
      dynamic returnList = [2];

      return returnList;
    }
  }
}
