import 'package:dio/dio.dart';
import 'package:kcb/models/employee.dart';
import 'package:kcb/services/client_services.dart';

// class EmployeeServices {
//    Future<List<Employee>> getEmployees() async {
//     List<Employee> employees = [];
//     try {
//       Response response = await Client.dio.get('api/employees/');
//       final
//       List<Employee> employees = [];
//       for (var employee in response.data) {
//         employees.add(Employee.fromJson(employee));
//       }
//       return employees;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   static Future<Employee> getEmployee(int id) async {
//     try {
//       Response response = await ClientServices.get('/employees/$id');
//       return Employee.fromJson(response.data);
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

