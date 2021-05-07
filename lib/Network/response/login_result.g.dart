// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) {
  return LoginResult(
    driverId: json['driverId'] as int,
    driverName: json['driverName'] as String,
    driverJoiningDate: json['driverJoiningDate'] as String,
    driverEmail: json['driverEmail'] as String,
    driverContactNo: json['driverContactNo'] as String,
    driverFatherName: json['driverFatherName'] as String,
    driverMotherName: json['driverMotherName'] as String,
  );
}

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'driverName': instance.driverName,
      'driverJoiningDate': instance.driverJoiningDate,
      'driverEmail': instance.driverEmail,
      'driverContactNo': instance.driverContactNo,
      'driverFatherName': instance.driverFatherName,
      'driverMotherName': instance.driverMotherName,
    };
