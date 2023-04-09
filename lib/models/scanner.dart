import 'package:json_annotation/json_annotation.dart';
part 'scanner.g.dart';

@JsonSerializable()
class Scanner {
  int? id;
  String serialnumber;
  String invontorynumber;
  int employee;

  Scanner({
    this.id,
    required this.serialnumber,
    required this.invontorynumber,
    required this.employee,
  });
  factory Scanner.fromJson(Map<String, dynamic> json) =>
      _$ScannerFromJson(json);
  Map<String, dynamic> toJson() => _$ScannerToJson(this);
}
