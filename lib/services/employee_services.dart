import 'package:dio/dio.dart';
import 'package:kcb/models/employee.dart';
import 'package:kcb/services/client_services.dart';

class EmployeeServices {
  final Dio client = Client.dio;

  Future<List<Employee>> getEmployee() async {
    List<Employee> employees = [];
    try {
      Response response = await client.get('api/employees/');
      final jsonList = response.data as List;
      print(jsonList);
      employees =
          jsonList.map((employee) => Employee.fromJson(employee)).toList();
      print(employees);
    } on DioError catch (error) {
      print(error);
    }
    return employees;
  }
}
