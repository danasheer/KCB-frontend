import "package:dio/dio.dart";
import 'package:kcb/models/department.dart';
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
    } on DioError catch (error) {
      print(error);
    }
    return departments;
  }
}
