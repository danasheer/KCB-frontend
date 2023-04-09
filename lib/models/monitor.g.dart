// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Monitor _$MonitorFromJson(Map<String, dynamic> json) => Monitor(
      id: json['id'] as int?,
      serialnumber: json['serialnumber'] as String,
      model: json['model'] as String,
      invontorynumber: json['invontorynumber'] as String,
      employee: json['employee'] as int,
    );

Map<String, dynamic> _$MonitorToJson(Monitor instance) => <String, dynamic>{
      'id': instance.id,
      'serialnumber': instance.serialnumber,
      'model': instance.model,
      'invontorynumber': instance.invontorynumber,
      'employee': instance.employee,
    };
