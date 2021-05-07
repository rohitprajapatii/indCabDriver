// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) {
  return DefaultResponse(
    msg: json['msg'] as String,
    statusCode: json['statusCode'] as int,
  );
}

Map<String, dynamic> _$DefaultResponseToJson(DefaultResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'statusCode': instance.statusCode,
    };
