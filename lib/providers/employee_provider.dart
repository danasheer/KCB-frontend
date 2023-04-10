import 'package:flutter/material.dart';
import 'package:kcb/models/employee.dart';
import 'package:kcb/services/employee_services.dart';

class EmployeeProvider extends ChangeNotifier {
  List<Employee> employees = [];

  Future<void> getEmployees() async {
    employees = await EmployeeServices().getEmployee();
    print(employees);
    print("PROVIDERRR");
    notifyListeners();
  }
}
