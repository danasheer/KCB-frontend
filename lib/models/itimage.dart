import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'itimage.g.dart';

@JsonSerializable()
class ItImage {
  String image;

  ItImage({
    required this.image,
  });
  factory ItImage.fromJson(Map<String, dynamic> json) =>
      _$ItImageFromJson(json);
  Map<String, dynamic> toJson() => _$ItImageToJson(this);
}
