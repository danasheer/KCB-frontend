import "package:dio/dio.dart";

import 'package:kcb/models/scanner.dart';
import 'package:kcb/services/client_services.dart';

class ScannerServices {
  final Dio client = Client.dio;

  Future<List<Scanner>> getScanners() async {
    List<Scanner> scanners = [];
    try {
      Response response = await client.get('api/scanners/');
      final jsonList = response.data as List;
      print(jsonList);
      scanners = jsonList.map((scanner) => Scanner.fromJson(scanner)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return scanners;
  }
}
