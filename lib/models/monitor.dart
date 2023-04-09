import 'package:json_annotation/json_annotation.dart';
part 'monitor.g.dart';

// serial number
// model
// inventory number
// employee

@JsonSerializable()
class Monitor {
  int? id;
  String serialnumber;
  String model;
  String invontorynumber;
  int employee;

  Monitor({
    this.id,
    required this.serialnumber,
    required this.model,
    required this.invontorynumber,
    required this.employee,
  });
  factory Monitor.fromJson(Map<String, dynamic> json) =>
      _$MonitorFromJson(json);
  Map<String, dynamic> toJson() => _$MonitorToJson(this);
}
