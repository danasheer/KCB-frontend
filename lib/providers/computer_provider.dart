import 'package:flutter/material.dart';
import 'package:kcb/models/computer.dart';
import 'package:kcb/services/computer_services.dart';

class ComputerProvider with ChangeNotifier {
  List<Computer> _computers = [];
  List<Computer> get computers => _computers;

  Future<void> getComputers() async {
    _computers = await ComputerServices().getComputers();
    notifyListeners();
  }
}
