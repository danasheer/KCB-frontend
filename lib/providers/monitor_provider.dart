import 'package:flutter/material.dart';
import 'package:kcb/models/monitor.dart';
import 'package:kcb/services/monitor_services.dart';

class MonitorProvider with ChangeNotifier {
  List<Monitor> monitors = [];

  Future<void> getMonitors() async {
    monitors = await MonitorServices().getMonitors();
    print(monitors);
    notifyListeners();
  }
}
