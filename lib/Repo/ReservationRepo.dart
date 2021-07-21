import 'package:http/http.dart' as http;
import 'package:qms/Model/ReservationModel.dart';
import 'package:qms/Repo/Storage.dart';
import 'dart:convert' as convert;

class ReservationRepo {
  Storage storage = Storage();

  String baseUrl = "192.168.243.191:8000";
  // testurl = 'http://127.0.0.1:8000/API/Service_Center_detail/';

  Future<List> getReservation(int pagenum) async {
    final urlExtention = '/API/UserReservations/';
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
      ReservationModel rs =
          ReservationModel.fromJson(convert.jsonDecode(response.body));
      dynamic returnList = [1, rs];

      return returnList;
    } else if (response.statusCode == 401) {
      storage.deleteToken();
      dynamic returnList = [2];

      return returnList;
    }
  }
  
}
