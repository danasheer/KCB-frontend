import 'package:json_annotation/json_annotation.dart';
part 'floor.g.dart';

@JsonSerializable()
class Floor {
  int? id;
  int number;
  int branch;

  Floor({
    this.id,
    required this.number,
    required this.branch,
  });
  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);
  Map<String, dynamic> toJson() => _$FloorToJson(this);
}
