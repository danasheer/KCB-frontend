import "package:dio/dio.dart";
import 'package:kcb/models/monitor.dart';
import 'package:kcb/services/client_services.dart';

class MonitorServices {
  final Dio client = Client.dio;

  Future<List<Monitor>> getMonitors() async {
    List<Monitor> monitors = [];
    try {
      Response response = await client.get('api/monitors/');
      final jsonList = response.data as List;
      print(jsonList);
      monitors = jsonList.map((monitor) => Monitor.fromJson(monitor)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return monitors;
  }
}
