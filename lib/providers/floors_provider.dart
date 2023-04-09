import 'package:flutter/material.dart';
import 'package:kcb/models/floor.dart';
import 'package:kcb/services/floors_services.dart';

class FloorsProvider with ChangeNotifier {
  List<Floor> _floors = [];
  List<Floor> get floors => _floors;

  Future<void> getFloors() async {
    _floors = await FloorServices().getFloors();
    notifyListeners();
  }
}
