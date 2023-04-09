// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'printer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Printer _$PrinterFromJson(Map<String, dynamic> json) => Printer(
      id: json['id'] as int?,
      ip: json['ip'] as String,
      serialnumber: json['serialnumber'] as String,
      model: json['model'] as String,
      invontorynumber: json['invontorynumber'] as String,
      department: json['department'] as int,
    );

Map<String, dynamic> _$PrinterToJson(Printer instance) => <String, dynamic>{
      'id': instance.id,
      'ip': instance.ip,
      'serialnumber': instance.serialnumber,
      'model': instance.model,
      'invontorynumber': instance.invontorynumber,
      'department': instance.department,
    };
