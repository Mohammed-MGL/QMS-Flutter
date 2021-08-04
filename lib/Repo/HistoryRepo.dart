import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qms/Model/HistoryModel.dart';
import 'dart:convert' as convert;

import 'package:qms/Repo/Storage.dart';

class HistoryRepo {
  Storage storage = Storage();
  String baseUrl = "192.168.43.247:8000";

  Future<List> getHistory(int pagenum) async {
    final urlExtention = '/API/UserHistory/';
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
      HistoryModel rs =
          HistoryModel.fromJson(convert.jsonDecode(response.body));
      dynamic returnList = [1, rs];

      return returnList;
    } else if (response.statusCode == 401) {
      storage.deleteToken();
      dynamic returnList = [2];

      return returnList;
    }
  }
}
