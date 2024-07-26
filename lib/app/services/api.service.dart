import 'package:get_storage/get_storage.dart';

class ApiService {
  static String baseUrl = "http://192.168.0.102:3002/api";
  // static String baseUrl = "http://192.168.1.18:3002/api";
  static String token = "";
  final storage = GetStorage();
  ApiService() {
    token = storage.read('token') ?? "";
  }
  setToken(String token) {
    print(token);
    storage.write('token', token);
  }
}
