// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReg _$UserRegFromJson(Map<String, dynamic> json) {
  return UserReg(
    userId: json['userId'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    mobileNumber: json['mobileNumber'] as String,
    emergencyMobileNumber: json['emergencyMobileNumber'] as String,
    isActive: json['isActive'] as bool,
    isDelete: json['isDelete'] as bool,
  );
}

Map<String, dynamic> _$UserRegToJson(UserReg instance) => <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'emergencyMobileNumber': instance.emergencyMobileNumber,
      'isActive': instance.isActive,
      'isDelete': instance.isDelete,
    };
