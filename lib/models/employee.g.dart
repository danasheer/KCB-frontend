// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as int?,
      name: json['name'] as String,
      position: json['position'] as String,
      department: json['department'] as int,
      computers: (json['computers'] as List<dynamic>?)
          ?.map((e) => Computer.fromJson(e as Map<String, dynamic>))
          .toList(),
      monitors: (json['monitors'] as List<dynamic>?)
          ?.map((e) => Monitor.fromJson(e as Map<String, dynamic>))
          .toList(),
      scanners: (json['scanners'] as List<dynamic>?)
          ?.map((e) => Scanner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'department': instance.department,
      'computers': instance.computers,
      'monitors': instance.monitors,
      'scanners': instance.scanners,
    };
