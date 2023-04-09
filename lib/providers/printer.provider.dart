import 'package:flutter/material.dart';

import 'package:kcb/models/printer.dart';
import 'package:kcb/services/printer_services.dart';

class PrinterProvider with ChangeNotifier {
  List<Printer> _printers = [];
  List<Printer> get printers => _printers;

  Future<void> getPrinters() async {
    _printers = await PrinterServices().getPrinters();
    notifyListeners();
  }
}
