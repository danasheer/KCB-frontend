import 'package:dio/dio.dart';
import 'client_services.dart';
import '../models/user.dart';

class AuthServices {
  final client = Client.dio;

  Future<String> signin(
      {required String username, required String password}) async {
    String token = "";
    try {
      Response response = await Client.dio.post('/api/login/',
          data: {'username': username, 'password': password});
      token = response.data["access"];
      print("HURRAAAY: you signed in and your token is:\n $token");
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}
