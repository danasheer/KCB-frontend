import 'package:flutter/material.dart';
import 'package:kcb/models/computer.dart';
import 'package:kcb/services/computer_services.dart';

class ComputerProvider extends ChangeNotifier {
  List<Computer> computers = [];

  Future<void> getComputers() async {
    computers = await ComputerServices().getComputers();
    print(computers);
    print("PROVIDERRR");
    notifyListeners();
  }
}
