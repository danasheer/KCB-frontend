import 'package:flutter/material.dart';
import 'package:kcb/models/scanner.dart';
import 'package:kcb/services/scanner_services.dart';

class ScannerProvider with ChangeNotifier {
  List<Scanner> scanners = [];

  Future<void> getScanners() async {
    scanners = await ScannerServices().getScanners();
    notifyListeners();
  }
}
