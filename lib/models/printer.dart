import 'package:json_annotation/json_annotation.dart';

part 'printer.g.dart';

@JsonSerializable()
class Printer {
  int? id;
  String ip;
  String serialnumber;
  String model;
  String invontorynumber;
  int department;

  Printer({
    this.id,
    required this.ip,
    required this.serialnumber,
    required this.model,
    required this.invontorynumber,
    required this.department,
  });
  factory Printer.fromJson(Map<String, dynamic> json) =>
      _$PrinterFromJson(json);
  Map<String, dynamic> toJson() => _$PrinterToJson(this);
}
