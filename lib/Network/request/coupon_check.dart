import 'package:json_annotation/json_annotation.dart';

part 'coupon_check.g.dart';

@JsonSerializable()
class CouponCheck{
  String userId;
  String couponCode;

  CouponCheck({this.userId,this.couponCode,});

  factory CouponCheck.fromJson(Map<String, dynamic> json) => _$CouponCheckFromJson(json);
  Map<String, dynamic> toJson() => _$CouponCheckToJson(this);

}