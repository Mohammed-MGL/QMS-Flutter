import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = new FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  Future<String> readToken() async {
    var res = await storage.read(key: "token");
    return res;
  }

  Future<void> deleteToken() async {
    await storage.delete(key: "token");
  }

  Future<void> saveFCMToken(String token) async {
    await storage.write(key: "FCMtoken", value: token);
  }

  Future<String> readFCMToken() async {
    var res = await storage.read(key: "FCMtoken");
    return res;
  }

  Future<void> deleteFCMToken() async {
    await storage.delete(key: "FCMtoken");
  }

// // Read value
//   String value = await storage.read(key: key);

// // Read all values
// Map<String, String> allValues = await storage.readAll();

// // Delete value
// await storage.delete(key: key);

// // Delete all
// await storage.deleteAll();

// // Write value
// await storage.write(key: key, value: value);

}
