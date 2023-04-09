// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scanner _$ScannerFromJson(Map<String, dynamic> json) => Scanner(
      id: json['id'] as int?,
      serialnumber: json['serialnumber'] as String,
      invontorynumber: json['invontorynumber'] as String,
      employee: json['employee'] as int,
    );

Map<String, dynamic> _$ScannerToJson(Scanner instance) => <String, dynamic>{
      'id': instance.id,
      'serialnumber': instance.serialnumber,
      'invontorynumber': instance.invontorynumber,
      'employee': instance.employee,
    };
