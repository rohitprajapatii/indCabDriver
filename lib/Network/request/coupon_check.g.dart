// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponCheck _$CouponCheckFromJson(Map<String, dynamic> json) {
  return CouponCheck(
    userId: json['userId'] as String,
    couponCode: json['couponCode'] as String,
  );
}

Map<String, dynamic> _$CouponCheckToJson(CouponCheck instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'couponCode': instance.couponCode,
    };
