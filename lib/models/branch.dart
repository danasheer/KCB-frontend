import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kcb/models/department.dart';
part 'branch.g.dart';

@JsonSerializable()
class Branch {
  int? id;
  String name;
  String? image;
  List<Department>? departments;

  Branch({
    this.id,
    required this.name,
    this.image,
    this.departments,
  });
  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
