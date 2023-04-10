import "package:dio/dio.dart";
import 'package:kcb/models/printer.dart';
import 'package:kcb/services/client_services.dart';

class PrinterServices {
  final Dio client = Client.dio;

  Future<List<Printer>> getPrinters() async {
    List<Printer> printers = [];
    try {
      Response response = await client.get('api/printers/');

      final jsonList = response.data as List;
      print(jsonList);
      print("this is printer service");

      printers = jsonList.map((printer) => Printer.fromJson(printer)).toList();
    } on DioError catch (error) {
      print(error);
    }
    return printers;
  }
}
