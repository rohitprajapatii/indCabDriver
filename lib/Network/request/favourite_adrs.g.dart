// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_adrs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteAdrs _$FavouriteAdrsFromJson(Map<String, dynamic> json) {
  return FavouriteAdrs(
    userId: json['userId'] as int,
    favoriteType: json['favoriteType'] as String,
    favoriteAddress: json['favoriteAddress'] as String,
  );
}

Map<String, dynamic> _$FavouriteAdrsToJson(FavouriteAdrs instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'favoriteType': instance.favoriteType,
      'favoriteAddress': instance.favoriteAddress,
    };
