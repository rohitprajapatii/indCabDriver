import 'package:json_annotation/json_annotation.dart';

part 'add_ratings.g.dart';

@JsonSerializable()
class AddRatings{
  int userId;
  int carWithDriverId;
  String billAmount;
  String rideDateTime;
  String rating;
  String reviews;
  String tipsAmount;

  AddRatings({this.userId, this.carWithDriverId,this.billAmount, this.rideDateTime, this.rating, this.reviews, this.tipsAmount});

  factory AddRatings.fromJson(Map<String, dynamic> json) => _$AddRatingsFromJson(json);
  Map<String, dynamic> toJson() => _$AddRatingsToJson(this);

}