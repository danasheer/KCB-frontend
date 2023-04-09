import "package:dio/dio.dart";
import 'package:kcb/models/floor.dart';

import "package:kcb/services/client_services.dart";

class FloorServices {
  final Dio client = Client.dio;

  Future<List<Floor>> getFloors() async {
    List<Floor> floors = [];
    try {
      Response response = await client.get('api/floors/');
      final jsonList = response.data as List;
      floors = jsonList.map((floor) => Floor.fromJson(floor)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return floors;
  }
}
