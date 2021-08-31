import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:qms/Model/UserModel.dart';
import 'package:qms/pages/LoginPage.dart';
import 'dart:convert' as convert;

import 'Storage.dart';

class AccountRepo {
  Storage storage = Storage();

  String baseUrl = "192.168.108.98:8000";
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
    final urlExtention = 'API/account/login/';

    final response = await http.post(
      (Uri.http(
        baseUrl,
        urlExtention,
      )),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseMap = (convert.jsonDecode(response.body));
      String token = responseMap["access"];
      storage.saveToken(token);
      print(token);

      dynamic returnList = [true, token];
      return returnList;
    } else if (response.statusCode == 401) {
      String errorMsg = "username and password do not match!";

      dynamic returnList = [false, errorMsg];
      return returnList;
    } else {
      print(response.statusCode);
      Map<String, dynamic> responseMap = (convert.jsonDecode(response.body));
      print(responseMap);
      responseMap.forEach((k, v) => print('$k: $v'));
      String errorMsg = "error something went wrong";
      dynamic returnList = [false, errorMsg];
      return returnList;
    }
  }

Future<List> changePass({
    @required String old_password,
    @required String password,

    @required String password2,

  }) async {
    final urlExtention = 'API/account/change_password/';
    String token = await storage.readToken();

    final response = await http.put(
      (Uri.http(
        baseUrl,
        urlExtention,
      )),
      headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token',
      },
      body: convert.jsonEncode(
          <String, String>{'old_password': old_password, 'password': password, 'password2':password2}),
    );

    if (response.statusCode == 200) {
      UserModel rs = UserModel.fromJson(convert.jsonDecode(response.body));
      dynamic returnList = [1, rs];

      return returnList;
    } else if (response.statusCode == 401) {
      storage.deleteToken();
      dynamic returnList = [2];

      return returnList;
    }
    else {
      print(response.body);
            dynamic returnList = [3];
                  return returnList;


    }
  }

  Future<bool> isLogin() async {
    // storage.deleteToken();

    var t = await storage.readToken();
    print(t);
    if (t == '') return false;

    return true;
  }

  Future<List> getUserInfo() async {
    String baseUrl = "192.168.108.98:8000";
    final urlExtention = '/API/account/profile/';
    String token = await storage.readToken();

    final response = await http.get(
      (Uri.http(baseUrl, urlExtention)),
      headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      UserModel rs = UserModel.fromJson(convert.jsonDecode(response.body));
      dynamic returnList = [1, rs];

      return returnList;
    } else if (response.statusCode == 401) {
      storage.deleteToken();
      dynamic returnList = [2];

      return returnList;
    }
  }

  Future<Void> sendFCMtoken() async {
    String baseUrl = "192.168.108.98:8000";
    final urlExtention = '/API/account/register/FCMtoken/';
    String token = await storage.readToken();
    String fCMtoken = await storage.readFCMToken();
    final response = await http.post(
      (Uri.http(
        baseUrl,
        urlExtention,
      )),
      headers: <String, String>{
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        'Authorization': 'Bearer $token',
        
      },
      body: convert.jsonEncode(<String, String>{
        'registration_id': fCMtoken,
        'type': 'android',
        
      }),
       
      // body: convert.jsonEncode(<String, String>{
      //   "registration_id": fCMtoken,
      //    "type": "android"
      //   }),
    );
    print("response.body");
    var t = convert.jsonEncode(<String, String>{
        'registration_id': fCMtoken,
        'type': 'android'});
    print(t);
    
    print(response.body);
  }
  // 201 OK 400

  // if (response.statusCode == 201) {

  // print("OK");

  //   dynamic returnList = [true, token];
  //   return returnList;
  // } else if (response.statusCode == 401) {
  //   String errorMsg = "username and password do not match!";

  //   dynamic returnList = [false, errorMsg];
  //   return returnList;
  // } else {
  //   print(response.statusCode);
  //   Map<String, dynamic> responseMap = (convert.jsonDecode(response.body));
  //   print(responseMap);
  //   responseMap.forEach((k, v) => print('$k: $v'));
  //   String errorMsg = "error something went wrong";
  //   dynamic returnList = [false, errorMsg];
  //   return returnList;
  // }
  // }
}
