import 'package:flutter/material.dart';
import 'package:kcb/models/scanner.dart';
import 'package:kcb/services/scanner_services.dart';

class ScannerProvider with ChangeNotifier {
  List<Scanner> _scanners = [];
  List<Scanner> get scanners => _scanners;

  Future<void> getScanners() async {
    _scanners = await ScannerServices().getScanners();
    notifyListeners();
  }
}
