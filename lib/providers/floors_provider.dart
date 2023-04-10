import 'package:flutter/material.dart';
import 'package:kcb/models/floor.dart';
import 'package:kcb/services/floors_services.dart';

class FloorsProvider with ChangeNotifier {
  List<Floor> floors = [];

  Future<void> getFloors() async {
    floors = await FloorServices().getFloors();
    print(floors);

    notifyListeners();
  }
}
