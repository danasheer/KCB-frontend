import 'package:json_annotation/json_annotation.dart';
import 'package:kcb/models/employee.dart';
part 'department.g.dart';

@JsonSerializable()
class Department {
  int? id;
  String name;
  int floor;
  List<Employee>? employees;

  Department({
    this.id,
    required this.name,
    required this.floor,
    this.employees,
  });
  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
