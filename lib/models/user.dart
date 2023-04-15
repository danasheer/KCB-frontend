import 'package:json_annotation/json_annotation.dart';
import 'package:kcb/models/itimage.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String username;
  String? password;
  ItImage? profile;

  User({
    this.id,
    required this.username,
    this.password,
    this.profile,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
