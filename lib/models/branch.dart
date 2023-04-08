import 'package:json_annotation/json_annotation.dart';
part 'branch.g.dart';

@JsonSerializable()
class Branch {
  int? id;
  String name;

  Branch({
    this.id,
    required this.name,
  });
  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
