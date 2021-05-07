// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_his.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookinHis _$BookinHisFromJson(Map<String, dynamic> json) {
  return BookinHis(
    createdDate: json['createdDate'] as String,
    tripType: json['tripType'] as String,
    pickUpLocation: json['pickUpLocation'] as String,
    payment: json['payment'],
  );
}

Map<String, dynamic> _$BookinHisToJson(BookinHis instance) => <String, dynamic>{
      'createdDate': instance.createdDate,
      'tripType': instance.tripType,
      'pickUpLocation': instance.pickUpLocation,
      'payment': instance.payment,
    };
