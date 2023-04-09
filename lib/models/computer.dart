import 'package:json_annotation/json_annotation.dart';
part 'computer.g.dart';

@JsonSerializable()
class Computer {
  int? id;
  String ip;
  String name;
  String model;
  String serialnumber;
  String macaddress;
  String invontorynumber;
  int department;
  int employee;

  Computer({
    this.id,
    required this.ip,
    required this.name,
    required this.model,
    required this.serialnumber,
    required this.macaddress,
    required this.invontorynumber,
    required this.department,
    required this.employee,
  });
  factory Computer.fromJson(Map<String, dynamic> json) =>
      _$ComputerFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerToJson(this);
}
