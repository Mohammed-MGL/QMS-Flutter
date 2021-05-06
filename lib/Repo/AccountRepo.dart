import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:qms/Model/userModel.dart';
import 'dart:convert' as convert;

import '../Model/ServiceCenterDetailsModel.dart';

class AccountRepo {
  String baseUrl = "192.168.1.2:8000";
  // testurl = 'http://127.0.0.1:8000/API/Service_Center_detail/';

  Future<List> accountRegister({
    @required String username,
    @required String password,
    @required String password2,
    @required String email,
    @required String firstName,
    @required String lastName,
  }) async {
    final urlExtention = 'API/account/register/';

    final response = await http.post(
      (Uri.http(
        baseUrl,
        urlExtention,
      )),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'password2': password2,
        'email': email,
        'first_name': firstName,
        'last_name': lastName
      }),
    );
    // if (response.statusCode == 200) Created :)
    // if (response.statusCode == 400) Bad Request :( show error

    // if (response.statusCode == 201) Created :)
    // if (response.statusCode == 400) Bad Request :( show error

    if (response.statusCode == 201) {
      Map<String, dynamic> responseMap = (convert.jsonDecode(response.body));
      UserModel user = UserModel.fromJson(responseMap);
      // responseMap.forEach((k,v) => print('${k}: ${v}'));

      dynamic returnList = [true, user];
      return returnList;
    }
    // if (response.statusCode == 400)
    else {
      
      Map<String, dynamic> responseMap = (convert.jsonDecode(response.body));
      // responseMap.forEach((k, v) => print('${k}: ${v}'));

      dynamic returnList = [false, responseMap];
      return returnList;
    }
  }

    Future<List> accountLogin({
      @required String username,
    @required String password,
    }) async {
    final urlExtention = 'API/account/token/';

    final response = await http.post(
      (Uri.http(
        baseUrl,
        urlExtention,
      )),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>{
        'username': username,
        'password': password
      }),
    );
    // if (response.statusCode == 200) Created :)
    // if (response.statusCode == 400) Bad Request :( show error

    // if (response.statusCode == 201) Created :)
    // if (response.statusCode == 400) Bad Request :( show error

    if (response.statusCode == 201) {
      Map<String, dynamic> responseMap = (convert.jsonDecode(response.body));
      // UserModel user = UserModel.fromJson(responseMap);
      responseMap.forEach((k,v) => print('${k}: ${v}'));

      // dynamic returnList = [true, user];
      // return returnList;
    }
    // if (response.statusCode == 400)
    else {
      print(response.statusCode);
      Map<String, dynamic> responseMap = (convert.jsonDecode(response.body));
      responseMap.forEach((k, v) => print('${k}: ${v}'));

      // dynamic returnList = [false, responseMap];
      // return returnList;
    }
  }

}
