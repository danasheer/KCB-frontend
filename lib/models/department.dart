import 'package:json_annotation/json_annotation.dart';
part 'department.g.dart';

@JsonSerializable()
class Department {
  int? id;
  int number;
  int floor;

  Department({
    this.id,
    required this.number,
    required this.floor,
  });
  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
