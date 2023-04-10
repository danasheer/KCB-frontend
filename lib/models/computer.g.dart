// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Computer _$ComputerFromJson(Map<String, dynamic> json) => Computer(
      id: json['id'] as int,
      ip: json['ip'] as String,
      computername: json['computername'] as String,
      model: json['model'] as String,
      serialnumber: json['serialnumber'] as String,
      macaddress: json['macaddress'] as String,
      invontorynumber: json['invontorynumber'] as String,
      employee: json['employee'] as int,
    );

Map<String, dynamic> _$ComputerToJson(Computer instance) => <String, dynamic>{
      'id': instance.id,
      'ip': instance.ip,
      'computername': instance.computername,
      'model': instance.model,
      'serialnumber': instance.serialnumber,
      'macaddress': instance.macaddress,
      'invontorynumber': instance.invontorynumber,
      'employee': instance.employee,
    };
