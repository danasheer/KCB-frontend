import "package:dio/dio.dart";
import 'package:kcb/models/department.dart';
import 'package:kcb/models/employee.dart';
import 'package:kcb/services/client_services.dart';

class DepartmentServices {
  final Dio client = Client.dio;

  Future<List<Department>> getDepartments() async {
    List<Department> departments = [];
    try {
      Response response = await client.get('api/departments/');
      final jsonList = response.data as List;
      print(jsonList);

      departments = jsonList
          .map((department) => Department.fromJson(department))
          .toList();
      print(departments);
    } on DioError catch (error) {
      print(error);
    }
    return departments;
  }

  Future<Department> getDepartmentsDetails(id) async {
    Department department =
        Department(id: 0, name: "", floor: 0, employees: []);
    try {
      Response response = await client.get('api/departments/detail/$id/');
      print(response);
      department = Department.fromJson(response.data);
    } on DioError catch (error) {
      print(error);
    }
    return department;
  }

  Future<Employee> getDepartmentsEmployee(id) async {
    Employee employee = Employee(
        id: 0,
        name: "",
        department: 0,
        position: "",
        computers: [],
        monitors: [],
        scanners: []);

    try {
      Response response = await client.get('api/departments/employee/$id/');

      print(response);

      employee = Employee.fromJson(response.data);
    } on DioError catch (error) {
      print(error);
    }
    return employee;
  }
}
