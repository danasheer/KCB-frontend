// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Computer _$ComputerFromJson(Map<String, dynamic> json) => Computer(
      id: json['id'] as int?,
      ip: json['ip'] as String,
      name: json['name'] as String,
      model: json['model'] as String,
      serialnumber: json['serialnumber'] as String,
      macaddress: json['macaddress'] as String,
      invontorynumber: json['invontorynumber'] as String,
      department: json['department'] as int,
      employee: json['employee'] as int,
    );

Map<String, dynamic> _$ComputerToJson(Computer instance) => <String, dynamic>{
      'id': instance.id,
      'ip': instance.ip,
      'name': instance.name,
      'model': instance.model,
      'serialnumber': instance.serialnumber,
      'macaddress': instance.macaddress,
      'invontorynumber': instance.invontorynumber,
      'department': instance.department,
      'employee': instance.employee,
    };
