import 'package:get_storage/get_storage.dart';

class ApiService {
  // static String baseUrl = "http://192.168.0.102:3002/api";
  static String baseUrl = "http://192.168.155.53:3002/api";
  // static String baseUrl = "http://192.168.1.18:3002/api";
  static String token = "";
  static String uid = "";
  final storage = GetStorage();
  ApiService() {
    token = storage.read('token') ?? "";
    uid = storage.read('uid') ?? "";
  }
  get uId => storage.read('uid');

  setToken(String token) {
    print(token);
    storage.write('token', token);
  }

  setUid(String uid) {
    storage.write('uid', uid);
  }
}
