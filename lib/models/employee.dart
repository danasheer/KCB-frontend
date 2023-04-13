import 'package:json_annotation/json_annotation.dart';
import 'package:kcb/models/computer.dart';
import 'package:kcb/models/monitor.dart';
import 'package:kcb/models/scanner.dart';
part 'employee.g.dart';

@JsonSerializable()
class Employee {
  int? id;
  String name;
  String position;
  int department;
  List<Computer>? computers;
  List<Monitor>? monitors;
  List<Scanner>? scanners;

  Employee({
    this.id,
    required this.name,
    required this.position,
    required this.department,
    this.computers,
    this.monitors,
    this.scanners,
  });
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
