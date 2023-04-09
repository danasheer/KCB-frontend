import 'package:flutter/material.dart';
import 'package:kcb/models/monitor.dart';
import 'package:kcb/services/monitor_services.dart';

class MonitorProvider with ChangeNotifier {
  List<Monitor> _monitors = [];
  List<Monitor> get monitors => _monitors;

  Future<void> getMonitors() async {
    _monitors = await MonitorServices().getMonitors();
    notifyListeners();
  }
}
