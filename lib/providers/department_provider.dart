import 'package:flutter/material.dart';
import 'package:kcb/models/department.dart';
import 'package:kcb/models/employee.dart';
import 'package:kcb/services/department_services.dart';

class DepartmentProvider with ChangeNotifier {
  List<Department> departments = [];
  Department department = Department(id: 0, name: "", floor: 0, employees: []);
  Employee employee = Employee(
      id: 0,
      name: "",
      department: 0,
      position: "",
      computers: [],
      monitors: [],
      scanners: []);

  Future<void> getDepartments() async {
    departments = await DepartmentServices().getDepartments();
    print(departments);
    notifyListeners();
  }

  Future<void> getDepartmentsDetails(id) async {
    department = await DepartmentServices().getDepartmentsDetails(id);

    print(department);
    notifyListeners();
  }

  Future<void> getDepartmentEmployee(id) async {
    employee = await DepartmentServices().getDepartmentsEmployee(id);
    print("222");
    notifyListeners();
  }
}
