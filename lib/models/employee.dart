import 'package:json_annotation/json_annotation.dart';
part 'employee.g.dart';

@JsonSerializable()
class Employee {
  int? id;
  String name;
  String position;
  int department;

  Employee({
    this.id,
    required this.name,
    required this.position,
    required this.department,
  });
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
