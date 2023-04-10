import 'package:flutter/material.dart';

import 'package:kcb/models/printer.dart';
import 'package:kcb/services/printer_services.dart';

class PrinterProvider with ChangeNotifier {
  List<Printer> printers = [];

  Future<void> getPrinters() async {
    printers = await PrinterServices().getPrinters();
    print(printers);
    notifyListeners();
  }
}
