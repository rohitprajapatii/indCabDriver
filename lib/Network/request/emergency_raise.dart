import 'package:json_annotation/json_annotation.dart';

part 'emergency_raise.g.dart';

@JsonSerializable()
class Emergecy_Raise{
  int bookingId;
  int userId;

  Emergecy_Raise({this.bookingId, this.userId,});

  factory Emergecy_Raise.fromJson(Map<String, dynamic> json) => _$Emergecy_RaiseFromJson(json);
  Map<String, dynamic> toJson() => _$Emergecy_RaiseToJson(this);

}