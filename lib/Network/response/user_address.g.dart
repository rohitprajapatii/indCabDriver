// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) {
  return UserAddress(
    favouriteId: json['favouriteId'] as int,
    userId: json['userId'] as int,
    favoriteType: json['favoriteType'] as String,
    favoriteAddress: json['favoriteAddress'] as String,
    createdDate: json['createdDate'] as String,
  );
}

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'favouriteId': instance.favouriteId,
      'userId': instance.userId,
      'favoriteType': instance.favoriteType,
      'favoriteAddress': instance.favoriteAddress,
      'createdDate': instance.createdDate,
    };
