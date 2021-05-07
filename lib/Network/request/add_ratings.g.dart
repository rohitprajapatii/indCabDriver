// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRatings _$AddRatingsFromJson(Map<String, dynamic> json) {
  return AddRatings(
    userId: json['userId'] as int,
    carWithDriverId: json['carWithDriverId'] as int,
    billAmount: json['billAmount'] as String,
    rideDateTime: json['rideDateTime'] as String,
    rating: json['rating'] as String,
    reviews: json['reviews'] as String,
    tipsAmount: json['tipsAmount'] as String,
  );
}

Map<String, dynamic> _$AddRatingsToJson(AddRatings instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'carWithDriverId': instance.carWithDriverId,
      'billAmount': instance.billAmount,
      'rideDateTime': instance.rideDateTime,
      'rating': instance.rating,
      'reviews': instance.reviews,
      'tipsAmount': instance.tipsAmount,
    };
