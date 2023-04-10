import "package:dio/dio.dart";
import 'package:kcb/models/computer.dart';
import 'package:kcb/services/client_services.dart';

class ComputerServices {
  final Dio client = Client.dio;

  Future<List<Computer>> getComputers() async {
    List<Computer> computers = [];
    try {
      Response response = await client.get('api/computers/');
      final jsonList = response.data as List;
      print(jsonList);
      computers =
          jsonList.map((computer) => Computer.fromJson(computer)).toList();
      print(computers);
    } on DioError catch (error) {
      print(error);
    }
    return computers;
  }
}
