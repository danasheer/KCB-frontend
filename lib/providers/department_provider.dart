import 'package:flutter/material.dart';
import 'package:kcb/models/department.dart';
import 'package:kcb/services/department_services.dart';

class DepartmentProvider with ChangeNotifier {
  List<Department> departments = [];

  Future<void> getDepartments() async {
    departments = await DepartmentServices().getDepartments();
    print(departments);
    notifyListeners();
  }
}
