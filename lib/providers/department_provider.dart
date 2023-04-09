import 'package:flutter/material.dart';
import 'package:kcb/models/department.dart';
import 'package:kcb/services/department_services.dart';

class DepartmentProvider with ChangeNotifier {
  List<Department> _departments = [];
  List<Department> get departments => _departments;

  Future<void> getDepartments() async {
    _departments = await DepartmentServices().getDepartments();
    notifyListeners();
  }
}
